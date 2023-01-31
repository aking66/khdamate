//
//  ForgetPasswordViewController.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 25/10/2021.
//

import UIKit

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var viewLoginContaner: customMaskUIView!

    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtConfirmPassword: UITextField!
    
    var mobile: String?
    var mobile_intro: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    func setupView(){
        self.viewLoginContaner.roundCorners(roundshapeType: .topCorner, radius: 15)
        
        self.txtPassword.becomeFirstResponder()
    }
    
    func showErrorMSG(msgText: String) -> Bool {
        self.showPopAlert(title: "Error".localize_, message: "TextFeildValidation".localized(with: msgText))
        return false
    }
    
    func validation() -> Bool {
        if self.txtPassword.text?.isEmptyOrWhiteSpace() == true {
            return self.showErrorMSG(msgText: "ResetPasswordVC_lblNewPassword_text".localize_)
        }else if self.txtConfirmPassword.text?.isEmptyOrWhiteSpace() == true{
            return self.showErrorMSG(msgText: "ResetPasswordVC_lblConfirmPassword_text".localize_)
        }else if self.txtConfirmPassword.text != self.txtPassword.text{
            self.showPopAlert(title: "Error".localize_, message: "InvalidPassword".localize_)
            return false
        }
        return true
    }
    
    @IBAction func btnRestPassword(_ sender: Any) {
        if !self.validation() {
            return
        }
        let request = UserRequest(.resetPassword(mobile: self.mobile,
                                                 mobileIntro: self.mobile_intro,
                                                 password: self.txtPassword?.text?.removeArabicNumbers,
                                                 verificationCode: nil))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (result) in
                UserProfile.sharedInstance.currentUser = nil
                AppDelegate.sharedInstance.rootNavigationController.setFirstVC()
        }
    }
}
