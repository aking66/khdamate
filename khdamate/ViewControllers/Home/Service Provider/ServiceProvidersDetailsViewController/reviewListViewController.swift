//
//  OrdersViewController.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 25/10/2021.
//

import UIKit
import DZNEmptyDataSet
import MIBlurPopup
import SONetwork

class reviewListViewController: UIViewController {
    var provider_id:NSNumber?
    @IBOutlet weak var rateBtn: UIButton!
    var hideBtn = false
    @IBOutlet weak var viewEmptyData: UIView!
    @IBOutlet weak var collectionView: GeneralCollectionView!{
        didSet{
            self.collectionView.selectionType = .single
            self.collectionView.minimumSelectionCount = 1
            self.collectionView.registerNib(NibName: OrdersTypeCollectionViewCell
                .className_)
        }
    }
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            self.tableView.registerNib(NibName: reviewProviderCell.className_)
            //            self.tableView.emptyDataIsVisible = true
            //            self.tableView.isPullToRefreshEnabled = true
            //            self.tableView.isLoadMoreEnabled = true
        }
    }
  
    
    var selectedType: OrderListType?{
        didSet{
            self.getDataFromServer()
        }
    }
    
    var rates = [KHRates]()
    var comments = [KHComments]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNavigationBG()
        self.getDataFromServer()
        self.setupView()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.emptyDataSetDelegate = self
        tableView.emptyDataSetSource = self
        rateBtn.isHidden = hideBtn
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let cellWidth = self.collectionView.width/CGFloat(OrderListType.allCasesSwich.count)
        self.collectionView.cellSize(CGSize(width: cellWidth, height: self.collectionView.height))
    }
    func fetchData() {
        var dic2 : HTTPHeaders = [
            "Content-Language" : "\(UserProfile.sharedInstance.isRTL() == true ? "ar" : "en")",
            "device-os" : "ios",
            "Authorization" : "Bearer \(UserProfile.sharedInstance.currentUserToken ?? "")"
        ]
        self.showHideLoaderView(showLoader: true)


        SO.request("GET", url:  GlobalConstants.API_Provider_getProvider_Controller +  "/provider/\(provider_id ?? 0)" , header:dic2, parameters: [:], success: { (jsonString) in
                    let data = jsonString?.data(using: .utf8)!
//            print("json : \(parsedData)")
                if let serverResponse = try? JSONDecoder().decode(KHProvider.self, from: data!){
                    print("json : \(serverResponse)")
                    DispatchQueue.main.async {
                        
                        self.setupView()
                        self.comments = serverResponse.result?.comments ?? []
                        self.rates = serverResponse.result?.rates ?? []
                        self.tableView.reloadData()
                        self.showHideLoaderView(showLoader: false)

                    }

                    } else {
                        print("bad json - do some recovery")
                        self.showHideLoaderView(showLoader: false)

                    }
                    
                }) { (error) in
                    self.showHideLoaderView(showLoader: false)

                }
 
    }
    func setupView() {
        self.collectionView.clearData(true)
        for type in OrderListType.allCasesSwich {
            self.collectionView.objects.append(GeneralCollectionViewData(reuseIdentifier: OrdersTypeCollectionViewCell.className_, object: type))
        }
        self.selectedType = OrderListType.allCasesSwich.first ?? .comments
        self.collectionView.addRemoveSelectedObject(self.selectedType)
        self.collectionView.reloadData()
        
        self.collectionView.didChangeSelectionFunc { (selectedObjects) in
            self.selectedType = selectedObjects.first as? OrderListType
        }
    }
    
    
    @IBAction func btnComment(_ sender: Any) {
        let vc = RateProviderViewController.initiateInstance(storyboard: .main) as! RateProviderViewController
//        vc.b_payOnly = true
//        vc.completionBlock = { selectedPayment in
//            vc.dismiss(animated: true) {
////                self.sendActionToServer(accept: NSNumber(value: true))
//            }
//        }
        vc.provider_id = provider_id
        vc.parentVC = self
        vc.selectedType = self.selectedType!
        MIBlurPopup.show(vc, on: self)
    }
    func getDataFromServer() {
        tableView.reloadData()
    }
    
    func setEmptyDataView() {
        if self.selectedType == .comments {
            if comments.count == 0 {
                tableView.isHidden = true
                //                viewEmptyData.isHidden = false
            }
        } else {
            if rates.count == 0 {
                tableView.isHidden = true
                //                viewEmptyData.isHidden = false
            }
        }
    }
}


extension reviewListViewController: UITableViewDataSource, UITableViewDelegate, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch self.selectedType {
        
        case .comments:
            return comments.count
        default:
            return rates.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
            let cell = tableView.dequeueReusableCell(withIdentifier: "reviewProviderCell", for: indexPath) as! reviewProviderCell
        switch self.selectedType {
        
        case .comments:
            cell.comment = self.comments[indexPath.row]
        default:
            cell.rate = self.rates[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension

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
