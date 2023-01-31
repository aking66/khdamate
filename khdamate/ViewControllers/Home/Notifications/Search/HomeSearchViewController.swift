//
//  HomeSearchViewController.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 31/10/2021.
//

import UIKit

class HomeSearchViewController: UIViewController {

    @IBOutlet weak var viewSearch: HomeSearchView!
    @IBOutlet weak var collectionView: GeneralCollectionView!{
        didSet{
//            self.collectionView.emptyDataIsVisible = true
//            self.collectionView.registerNib(NibName: HomeCategoryCollectionViewCell.className)
        }
    }
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            self.tableView.registerNib(NibName: "HomeSearchListTableViewCell")
        }
    }
    
    var screenType:HomeSearchVCType = .list
    var didSelect:((_ obj:Any?)->Void)?
    var searchResults = [TSearchResultObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setupView() {
        self.viewSearch.didFinish = { txt in
            let request = ServiceDetailsRequest(.searchServices(text: txt))
            RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
                self.searchResults = result.searchResults
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

extension HomeSearchViewController {
    enum HomeSearchVCType {
        case list
        case selection
    }
}

extension HomeSearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults[section].service_details.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeSearchListTableViewCell", for: indexPath) as! HomeSearchListTableViewCell
        cell.obj = searchResults[indexPath.section]
        cell.configerCell(parentViewController: self, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? HomeSearchListTableViewCell {
            cell.didSelect(indexPath: indexPath as NSIndexPath)
        }
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return offers[section].i_order_no
//    }
//
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 12))
        returnedView.backgroundColor = .white
        if UserProfile.sharedInstance.isRTL() {
        let label = UILabel(frame: CGRect(x: -50, y: 7, width: view.frame.size.width, height: 12))
            label.text = (searchResults[section].name ?? "")
            label.textColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 0.5)
            label.font = label.font.withSize(14)
            returnedView.addSubview(label)
        } else {
            let label = UILabel(frame: CGRect(x: 0, y: -12, width: view.frame.size.width, height: 12))
            label.text = (searchResults[section].name ?? "")
            label.textColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 0.5)
            label.font = label.font.withSize(14)
            returnedView.addSubview(label)
        }
        
        return returnedView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
