//
//  ServicesListViewController.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 31/10/2021.
//

import UIKit

class ServicesListViewController: UIViewController {
    enum ServicesListScreenType {
        case details
        case favorite
        case selection
    }
    
    @IBOutlet weak var viewSearch: HomeSearchView!
    @IBOutlet weak var tableView: GeneralTableView!{
        didSet{
            self.tableView.registerNib(NibName: ServicesListTableViewCell.className)
            self.tableView.selectionType = .multi
        }
    }
    
    var screenType:ServicesListScreenType = .details
    var didSelect: ((_ obj:Any?)->Void)?
    var categoryID: NSNumber?
    var categoryName: String?
    var services = [TServiceObject]()
    var fromProvider = false
    var nameProvider = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchData()
    }
    
    func fetchData() {
        switch screenType {
        case .details:
            let request = ServiceDetailsRequest(.getServiceDetails(service_id: categoryID, paging_count: 100, page: 1, search: nil))
            RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
                self.services = result.subServices
                self.setupView()
            }
            break
        case .favorite:
            let request = ServiceDetailsRequest(.getFavorite(paging_count: 100, page: 1, search: nil))
            RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
                self.services = result.subServices
                self.setupView()
            }
            break
        case .selection:
            let request = ServiceDetailsRequest(.getServiceDetails(service_id: categoryID, paging_count: 100, page: 1, search: nil))
            RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
                self.services = result.subServices
                self.setupView()
            }
            break
        }
    }
    
    func setupView() {
        switch screenType {
        case .details:
            self.title = "ServicesListVC_services_title".localize_
        case .favorite:
            self.title = "ServicesListVC_favourite_title".localize_
        case .selection:
            self.title = "ServicesListVC_title".localize_
        }
        self.tableView.clearData(true)
        var serviceWithCategoryID = [TServiceObject]()
        for service in services {
            let newService = TServiceObject(fromDictionary: [:])
            newService.descriptions = service.descriptions
            newService.pk_i_id = service.pk_i_id
            newService.added_to_fav = service.added_to_fav
            newService.name = service.name
            newService.photo = service.photo
            newService.main_service_name = self.categoryName
            newService.main_service_id = self.categoryID
            self.tableView.objects.append(GeneralTableViewData(reuseIdentifier: ServicesListTableViewCell.className, object: newService, rowHeight: 100))
        }
        self.tableView.reloadData()
        
        self.viewSearch.didFinish = { txt in
            if self.screenType == .favorite {
                let request = ServiceDetailsRequest(.getFavorite(paging_count: 100, page: 1, search: txt))
                RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
                    self.tableView.clearData(true)
                    for result in result.subServices {
                        self.tableView.objects.append(GeneralTableViewData(reuseIdentifier: ServicesListTableViewCell.className, object: result, rowHeight: nil))
                    }
                    self.tableView.reloadData()
                }
            }
            if self.screenType == .details {
                let request = ServiceDetailsRequest(.getServiceDetails(service_id: self.categoryID, paging_count: 100, page: 1, search: txt))
                RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
                    self.tableView.clearData(true)
                    for result in result.homeSearchResults {
                        self.tableView.objects.append(GeneralTableViewData(reuseIdentifier: ServicesListTableViewCell.className, object: result, rowHeight: nil))
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }
}
