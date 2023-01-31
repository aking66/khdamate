//
//  MainTabBarController.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 25/10/2021.
//

import UIKit

class MainTabBarController: UITabBarController {

    @IBOutlet weak var btnNotifications: UIButton!
    @IBOutlet weak var btnCalender: UIButton!
    
    var rightBarButtomItem: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppDelegate.sharedInstance.rootTabBarController = self
        self.delegate = self
        if UserProfile.sharedInstance.currentUser?.b_provider == true {
//            let vc = OrdersListViewController.initiateInstance(storyboard: .orders)
//            self.viewControllers?[0] = vc
            var viewControllers = self.viewControllers
            viewControllers?.remove(at: 0)
            viewControllers?.remove(at: 0)
            self.viewControllers = viewControllers
        } else {
            var viewControllers = self.viewControllers
            viewControllers?.remove(at: 3)
            self.viewControllers = viewControllers
        }
        //self.btnCalender.isHidden = UserProfile.sharedInstance.currentUser?.b_provider == false
        getNotificationCount()
    }
    
    func getNotificationCount() {
        let request = HomeRequest(.home)
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
            let badgeCount = UILabel(frame: CGRect(x: 10, y: -05, width: 20, height: 20))
            badgeCount.layer.borderColor = UIColor.clear.cgColor
            badgeCount.layer.borderWidth = 2
            badgeCount.layer.cornerRadius = badgeCount.bounds.size.height / 2
            badgeCount.textAlignment = .center
            badgeCount.layer.masksToBounds = true
            badgeCount.textColor = .white
            badgeCount.font = badgeCount.font.withSize(12)
            badgeCount.backgroundColor = .red
            badgeCount.text = result.home?.new_notifications_count?.stringValue

            self.setbadgeButton(txt: badgeCount)
        }
    }
    
    func setbadgeButton(txt: UILabel) {
        let rightBarButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20 , height: 20))
        rightBarButton.setBackgroundImage(UIImage(named: "ic_notification"), for: .normal)
        rightBarButton.addTarget(self, action: #selector(self.notifications), for: .touchUpInside)
        rightBarButton.addSubview(txt)

        let rightBarButtomItem = UIBarButtonItem(customView: rightBarButton)
        self.rightBarButtomItem = rightBarButtomItem
        self.navigationItem.rightBarButtonItem = rightBarButtomItem
    }
    
    @objc private func notifications(_ sender: Any) {
        guard !UserProfile.sharedInstance.isUserGuest else {
            self.showPopAlertWithCancel(title: "Alert", message: "LoginIsRequired".localize_) {
                UserProfile.sharedInstance.currentUser = nil
                AppDelegate.sharedInstance.rootNavigationController.setFirstVC()
            }
             return
         }
        InitiateInstanceWithPush(vcClass: NotificationsListViewController(), storyboard: .home) { vc in
            vc.parentVC = self
        }
    }
    
    @IBAction func btnCalender(_ sender: Any) {
        if UserProfile.sharedInstance.currentUser?.b_provider == false {
            return
        }
        InitiateInstanceWithPush(vcClass: AgendaViewController(), storyboard: .home) { vc in
        }
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        viewController.viewWillAppear(true)
        let index = self.viewControllers?.indexOfObject(object: viewController)
        if (index != 0) {
            self.navigationItem.rightBarButtonItem = nil
        } else {
            self.navigationItem.rightBarButtonItem = rightBarButtomItem
        }
        
        UserProfile.sharedInstance.currentUser?.b_provider == false
        if viewController  == tabBarController.viewControllers?[1] || viewController  == tabBarController.viewControllers?[2]{
            if UserProfile.sharedInstance.isUserGuest {
                self.showPopAlertWithCancel(title: "Alert", message: "LoginIsRequired".localize_) {
                    UserProfile.sharedInstance.currentUser = nil
                    AppDelegate.sharedInstance.rootNavigationController.setFirstVC()
                }
            return false
        }
    }
        return true
    }
}
