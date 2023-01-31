/************************* Mo’min J.Abusaada *************************/
//
//  UIStoryboardEx.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//

import Foundation
import UIKit

enum StoryboardsInstance: String {
    case main = "Main"
    case userAuth = "UserAuth"
    case home = "Home"
    case orders = "Orders"
    case more = "More"
    case chatOrder = "ChatOrder"
    case serviceProviders = "serviceProviders"

    var value: UIStoryboard {
        return UIStoryboard.init(name: self.rawValue, bundle: nil)
    }
}

extension UIStoryboard {
    func instantiateVC<T: UIViewController>() -> T {
        return self.instantiateViewController(withIdentifier: T.className_) as! T
    }
}
