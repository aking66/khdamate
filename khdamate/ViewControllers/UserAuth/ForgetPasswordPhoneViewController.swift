//
//  ForgetPasswordPhoneViewController.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 25/10/2021.
//

import UIKit
import SwiftPhoneNumberFormatter

class ForgetPasswordPhoneViewController: UIViewController {

    @IBOutlet weak var viewLoginContaner: customMaskUIView!
    @IBOutlet var txtPhoneNumber: PhoneFormattedTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupView()
    }
    func setupView(){
        self.viewLoginContaner.roundCorners(roundshapeType: .topCorner, radius: 15)
        
        self.txtPhoneNumber.config.defaultConfiguration = PhoneFormat(defaultPhoneFormat: " (##) #######")
        self.txtPhoneNumber.prefix = "+966"
        self.txtPhoneNumber.placeholder = " (54) 1234567"
        
        self.txtPhoneNumber.becomeFirstResponder()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func showErrorMSG(msgText: String) -> Bool {
        self.showPopAlert(title: "Error".localize_, message: "TextFeildValidation".localized(with: msgText))
        return false
    }
    
    func validation() -> Bool {
        if self.txtPhoneNumber.text?.isEmptyOrWhiteSpace() == true || (self.txtPhoneNumber.text ?? "").count < 15 {
            return self.showErrorMSG(msgText: "ForgetPasswordPhoneVC_lblMobileNumber_text".localize_)
        }
        return true
    }
    
    @IBAction func btnRestPassword(_ sender: Any) {
        if !self.validation() {
            return
        }
        let request = UserRequest(.sendVerificationCode(mobile: self.txtPhoneNumber.phoneNumberWithoutPrefix(), mobile_intro: self.txtPhoneNumber.prefix, password: nil, type: VerificationCodeType.reset_password))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
            
            InitiateInstanceWithPush(vcClass: VerificationCodeViewController(), storyboard: .userAuth) { (vc) in
                vc.mobile = self.txtPhoneNumber.phoneNumberWithoutPrefix()
                vc.mobile_intro = self.txtPhoneNumber.prefix
                vc.password = nil
                vc.verificationType = .reset_password
            }
        }
    }
}
