/************************* Mo’min J.Abusaada *************************/
//
//  LoginViewController.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 16/10/2021.
//

import EZSwiftExtensions
import SwiftPhoneNumberFormatter
import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var viewContaner: customMaskUIView!
    @IBOutlet var txtPhoneNumber: PhoneFormattedTextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var btnShowPassword: UIButton!
    @IBOutlet var btnRegistration: UIButton!
    @IBOutlet var btnSkip: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }

    func setupView() {
        self.viewContaner.roundCorners(roundshapeType: .topCorner, radius: 20)

        self.txtPhoneNumber.config.defaultConfiguration = PhoneFormat(defaultPhoneFormat: " (##) #######")
        self.txtPhoneNumber.prefix = "+966"
        self.txtPhoneNumber.placeholder = " (54) 1234567"

        #if DEBUG
//        966594837483 asd123
        self.txtPhoneNumber.formattedText = "966598258194"
        self.txtPassword.text = "123"
//        self.txtPhoneNumber.formattedText = "594837483"//provider
//        self.txtPassword.text = "asd123"
        #else
        #endif
        do {
            var title1 = NSAttributedString(string: "LoginVC_lblTitle_text_1".localize_)
            title1 = title1.color(UIColor(named: "#313131")!)

            var title2 = NSAttributedString(string: "LoginVC_lblTitle_text_2".localize_)
            title2 = title2.color(UIColor(named: "#00A1C3")!)

            let fullTitle = NSMutableAttributedString(attributedString: title1 + NSAttributedString(string: " ") + title2)
            fullTitle.addAttribute(.font, value: self.lblTitle.font, range: NSMakeRange(0, fullTitle.length))

            self.lblTitle.attributedText = fullTitle
        }

        do {
            var title1 = NSMutableAttributedString(string: "LoginVC_btnRegistration_text_1".localize_)
            let font1 = UIFont(name: AppFontName.regular, size: 12)!
            title1.addAttribute(.font, value: font1, range: NSMakeRange(0, title1.length))
            title1 = title1.color(UIColor(named: "#313131")!) as! NSMutableAttributedString

            var title2 = NSMutableAttributedString(string: "LoginVC_btnRegistration_text_2".localize_)
            let font2 = UIFont(name: AppFontName.bold, size: 12)!
            title2.addAttribute(.font, value: font2, range: NSMakeRange(0, title2.length))
            title2 = title2.color(UIColor(named: "#00A1C3")!) as! NSMutableAttributedString

            self.btnRegistration.setAttributedTitle(title1 + NSAttributedString(string: " ") + title2, for: .normal)
            self.btnRegistration.titleLabel?.lineBreakMode = .byWordWrapping
            self.btnRegistration.titleLabel?.numberOfLines = 1
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.txtPhoneNumber.becomeFirstResponder()
    }

    @IBAction func btnShowPassword(_ sender: Any) {
        if self.txtPassword.isSecureTextEntry == true {
            self.txtPassword.isSecureTextEntry = false
            self.btnShowPassword.imageTintColor = UIColor.hexColor(hex: "#0795FF")
        } else {
            self.txtPassword.isSecureTextEntry = true
            self.btnShowPassword.imageTintColor = UIColor.hexColor(hex: "#9F9F9F")
        }
    }

    func showErrorMSG(msgText: String) -> Bool {
        self.showPopAlert(title: "Error".localize_, message: "TextFeildValidation".localized(with: msgText))
        return false
    }

    func validation() -> Bool {
        if self.txtPhoneNumber.text?.isEmptyOrWhiteSpace() == true || (self.txtPhoneNumber.text ?? "").count < 15 {
            return self.showErrorMSG(msgText: "LoginVC_lblPhoneNumber_text".localize_)
        } else if self.txtPassword.text?.isEmptyOrWhiteSpace() == true {
            return self.showErrorMSG(msgText: "LoginVC_lblPassword_text".localize_)
        }
        return true
    }

    @IBAction func btnLogin(_ sender: Any) {
        if !self.validation() {
            return
        }
        
        RequestWrapper.sharedInstance.makeRequest(request: UserRequest(.login(mobile: self.txtPhoneNumber.phoneNumberWithoutPrefix(), mobile_intro: self.txtPhoneNumber.prefix, password: self.txtPassword.text?.removeArabicNumbers, verification_code: nil))).executeWithCheckResponse(showLodaer: true, showMsg: true) { [weak self] (result) in
            guard let self = self else { return }
            if result.status?.codeNumber == -2 {
                InitiateInstanceWithPush(vcClass: VerificationCodeViewController(), storyboard: .userAuth) { (vc) in
                    vc.mobile = self.txtPhoneNumber.phoneNumberWithoutPrefix()
                    vc.mobile_intro = self.txtPhoneNumber.prefix
                    vc.password = self.txtPassword.text
                    vc.verificationType = .login
                    //TODO: result.signup?.msg response
//                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) { [weak self] in
//                        AppDelegate.sharedInstance.rootNavigationController.showPopAlert(title: "Code".localize_, message: result.signup?.msg ?? "")
//                    }
                    
                }
            } else {
                UserProfile.sharedInstance.currentUser = result.userObject
                UserProfile.sharedInstance.currentUserPhotoUrl = result.userObject?.s_profileImageUrl
                AppDelegate.sharedInstance.rootNavigationController.setFirstVC()
                AppDelegate.sharedInstance.setupFCM(application: UIApplication.shared)
            }
        }
    }

    @IBAction func btnSkip(_ sender: Any) {
        let request = UserRequest(.guestLogin(udid: UIDevice.current.identifierForVendor?.uuidString))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
            UserProfile.sharedInstance.currentUser = responce.userObject
            AppDelegate.sharedInstance.rootNavigationController.setFirstVC()
        }
//        AppDelegate.sharedInstance.rootNavigationController.skipLogin()
    }

    @IBAction func btnForgetPassword(_ sender: Any) {
        InitiateInstanceWithPush(vcClass: ForgetPasswordPhoneViewController(), storyboard: .userAuth) { _ in
        }
    }

    @IBAction func btnRegistration(_ sender: Any) {
        InitiateInstanceWithPush(vcClass: RegistrationTypeSelectionViewController(), storyboard: .userAuth) { _ in
        }
    }
}
