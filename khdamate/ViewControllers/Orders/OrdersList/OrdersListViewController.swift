//
//  OrdersViewController.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 25/10/2021.
//

import UIKit
import DZNEmptyDataSet

class OrdersListViewController: UIViewController {
    
    @IBOutlet weak var viewEmptyData: UIView!
    @IBOutlet weak var collectionView: GeneralCollectionView!{
        didSet{
            self.collectionView.selectionType = .single
            self.collectionView.minimumSelectionCount = 1
            self.collectionView.registerNib(NibName: OrdersTypeCollectionViewCell.className_)
        }
    }
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            self.tableView.registerNib(NibName: OrderListTableViewCell.className_)
            //            self.tableView.emptyDataIsVisible = true
            //            self.tableView.isPullToRefreshEnabled = true
            //            self.tableView.isLoadMoreEnabled = true
        }
    }
    @IBOutlet weak var tableViewOffers: UITableView! {
        didSet{
            self.tableViewOffers.registerNib(NibName: OffersListTableViewCell.className_)
            self.tableViewOffers.registerNib(NibName: OffersEmptyListTableViewCell.className_)
            //            let nib = UINib(nibName: "CustomOffersListSectionHeaderView", bundle: nil)
            //            tableViewOffers.register(nib, forHeaderFooterViewReuseIdentifier: "CustomOffersListSectionHeaderView")
        }
    }
    @IBOutlet weak var tableViewNewOrders: GeneralTableView! {
        didSet{
            self.tableViewNewOrders.registerNib(NibName: HomeProviderTableViewCell.className_)
            self.tableViewNewOrders.emptyDataIsVisible = true
            self.tableViewNewOrders.isPullToRefreshEnabled = true
            self.tableViewNewOrders.isLoadMoreEnabled = true
            self.tableViewNewOrders.emptyDataSetTitle = "No new orders yet.".localize_
        }
    }
    
    var selectedType: OrderListType?{
        didSet{
            self.getDataFromServer()
        }
    }
    
    var offers = [TOrderOfferObject]()
    var orders = [TTabOrderObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNavigationBG()
        self.getDataFromServer()
        self.setupView()
        self.tableViewOffers.delegate = self
        self.tableViewOffers.dataSource = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableViewOffers.emptyDataSetDelegate = self
        tableViewOffers.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        tableView.emptyDataSetSource = self
        tableViewOffers.register(UINib(nibName: "CustomOffersListSectionHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "CustomOffersListSectionHeaderView")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let cellWidth = self.collectionView.width/CGFloat(OrderListType.allCases.count)
        self.collectionView.cellSize(CGSize(width: cellWidth, height: self.collectionView.height))
    }
    
    func setupView() {
        self.collectionView.clearData(true)
        for type in OrderListType.allCases {
            self.collectionView.objects.append(GeneralCollectionViewData(reuseIdentifier: OrdersTypeCollectionViewCell.className_, object: type))
        }
        self.selectedType = OrderListType.allCases.first ?? .offers
        self.collectionView.addRemoveSelectedObject(self.selectedType)
        self.collectionView.reloadData()
        
        self.collectionView.didChangeSelectionFunc { (selectedObjects) in
            self.selectedType = selectedObjects.first as? OrderListType
        }
    }
    
    func getDataFromServer() {
        if UserProfile.sharedInstance.currentUser?.b_provider == true {
            if selectedType == .new {
                tableViewOffers.isHidden = true
                tableView.isHidden = true
                tableViewNewOrders.isHidden = false
                let request = ServiceProviderRequest(.getNewOrders)
                RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { [weak self] (result) in
                    self?.tableViewNewOrders.objects = []
                    for order in result.orders {
                        self?.tableViewNewOrders.objects.append(GeneralTableViewData(reuseIdentifier: HomeProviderTableViewCell.className_, object: order, rowHeight: 122))
                    }
                    self?.tableViewNewOrders.reloadData()
                }
//                self.tableViewNewOrders.ofRequest(request)
//                    .reuseIdentifier(HomeProviderTableViewCell.className_)
//                    .handleResponse { (BaseResponse) -> [Any]? in
//                        AppDelegate.sharedInstance.setupFCM(application: UIApplication.shared)
//                        return BaseResponse.orders
//                    }.start()
            } else {
                //                viewEmptyData.isHidden = true
                tableViewOffers.isHidden = true
                tableView.isHidden = false
                tableViewNewOrders.isHidden = true
                let request = ServiceProviderRequest(.getOrders(status: selectedType?.rawValue))
                RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
                    self.orders = result.tabOrders
                    self.tableView.reloadData()
                }
            }
        } else {
            if self.selectedType == .offers {
                tableViewOffers.isHidden = false
                tableView.isHidden = true
                tableViewNewOrders.isHidden = true
                let request = OrderRequest(.getOrdersOffers)
                RequestWrapper.sharedInstance.makeRequest(request: request).execute(showLodaer: true) { result in
                    switch result {
                    case .responseSuccess(response: let response):
                        self.offers = response.orderOffers
                        self.tableViewOffers.reloadData()
                    case .responseError(response: let response):
                        if response.status?.codeNumber == 1 || response.status?.codeNumber == 0 {
                            self.offers = response.orderOffers
                            self.tableViewOffers.reloadData()
                        }
                    case .emptyResponse, .failure:
                        break
                    }
                }
            } else {
                tableViewOffers.isHidden = true
                tableView.isHidden = false
                tableViewNewOrders.isHidden = true
                let request = OrderRequest(.getOrders(status: selectedType?.rawValue))
                RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
                    self.orders = result.tabOrders
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func setEmptyDataView() {
        if self.selectedType == .offers {
            if offers.count == 0 {
                tableViewOffers.isHidden = true
                tableView.isHidden = true
                tableViewNewOrders.isHidden = true
                //                viewEmptyData.isHidden = false
            }
        } else {
            if orders.count == 0 {
                tableViewOffers.isHidden = true
                tableView.isHidden = true
                tableViewNewOrders.isHidden = true
                //                viewEmptyData.isHidden = false
            }
        }
    }
}

enum OrderListType: String {
    case offers
    case new
    case accepted
    case rejected
    case confirmed
    case comments
    case rates
    
 
    var s_title:String {
        switch self {
        case .offers:
            return "OrderListType_offers".localize_
        case .new:
            return "OrderListType_new".localize_
        case .accepted:
            return "OrderListType_current".localize_
        case .rejected:
            return "OrderListType_rejected".localize_
        case .confirmed:
            return "OrderListType_completed".localize_
        case .comments:
            return "Comments".localize_
        case .rates:
            return "Rates".localize_

        }
    }
    static var allCasesSwich:[OrderListType] {
        return [.comments, .rates]

    }
    static var allCases:[OrderListType] {
        if UserProfile.sharedInstance.currentUser?.b_provider == true {
            return [.new, .accepted, .confirmed, .rejected]
        } else {
            return [.offers, .new, .accepted, .confirmed, .rejected]
        }
    }
}


extension OrdersListViewController: UITableViewDataSource, UITableViewDelegate, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        switch tableView {
        case tableViewOffers:
            return offers.count
        case self.tableView:
            return orders.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case tableViewOffers:
            if offers[section].offers.count == 0 {
                return 1
            } else {
                return offers[section].offers.count
            }
        case self.tableView:
            return orders[section].items.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case tableViewOffers:
            if offers[indexPath.section].offers.count == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "OffersEmptyListTableViewCell", for: indexPath)
                cell.selectionStyle = .none
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "OffersListTableViewCell", for: indexPath) as! OffersListTableViewCell
                cell.orderObj = offers[indexPath.section]
                cell.obj = offers[indexPath.section].offers[indexPath.row]
                cell.configerCell(parentViewController: self, indexPath: indexPath)
                cell.selectionStyle = .none
                return cell
            }
        case self.tableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderListTableViewCell", for: indexPath) as! OrderListTableViewCell
            cell.obj = orders[indexPath.section].items[indexPath.row]
            cell.configerCell(parentViewController: self, indexPath: indexPath)
            cell.selectionStyle = .none
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderListTableViewCell", for: indexPath) as! OrderListTableViewCell
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case tableViewOffers:
            if let cell = tableView.cellForRow(at: indexPath) as? OffersListTableViewCell {
                cell.didSelect(indexPath: indexPath as NSIndexPath)
            }
        case self.tableView:
            if let cell = tableView.cellForRow(at: indexPath) as? OrderListTableViewCell {
                cell.didSelect(indexPath: indexPath as NSIndexPath)
            }
            break
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch tableView {
        case tableViewOffers:
            let header = self.tableViewOffers.dequeueReusableHeaderFooterView(withIdentifier: "CustomOffersListSectionHeaderView") as! CustomOffersListSectionHeaderView
            header.lblOrderNo.text = "#"+(offers[section].i_order_no?.stringValue ?? "")
            header.orderID = offers[section].i_order_id
            
            return header
        case self.tableView:
            let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 12))
            returnedView.backgroundColor = .white
            if UserProfile.sharedInstance.isRTL() {
                let label = UILabel(frame: CGRect(x: -50, y: -12, width: view.frame.size.width, height: 12))
                label.text = (orders[section].date ?? "")
                label.textColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 0.5)
                label.font = label.font.withSize(14)
                returnedView.addSubview(label)
            } else {
                let label = UILabel(frame: CGRect(x: 0, y: -12, width: view.frame.size.width, height: 12))
                label.text = (orders[section].date ?? "")
                label.textColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 0.5)
                label.font = label.font.withSize(14)
                returnedView.addSubview(label)
            }
            return returnedView
        default:
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch tableView {
        case tableViewOffers:
            return 30
        case self.tableView:
            return 12
        default:
            return 12
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch tableView {
        case tableViewOffers:
            if offers[indexPath.section].offers.count == 0 {
                return 70
            } else {
                return 130
            }
        case self.tableView:
            return 122
        default:
            return 122
        }
    }
    
    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString {
        let attributes: [AnyHashable: Any] = [NSAttributedString.Key.font: UIFont.init(name: AppFontName.regular, size: CGFloat(18.0))!, NSAttributedString.Key.foregroundColor:  UIColor.darkGray]
        return  NSAttributedString(string: "No Data To Show".localize_, attributes: attributes as? [NSAttributedString.Key : Any])
    }
    func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView!) -> Bool {
        return true
    }
    func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
        return true
    }
}
