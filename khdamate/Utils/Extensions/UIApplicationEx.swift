/************************* Mo’min J.Abusaada *************************/
//
//  UIApplicationEx.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//


import UIKit

extension UIApplication {
    class func topViewController_(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController_(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController_(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController_(controller: presented)
        }
        return controller
    }
    func openURL(_ urlStr:String,completionHandler completion: ((Bool) -> Void)? = nil){
        if let url = URL(string:urlStr) {
            self.open(url, options: [:], completionHandler: completion)
        }
    }
}
