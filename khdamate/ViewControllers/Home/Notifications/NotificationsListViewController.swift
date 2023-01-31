//
//  NotificationsListViewController.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 02/11/2021.
//

import UIKit

class NotificationsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: GeneralTableView!{
        didSet{
            self.tableView.registerNib(NibName: NotificationsListTableViewCell.className_)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchData()
    }
    var parentVC: UITabBarController?
    
    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.applicationIconBadgeNumber = 0
        super.viewWillDisappear(animated)
        if let parent = parentVC as? MainTabBarController {
            parent.getNotificationCount()
        }
    }
    
    func fetchData() {
        let request = NotificationsRequest(.notifications)
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
            self.tableView.clearData(true)
            for notification in result.notifications {
                self.tableView.objects.append(GeneralTableViewData(reuseIdentifier: NotificationsListTableViewCell.className_, object: notification, rowHeight: nil))
            }
            self.tableView.reloadData()
        }
    }
    
    func setupView() {
        
    }
    
}
