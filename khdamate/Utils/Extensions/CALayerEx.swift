/************************* Mo’min J.Abusaada *************************/
//
//  CALayerEx.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//


import UIKit

extension CALayer {
    var borderColor_: UIColor {
        get {
            return self.borderColor_
        }
        set {
            self.borderColor = newValue.cgColor
        }
    }
}
