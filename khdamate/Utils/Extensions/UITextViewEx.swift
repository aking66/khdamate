/************************* Mo’min J.Abusaada *************************/
//
//  UITextViewEx.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//


import UIKit

#if canImport(UITextView_Placeholder)
import UITextView_Placeholder
#endif

extension UITextView {
    func shakeError(baseColor: UIColor = UIColor.red, numberOfShakes shakes: Float = 3, revert: Bool = true) {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "shadowColor")
        animation.fromValue = baseColor
        animation.toValue = UIColor.red.cgColor
        animation.duration = 0.4
        if revert { animation.autoreverses = true } else { animation.autoreverses = false }
        self.layer.add(animation, forKey: "shadowColor")
        
        let shake: CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 0.07
        shake.repeatCount = shakes
        if revert { shake.autoreverses = true  } else { shake.autoreverses = false }
        shake.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        shake.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(shake, forKey: "position")
    }
    
    #if canImport(UITextView_Placeholder)
    @IBInspectable
    var localized: String? {
        get {
            return self.placeholder
        }
        set {
            self.placeholder = newValue?.localize_
        }
    }
    #endif
    
    func isValidateValue() -> Bool {
        if ((self.text?.count ?? 0) < 1 ) || (self.text == nil) || (self.text == "") || (self.text?.replacingOccurrences(of: " ", with: "").count == 0) || self.text?.isEmptyOrWhiteSpace() == true {
            return false
        }
        return true
    }
}
