/************************* Mo’min J.Abusaada *************************/
//
//  UILabelEx.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//

import UIKit

extension UILabel {
    @IBInspectable
    var localized: String? {
        get {
            return self.text
        }
        set {
            self.text = newValue?.localize_
        }
    }
    var numberOfVisibleLines: Int {
        let textSize = CGSize(width: CGFloat(self.frame.size.width), height: CGFloat(MAXFLOAT))
        let rHeight: Int = lroundf(Float(self.sizeThatFits(textSize).height))
        let charSize: Int = lroundf(Float(self.font.pointSize))
        return rHeight / charSize
    }
}
