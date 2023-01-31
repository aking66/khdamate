//
//  VerificationCodeViewController.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 25/10/2021.
//

import UIKit
import SwiftyCodeView
import EZSwiftExtensions

class VerificationCodeViewController: UIViewController {

//    enum VerificationType: String {
//        case resetPasword = "reset password"
//        case login = "login"
////        case signup = "signup"
//        case changeMobile = "change mobile"
//    }
    
    @IBOutlet weak var viewLoginContaner: customMaskUIView!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var btnContiune: UIButton!
    @IBOutlet weak var btnResend: UIButton!
    @IBOutlet var codeView: SwiftyCodeView!

    
    var mobile: String?
    var mobile_intro: String?
    var password: String?
    var timeer: Timer?
    var verificationType: VerificationCodeType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupView()
    }
    
    func setupView() {
        self.viewLoginContaner.roundCorners(roundshapeType: .topCorner, radius: 15)
        self.btnContiune.isEnabled = false
        if UserProfile.sharedInstance.isRTL() == true {
            self.codeView.stackView.transform = CGAffineTransform(scaleX: -1, y: 1)
            self.codeView.stackView.arrangedSubviews.forEach({ $0.transform = CGAffineTransform(scaleX: -1, y: 1) })
        }
        self.lblPhoneNumber.text = " \(self.mobile_intro ?? "")\(self.mobile ?? "")"
        self.codeView.delegate = self
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.codeView.becomeFirstResponder()
        }
        self.runTimer()
    }
    
    func resetResendButtonTitle() {
        do{
            var title1 = NSMutableAttributedString(string: "VerificationCodeVC_btnResend_title_1".localize_)
            let font1 = UIFont(name: AppFontName.regular, size: 12)!
            title1.addAttribute(.font, value: font1, range: NSMakeRange(0, title1.length))
            title1 = title1.color(UIColor(named: "#7D7D7D")!) as! NSMutableAttributedString
            
            var title2 = NSMutableAttributedString(string: "VerificationCodeVC_btnResend_title_2".localize_)
            let font2 = UIFont(name: AppFontName.bold, size: 12)!
            title2.addAttribute(.font, value: font2, range: NSMakeRange(0, title2.length))
            title2 = title2.color(UIColor(named: "#0096B4")!) as! NSMutableAttributedString
            
            self.btnResend.setAttributedTitle(title1 + NSAttributedString(string: " ") + title2, for: .normal)
            self.btnResend.titleLabel?.lineBreakMode = .byWordWrapping
            self.btnResend.titleLabel?.numberOfLines = 1
        }
    }
    
    func runTimer() {
#if DEBUG
        var count = 10
#else
        var count = 90
#endif
        self.btnResend.setAttributedTitle(nil, for: .normal)
        self.btnResend.setTitle("Send another pin in ( ".localize_ + "\(count)" + " ) s".localize_, for: .normal)
        
        timeer = Timer.runThisEvery(seconds: 1) { (timer) -> Void in
            self.btnResend.setTitle("Send another pin in ( ".localize_ + "\(count)" + " ) s".localize_, for: .normal)
            if count == 0 {
                self.resetResendButtonTitle()
                timer?.invalidate()
            }
            count -= 1
        }
    }
    
    func formatMinuteSeconds(_ totalSeconds: Int) -> String {
        let seconds = totalSeconds % 60
        let minutes = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    deinit {
        if let timer = timeer {
            timer.invalidate()
        }
    }
    
    @IBAction func btnContiune(_ sender: Any) {
        if self.codeView.code.count != self.codeView.length {
            return
        }
//        let user = TUserObject(fromDictionary: [:])
//        user.pk_i_id = NSNumber(value: -1)
//        user.s_phone_number = self.lblPhoneNumber.text
//        UserProfile.sharedInstance.currentUser = user
//        AppDelegate.sharedInstance.rootNavigationController.setFirstVC()
        switch verificationType {
        case .login:
            let request = UserRequest(.login(mobile: self.mobile,
                                             mobile_intro: self.mobile_intro,
                                             password: self.password?.removeArabicNumbers,
                                             verification_code: codeView.code))
            RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
                UserProfile.sharedInstance.currentUser = result.userObject
                AppDelegate.sharedInstance.rootNavigationController.setFirstVC()
            }
            break
        case .reset_password:
            let request = UserRequest(.resetPassword(mobile: self.mobile,
                                                     mobileIntro: self.mobile_intro,
                                                     password: nil,
                                                     verificationCode: codeView.code))
            RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (result) in
                InitiateInstanceWithPush(vcClass: ResetPasswordViewController(), storyboard: .userAuth) { (vc) in
                    vc.mobile = self.mobile
                    vc.mobile_intro = self.mobile_intro
                }
            }
            break
        case .change_mobile:
            break
        case .support:
            break
        case .none:
            break
        case .registeration:
            let request = UserRequest(.verifyUser(mobile: self.mobile,
                                                  mobile_intro: self.mobile_intro,
                                                  verification_code: codeView.code))
            RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (result) in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    UIApplication.topViewController_()?.showPopAlert(title : "Success".localize_, message : result.status?.message ?? "")
                }
                UserProfile.sharedInstance.currentUser = nil
                AppDelegate.sharedInstance.rootNavigationController.setFirstVC()
            }
        }
//        let request = UserRequest(.verifyUser(mobile: self.mobile, mobile_intro: self.mobile_intro, verification_code: self.codeView.code))
//        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
//            UserProfile.sharedInstance.currentUser = responce.userObject
//            AppDelegate.sharedInstance.rootNavigationController.setFirstVC()
//        }
    }
    @IBAction func btnResend(_ sender: Any) {
        if timeer?.isValid == true {
            return
        }
        let request = UserRequest(.sendVerificationCode(mobile: self.mobile, mobile_intro: self.mobile_intro, password: self.password, type: self.verificationType ?? .login))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
            self.showPopAlert(title: "Attention".localize_, message: responce.status?.message ?? "ResetCodeToResetPasswordSuccess".localize_)
            self.runTimer()
        }
    }
}
extension VerificationCodeViewController:SwiftyCodeViewDelegate{
    func codeView(sender: SwiftyCodeView, didFinishInput code: String) -> Bool {
        self.btnContiune.isEnabled = code.count == sender.length
        return false
    }
}
