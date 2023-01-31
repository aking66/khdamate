//
//  OrderOffersListViewController.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 30/11/2021.
//

import UIKit

class OrderOffersListViewController: UIViewController {

    @IBOutlet weak var tableView: GeneralTableView!{
        didSet{
            self.tableView.registerNib(NibName: OrderListTableViewCell.className_)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getDataFromServer()
    }
    
    func getDataFromServer(){
        self.tableView.clearData(true)
        for _ in 0...3 {
            self.tableView.objects.append(GeneralTableViewData(reuseIdentifier: OrderListTableViewCell.className_, object: nil, rowHeight: nil))
        }
        self.tableView.reloadData()
    }
}
