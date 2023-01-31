//
//  ServiceProviderViewController.swift
//  khdamate
//
//  Created by Karim Amsha on 9.11.2022.
//

import UIKit

class ServiceProviderViewController: UIViewController {
    
    @IBOutlet weak var viewSearch: HomeSearchView!

    @IBOutlet weak var tableView: GeneralTableView!{
        didSet{
            self.tableView.registerNib(NibName: ServiceProviderTableViewCell.className)
            self.tableView.selectionType = .single
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNavigationBG()
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
        fetchData()
    }
    func fetchData() {
        let request = ProviderRequest(.getProviders)
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
            self.tableView.clearData(true)
            for provider in result.providers {
                self.tableView.objects.append(GeneralTableViewData(reuseIdentifier: ServiceProviderTableViewCell.className_, object: provider, rowHeight: nil))
            }
            self.tableView.reloadData()
        }
    }
}

//extension ServiceProviderViewController: UITableViewDataSource, UITableViewDelegate {
//
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return 10
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceProviderTableViewCell", for: indexPath) as! ServiceProviderTableViewCell
////        return cell
////    }
////
////    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        if let cell = tableView.cellForRow(at: indexPath) as? ServiceProviderTableViewCell {
////            cell.didSelect(indexPath: indexPath as NSIndexPath)
////        }
////    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80
//    }
//}
