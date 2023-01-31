/************************* Mo’min J.Abusaada *************************/
//
//  UserProfile.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//



import UIKit
import MagicalRecord

class UserProfile: NSObject {
    static let sharedInstance = UserProfile()
    
    var service_price: String? {
        get {
            return UserDefaults.standard.value(forKey: "service_price") as? String
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "service_price")
            UserDefaults.standard.synchronize()
        }
    }
    
    var currentUserID: NSNumber? {
        get {
            return UserDefaults.standard.value(forKey: "currentUserID") as? NSNumber
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "currentUserID")
            UserDefaults.standard.synchronize()
        }
    }
    var currentUserToken: String? {
        get {
            return UserDefaults.standard.value(forKey: "currentUserToken") as? String
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "currentUserToken")
            UserDefaults.standard.synchronize()
        }
    }
    var currentUserPhotoUrl: String? {
        get {
            return UserDefaults.standard.value(forKey: "currentUserPhotoUrl") as? String
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "currentUserPhotoUrl")
            UserDefaults.standard.synchronize()
        }
    }
    var currentUserName: String? {
        get {
            return UserDefaults.standard.value(forKey: "currentUserName") as? String
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "currentUserName")
            UserDefaults.standard.synchronize()
        }
    }
    var b_walkthrough_show: NSNumber? {
        get {
            return UserDefaults.standard.value(forKey: "b_walkthrough_show") as? NSNumber
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "b_walkthrough_show")
            UserDefaults.standard.synchronize()
        }
    }
    
 
    var currentUser: TUserObject? {
        get {
            let decoded  = (UserDefaults.standard.object(forKey: "currentUser") as? Data) ?? Data()
            return NSKeyedUnarchiver.unarchiveObject(with: decoded) as? TUserObject
        }
        set {
            if let value = newValue {
                self.currentUserID = value.pk_i_id
                if let token = value.s_token {
                    self.currentUserToken = token
                }
                let encodedData = NSKeyedArchiver.archivedData(withRootObject:value)
                UserDefaults.standard.set(encodedData, forKey: "currentUser")
                UserDefaults.standard.synchronize()
            } else {
                self.currentUserToken = nil
                self.currentUserID = nil
                UserDefaults.standard.set(nil, forKey: "currentUser")
                UserDefaults.standard.synchronize()
            }
            NotificationCenter.default.post(name: NSNotification.Name("userStatusChanged"), object: nil)
        }
    }
    
    var isUserGuest: Bool {
        return self.currentUser?.s_name == "Guest" || self.currentUser?.s_name == "زائر"
    }
    var fcm_token: String? {
        get {
            return UserDefaults.standard.value(forKey: "fcm_token") as? String
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "fcm_token")
            UserDefaults.standard.synchronize()
        }
    }
    func openMenuBaseedOnLang() -> Void {
//        if isRTL() {
//            applicationDelegate.rootNavigationController?.menuContainerViewController.toggleRightSideMenuCompletion(nil)
//        }else{
//            applicationDelegate.rootNavigationController?.menuContainerViewController.toggleLeftSideMenuCompletion(nil)
//        }
    }
//    func checkIfUserLogin(alert:Bool) -> Bool {
//        if alert && self.currentUserID == nil {
//            let alertController = UIAlertController(title: "Attention".localize_, message:"LoginIsRequired".localize_, preferredStyle:.alert)
//            alertController.addAction(UIAlertAction(title: "Login".localize_, style:.default, handler: { (action) in
//                let vc = AppDelegate.sharedInstance.rootNavigationController?.storyboard?.instantiateViewController(withIdentifier:"LoginViewController")
//                AppDelegate.sharedInstance.rootNavigationController?.present(vc!, animated: true, completion: nil)
//            }))
//            alertController.addAction(UIAlertAction(title: "Cancel".localize_, style:.cancel, handler: { (action) in
//                
//            }))
//            AppDelegate.sharedInstance.rootNavigationController?.present(alertController, animated: true, completion: nil)
//        }
//        return self.currentUserID != nil
//    }
    static func changeLangTo(_ lang:String,alertWithAction:Bool = true,okHandler:(() -> Void)? = nil,cancelHandler:(() -> Void)? = nil){
        let alertController = UIAlertController(title: "Attention".localize_, message:"messege_application_will_exit".localize_, preferredStyle:.alert)
        alertController.addAction(UIAlertAction(title: "OK".localize_, style:.default, handler: { (action) in
            if alertWithAction == true {
                UserProfile.changeLangToWithoutAlert(lang)
            }
            okHandler?()
        }))
        alertController.addAction(UIAlertAction(title: "Cancel".localize_, style:.cancel, handler: { (action) in
            cancelHandler?()
        }))
        AppDelegate.sharedInstance.rootNavigationController?.present(alertController, animated: true, completion: nil)
    }
    
    static func changeLangToWithoutAlert(_ lang:String){
        L102Language.setAppleLAnguageTo(lang: lang)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.1, execute: {
            exit(0)
        })
    }
    
    func selectedLang() -> String {
        let langs = UserDefaults.standard.value(forKey: "AppleLanguages") as? Array<String>
        return (langs?.first)!
    }

    func isRTL() -> Bool {
        let langs = UserDefaults.standard.value(forKey: "AppleLanguages") as? Array<String>
        return (langs?.first?.hasPrefix("ar"))! ? true : false
    }
//
//    func getCurrentMenu() -> NLSideMenuViewController! {
//        if let menuRight = applicationDelegate.rootNavigationController?.menuContainerViewController.rightMenuViewController as? NLSideMenuViewController{
//            return menuRight
//        }else if let menuLeft = applicationDelegate.rootNavigationController?.menuContainerViewController.leftMenuViewController as? NLSideMenuViewController{
//            return menuLeft
//        }
//        return NLSideMenuViewController.sharedInstance
//    }
}
