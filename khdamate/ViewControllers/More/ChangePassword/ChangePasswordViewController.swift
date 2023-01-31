//
//  ChangePasswordViewController.swift
//  Done
//
//  Created by Mo'min J.Abusaada on 09/02/2021.
//

import UIKit
import IQKeyboardManagerSwift
import MIBlurPopup

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var viewContaner: customMaskUIView!
    @IBOutlet weak var txtCurrentPassword: UITextField!
    @IBOutlet weak var btnShowHideCurrentPassword: UIButton!
    @IBOutlet weak var txtNewPassword: UITextField!
    @IBOutlet weak var btnShowHideNewPassword: UIButton!
    @IBOutlet weak var txtConfirmNewPassword: UITextField!
    @IBOutlet weak var btnShowHideConfirmNewPassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewContaner.roundCorners(roundshapeType: .topCorner, radius: 30)
        self.txtCurrentPassword.keyboardDistanceFromTextField = 60
        self.txtNewPassword.keyboardDistanceFromTextField = 60
        self.txtConfirmNewPassword.keyboardDistanceFromTextField = 40
    }

    func changeShowHidePassword(txtPassword:UITextField,btn:UIButton){
        if txtPassword.isSecureTextEntry == true {
            txtPassword.isSecureTextEntry = false
            btn.imageTintColor = UIColor.hexColor(hex: "#0795FF")
        } else {
            txtPassword.isSecureTextEntry = true
            btn.imageTintColor = UIColor.hexColor(hex: "#9F9F9F")
        }
    }
    
    @IBAction func btnShowHideCurrentPassword(_ sender: Any) {
        self.changeShowHidePassword(txtPassword: self.txtCurrentPassword, btn: self.btnShowHideCurrentPassword)
    }
    
    @IBAction func btnShowHideNewPassword(_ sender: Any) {
        self.changeShowHidePassword(txtPassword: self.txtNewPassword, btn: self.btnShowHideNewPassword)
    }
    
    @IBAction func btnShowHideConfirmNewPassword(_ sender: Any) {
        self.changeShowHidePassword(txtPassword: self.txtConfirmNewPassword, btn: self.btnShowHideConfirmNewPassword)
    }
    
    func showErrorMSG(msgText:String) -> Bool {
        self.showPopAlert(title: "Error".localize_, message: "TextFeildValidation".localized(with: msgText))
        return false
    }
    
    func validation() -> Bool {
        if self.txtCurrentPassword.text?.isEmptyOrWhiteSpace() == true{
            return self.showErrorMSG(msgText: "ProfileChangePasswordVC_lblCurrentPassword_text".localize_)
        }else if self.txtNewPassword.text?.isEmptyOrWhiteSpace() == true{
            return self.showErrorMSG(msgText: "ProfileChangePasswordVC_lblNewPassword_text".localize_)
        }else if self.txtConfirmNewPassword.text?.isEmptyOrWhiteSpace() == true || self.txtConfirmNewPassword.text != self.txtNewPassword.text{
            self.showPopAlert(title: "Error".localize_, message: "InvalidPassword".localize_)
            return false
        }
        return true
    }
    
    @IBAction func btnSend(_ sender: Any) {
        if !self.validation() {
            return
        }
        let request = UserRequest(.changePassword(oldPassword: self.txtCurrentPassword.text, newPassword: self.txtNewPassword.text, confirmPassword: self.txtConfirmNewPassword.text))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) { [weak self] in
                AppDelegate.sharedInstance.rootNavigationController.showPopAlert(title: "Success".localize_, message: "ProfileChangePasswordVC_changeSuccess".localize_)
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
extension ChangePasswordViewController:MIBlurPopupDelegate{
    
    var popupView: UIView {
        return self.view
    }
    var blurEffectStyle: UIBlurEffect.Style? {
        return .dark
    }
    var initialScaleAmmount: CGFloat {
        return 0.9
    }
    var animationDuration: TimeInterval {
        return 0.2
    }
}
