/************************* Mo’min J.Abusaada *************************/
//
//  UIViewControllerEx.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//

import UIKit
import UINavigationBar_Addition
import FDTake
import MapKit

func InitiateInstanceWithPush<T: UIViewController>(mainNav : UINavigationController = AppDelegate.sharedInstance.rootNavigationController,vcClass:T,storyboard:StoryboardsInstance? = .main ,params:((T) -> Void)? = nil) -> T? {
    let vc = storyboard?.value.instantiateViewController(withIdentifier: "\(T.className_)") as! T
    params?(vc)
    mainNav.pushViewController(vc, animated: true)
    return vc
}
extension NSObject {
    @nonobjc class var className_: String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
extension UIViewController{
    static func initiateInstance(storyboard:StoryboardsInstance? = .main)->UIViewController{
        return  (storyboard?.value.instantiateViewController(withIdentifier: "\(className_)"))!
    }
    static func initiateInstanceWithPush<T: UIViewController>(mainNav : UINavigationController = AppDelegate.sharedInstance.rootNavigationController,vcClass:T,storyboard:StoryboardsInstance? = .main ,params:((T) -> Void)? = nil) -> T? {
        let vc = storyboard?.value.instantiateViewController(withIdentifier: "\(T.className_)") as! T
        params?(vc)
        mainNav.pushViewController(vc, animated: true)
        return vc
    }
    func initWithParams(params:Dictionary<String,Any>?) -> UIViewController{
        return self
    }
    
    static func navigate(_ prevVC: UIViewController, params: Dictionary<String, Any>) {
        prevVC.navigationController?.pushViewController(initiateInstance().initWithParams(params: params), animated: true)
    }
    
    static func present(_ prevVC: UIViewController, params: Dictionary<String, Any>) {
        prevVC.present(initiateInstance().initWithParams(params: params), animated: true, completion: nil)
        
    }
    
    static func present(nc: UINavigationController?, params: Dictionary<String, Any>) {
        nc?.pushViewController(initiateInstance().initWithParams(params: params), animated: true)
    }
    
    func showPopAlert(title:String,message msg:String,okAction:(() -> Void)? = nil)  {
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title:"OK".localize_, style: .default, handler: { (pAlert) in
            //Do whatever you wants here
            okAction?()
        })
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showPopAlertWithCancel(title:String,message msg:String,okAction:(() -> Void)? = nil)  {
        let alertController = UIAlertController(title: title.localize_, message: msg.localize_, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title:"OK".localize_, style: .default, handler: { (pAlert) in
            okAction?()
        })
        let cancelAction = UIAlertAction(title:"Cancel".localize_, style: .cancel, handler: { (pAlert) in
        })
        alertController.addAction(defaultAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showErrorMessage(message msg:String,okAction:(() -> Void)? = nil) {
        self.showPopAlert(title: "Error".localize_, message: msg,okAction: okAction)
    }
    func ShowErrorMessage(message: String) {
        self.showPopAlert(title: "Error".localize_, message: message)
    }

    func setNavigationBarTransparent() {
        self.navigationController?.navigationBar.makeTransparent()
        if #available(iOS 13.0, *) {
            self.navigationController?.navigationBar.standardAppearance.backgroundColor = .clear
            self.navigationController?.navigationBar.standardAppearance.backgroundEffect = .none
            self.navigationController?.navigationBar.standardAppearance.shadowColor = .clear
        }
    }
    func setNavigationBarDefault() {
        self.navigationController?.navigationBar.makeDefault()
        if #available(iOS 13.0, *) {
            self.navigationController?.navigationBar.standardAppearance.backgroundColor = nil
            self.navigationController?.navigationBar.standardAppearance.backgroundEffect = nil
            self.navigationController?.navigationBar.standardAppearance.shadowColor = nil
        }
    }
    
    func changeNavBar(NavBarTransparent:Bool,statusBarWhite:Bool) {
        if NavBarTransparent == true {
            self.setNavigationBarTransparent()
        }else{
            self.setNavigationBarDefault()
        }
        if statusBarWhite == true {
            self.navigationController?.navigationBar.barStyle = .black
            self.navigationController?.navigationBar.tintColor = UIColor.white
        }else{
            self.navigationController?.navigationBar.barStyle = .default
            self.navigationController?.navigationBar.tintColor = UIColor.black
        }
        
        self.navigationController?.navigationBar.backItem?.title = " "
    }
    
    func fdTake_action(_ sender:UIView, completionBlock: @escaping ((_ photo: UIImage, _ info: [AnyHashable: Any]) -> Void))  {
        let fdTake = FDTakeController()
        fdTake.presentingView = sender
        fdTake.allowsVideo = false
        fdTake.cancelText = "Cancel".localize_
        fdTake.chooseFromLibraryText = "Chose From Gallery".localize_
        fdTake.chooseFromPhotoRollText = "Chose From Gallery".localize_
        fdTake.takePhotoText = "Capture image".localize_
        fdTake.takeVideoText = "takeVideoText".localize_
        fdTake.noSourcesText = "noSourcesText".localize_
        fdTake.present()
        fdTake.didGetPhoto = {(_ photo: UIImage, _ info: [AnyHashable : Any]) in
            completionBlock(photo,info)
        }
    }
    func openMaps(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let googleMapsInstalled = UIApplication.shared.canOpenURL(URL(string: "comgooglemaps://")!)
        if googleMapsInstalled {
            UIApplication.shared.openURL(URL(string: "comgooglemaps-x-callback://" +
                "?q=\(latitude),\(longitude)&zoom=14&views=traffic")!)
//            UIApplication.shared.openURL(URL(string: "comgooglemaps-x-callback://" +
//                "?daddr=\(latitude),\(longitude)&directionsmode=bicycling&zoom=17")!)
        } else {
            let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
            let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.openInMaps(launchOptions: nil)
        }
    }
    var topbarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
    func performSegueWithCheck(withIdentifier identifier: String, sender: Any?) {
        if canPerformSegue(withIdentifier: identifier){
            self.performSegue(withIdentifier: identifier, sender: sender)
        }
    }
    func canPerformSegue(withIdentifier identifier: String) -> Bool {
        //first fetch segue templates set in storyboard.
        guard let identifiers = value(forKey: "storyboardSegueTemplates") as? [NSObject] else {
            //if cannot fetch, return false
            return false
        }
        //check every object in segue templates, if it has a value for key _identifier equals your identifier.
        let canPerform = identifiers.contains { (object) -> Bool in
            if let id = object.value(forKey: "_identifier") as? String {
                if id == identifier{
                    return true
                } else {
                    return false
                }
            } else {
                return false
            }
        }
        return canPerform
    }
    
    func setApplicationLang(isEn:Bool,withRootVCIdentifier:String?,completion: ((Bool) -> Void)? = nil) {
        var transition: UIView.AnimationOptions = .transitionFlipFromLeft
        if isEn == true {
            L102Language.setAppleLAnguageTo(lang: "ar")
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        } else {
            L102Language.setAppleLAnguageTo(lang: "en")
            transition = .transitionFlipFromRight
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
        if let ident = withRootVCIdentifier {
            let rootviewcontroller: UIWindow = ((UIApplication.shared.delegate?.window)!)!
            rootviewcontroller.rootViewController = self.storyboard?.instantiateViewController(withIdentifier: ident)
        }
        let mainwindow = (UIApplication.shared.delegate?.window!)!
        mainwindow.backgroundColor = UIColor(hue: 0.6477, saturation: 0.6314, brightness: 0.6077, alpha: 0.8)
        UIView.transition(with: mainwindow, duration: 0.55001, options: transition, animations: { () -> Void in
        }) { (finished) -> Void in
            completion?(finished)
            UIFont.overrideInitialize()
        }
    }
    @IBInspectable
    var localized: String? {
        get {
            return self.title
        }
        set {
            self.title = newValue?.localize_
        }
    }
    @IBAction func btnPopViewController(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnDismissViewController(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBInspectable
    @objc var navBGHeight: Int {
        get {
            var value = UserDefaults.standard.value(forKey: "navBGHeight BTN-\(self)") as? Int ?? Int(topbarHeight) + 40
            if (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0.0) == 0 {
                value -= 24
            }
            return value
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey:"navBGHeight BTN-\(self)")
            UserDefaults.standard.synchronize()
        }
    }
    @IBInspectable
    @objc var addCustomNavBG: Bool {
        get {
            return UserDefaults.standard.value(forKey: "addCustomNavBG BTN-\(self.hash)") as? Bool ?? false
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey:"addCustomNavBG BTN-\(self.hash)")
            UserDefaults.standard.synchronize()
        }
    }
    func addNavigationBG(){
        if addCustomNavBG == false {
            return
        }
        var viewBGContaner : customMaskUIView?
        var imageViewNavigationBar : UIImageView?
        for viw in self.view.subviews {
            if viw is UIView && (viw.tag == 9919){
                viewBGContaner = viw as? customMaskUIView
            }
        }
        if viewBGContaner == nil {
            viewBGContaner = customMaskUIView(frame: CGRect(x: 0.0, y: 0.0, width: self.view.width, height: CGFloat(self.navBGHeight)))
            viewBGContaner?.roundCorners(roundshapeType: .lowerCorner,radius: 15)
            viewBGContaner?.backgroundColor = .clear
            viewBGContaner?.tag = 9919
            imageViewNavigationBar = UIImageView(image: UIImage(named: "bg_TopNavBar"))
            imageViewNavigationBar?.tag = 9919
            imageViewNavigationBar?.contentMode = .scaleAspectFill
            imageViewNavigationBar?.clipsToBounds = false
            imageViewNavigationBar?.frame = viewBGContaner!.frame
            viewBGContaner?.addSubview(imageViewNavigationBar!)
            self.view.insertSubview(viewBGContaner!, at: 0)
            //            self.view.addSubview(viewBGContaner!)
            self.view.sendSubviewToBack(viewBGContaner!)
            NSLayoutConstraint.activate([
                imageViewNavigationBar!.topAnchor.constraint(equalTo: viewBGContaner!.topAnchor, constant: 0),
                imageViewNavigationBar!.bottomAnchor.constraint(equalTo: viewBGContaner!.bottomAnchor, constant: 0),
                imageViewNavigationBar!.leftAnchor.constraint(equalTo: viewBGContaner!.leftAnchor, constant: 0),
                imageViewNavigationBar!.rightAnchor.constraint(equalTo: viewBGContaner!.rightAnchor, constant: 0)
            ])
        }
    }
}
