/************************* Mo’min J.Abusaada *************************/
//
//  AppFont.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//

import UIKit

fileprivate let fontMinSize = CGFloat(-2)

struct AppFontName {
    static let regular = "Poppins-Regular".localize_
    static let bold    = "Poppins-SemiBold".localize_
    static let italic  = "Poppins-Medium".localize_
}


extension UIFont {
    @objc class func getFontSize(_ size: CGFloat) -> CGFloat{
        return (size - fontMinSize)
    }
    @objc class func mySystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.regular, size: UIFont.getFontSize(size))!
    }
    
    @objc class func myBoldSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.bold, size: UIFont.getFontSize(size))!
    }
    
    @objc class func myItalicSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.italic, size: UIFont.getFontSize(size))!
    }
    @objc class func mySystemFont(ofSize fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        return UIFont(name: AppFontName.regular, size: UIFont.getFontSize(fontSize))!
    }
    @objc class func myMonospacedDigitSystemFont(ofSize fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        return UIFont(name: AppFontName.regular, size: UIFont.getFontSize(fontSize))!
    }
    fileprivate func getFontName(_ fontAttribute:String) -> String{
        var fontName = ""
        switch fontAttribute {
        case "CTFontRegularUsage","UICTFontTextStyleShortFootnote","UICTFontTextStyleFootnote":
            fontName = AppFontName.regular
        case "CTFontEmphasizedUsage", "CTFontBoldUsage","UICTFontTextStyleHeadline","UICTFontTextStyleEmphasizedFootnote":
            fontName = AppFontName.bold
        case "CTFontObliqueUsage":
            fontName = AppFontName.italic
//        case "CTFontBlackUsage":
//            return UIFont.Weight.black
//        case "CTFontHeavyUsage":
//            return UIFont.Weight.heavy
//        case "CTFontUltraLightUsage":
//            return UIFont.Weight.ultraLight
//        case "CTFontThinUsage":
//            return UIFont.Weight.thin
//        case "CTFontLightUsage":
//            return UIFont.Weight.light
//        case "CTFontMediumUsage":
//            return UIFont.Weight.medium
//        case "CTFontDemiUsage":
//            return UIFont.Weight.semibold
        default:
            fontName = AppFontName.regular
        }
        return fontName
    }
    @objc convenience init(myCoder aDecoder: NSCoder) {
        if let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor {
            if let fontAttribute = fontDescriptor.fontAttributes[UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")] as? String {
                self.init(name: UIFont().getFontName(fontAttribute), size: UIFont.getFontSize(fontDescriptor.pointSize))!
            }
            else {
                self.init(myCoder: aDecoder)
            }
        }
        else {
            self.init(myCoder: aDecoder)
        }
    }
    
    class func overrideInitialize() {
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: UIFont.myBoldSystemFont(ofSize: UIFont.getFontSize(17))]
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.mySystemFont(ofSize: UIFont.getFontSize(14))], for: .normal)

        UIAlertController.swizzleViewWillAppear()
        if self == UIFont.self {
            let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:)))
            let mySystemFontMethod = class_getClassMethod(self, #selector(mySystemFont(ofSize:)))
            method_exchangeImplementations(systemFontMethod!, mySystemFontMethod!)
            
            let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:)))
            let myBoldSystemFontMethod = class_getClassMethod(self, #selector(myBoldSystemFont(ofSize:)))
            method_exchangeImplementations(boldSystemFontMethod!, myBoldSystemFontMethod!)
            
            let italicSystemFontMethod = class_getClassMethod(self, #selector(italicSystemFont(ofSize:)))
            let myItalicSystemFontMethod = class_getClassMethod(self, #selector(myItalicSystemFont(ofSize:)))
            method_exchangeImplementations(italicSystemFontMethod!, myItalicSystemFontMethod!)
            
            do {
                let italicSystemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:weight:)))
                let myItalicSystemFontMethod = class_getClassMethod(self, #selector(mySystemFont(ofSize:weight:)))
                method_exchangeImplementations(italicSystemFontMethod!, myItalicSystemFontMethod!)
            }
            do {
                let italicSystemFontMethod = class_getClassMethod(self, #selector(monospacedDigitSystemFont(ofSize:weight:)))
                let myItalicSystemFontMethod = class_getClassMethod(self, #selector(myMonospacedDigitSystemFont(ofSize:weight:)))
                method_exchangeImplementations(italicSystemFontMethod!, myItalicSystemFontMethod!)
            }
            let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))) // Trick to get over the lack of UIFont.init(coder:))
            let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:)))
            method_exchangeImplementations(initCoderMethod!, myInitCoderMethod!)
        }
    }
}

extension UIAlertController {
    fileprivate func checkSubViews(subViews:Array<Any>){
        for view in subViews {
            if view is UILabel {
                if let fontDescriptor = (view as! UILabel).font?.fontDescriptor {
                    if let fontAttribute = fontDescriptor.fontAttributes[UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")] as? String {
                        (view as! UILabel).font = UIFont(name: (view as! UILabel).font.getFontName(fontAttribute), size: UIFont.getFontSize(fontDescriptor.pointSize))!
                    }else{
                        (view as! UILabel).font = UIFont.systemFont(ofSize: ((view as! UILabel).font?.pointSize ?? 0) + fontMinSize)
                    }
                }else{
                    (view as! UILabel).font = UIFont.systemFont(ofSize: ((view as! UILabel).font?.pointSize ?? 0) + fontMinSize)
                }
            }
            if view is UITextField {
                if let fontDescriptor = (view as! UITextField).font?.fontDescriptor {
                    if let fontAttribute = fontDescriptor.fontAttributes[UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")] as? String {
                        (view as! UITextField).font = UIFont(name: (view as! UITextField).font?.getFontName(fontAttribute) ?? AppFontName.regular, size: UIFont.getFontSize(fontDescriptor.pointSize))!
                    }else{
                        (view as! UITextField).font = UIFont.systemFont(ofSize: ((view as! UITextField).font?.pointSize ?? 0) + fontMinSize)
                    }
                }else{
                    (view as! UITextField).font = UIFont.systemFont(ofSize: ((view as! UITextField).font?.pointSize ?? 0) + fontMinSize)
                }
            }
            self.checkSubViews(subViews: (view as! UIView).subviews)
        }
    }
    @objc func newViewWillAppear(_ animated: Bool) {
        self.newViewWillAppear(animated)
        self.checkSubViews(subViews: self.view.subviews)
    }
    
    static func swizzleViewWillAppear() {
        if self != UIAlertController.self {
            return
        }
        let _: () = {
            let originalSelector = #selector(UIAlertController.viewWillAppear(_:))
            let swizzledSelector = #selector(UIAlertController.newViewWillAppear(_:))
            let originalMethod = class_getInstanceMethod(self, originalSelector)
            let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
            method_exchangeImplementations(originalMethod!, swizzledMethod!);
        }()
    }
}
