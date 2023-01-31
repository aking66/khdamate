/************************* Mo’min J.Abusaada *************************/
//
//  UIBarItemEx.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//

import UIKit

extension UIBarItem {
    @IBInspectable
    var localized: String? {
        get {
            return self.title
        }
        set {
            self.title = newValue?.localize_
        }
    }
}
