//
//  HomeProviderViewController.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 23/11/2021.
//

import UIKit

class HomeProviderViewController: UIViewController {

    @IBOutlet weak var tableView: GeneralTableView!{
        didSet{
            self.tableView.registerNib(NibName: HomeProviderTableViewCell.className_)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNavigationBG()
        self.getDataFromServer()
    }

    func setupView() {
    }
    
    func getDataFromServer() {
//        self.tableView.clearData(true)
//        for _ in 0...5 {
//            self.tableView.objects.append(GeneralTableViewData(reuseIdentifier: HomeProviderTableViewCell.className_, object: nil, rowHeight: nil))
//        }
//        self.tableView.reloadData()
        
        let request = ServiceProviderRequest(.getNewOrders)
        self.tableView.isPullToRefreshEnabled = true
        self.tableView.isLoadMoreEnabled = true
        self.tableView.ofRequest(request)
            .reuseIdentifier(HomeProviderTableViewCell.className_)
            .handleResponse { (BaseResponse) -> [Any]? in
                return BaseResponse.orders
            }.start()
    }
}
