//
//  ChatOrderAddInvoiceViewController.swift
//  Done
//
//  Created by Mo'min J.Abusaada on 10/03/2021.
//

import UIKit
import MIBlurPopup
import SwiftPhoneNumberFormatter

enum ChatOrderAddInvoiceType {
    case invoice
    case requestPayment
    
    var s_title:String{
        switch self {
            case .invoice:
                return "ChatOrderAddInvoiceVC_title_invoice".localize_
            case .requestPayment:
                return "ChatOrderAddInvoiceVC_title_requestPayment".localize_
        }
    }
    
    var s_lblAddImage:String{
        switch self {
            case .invoice:
                return "ChatOrderAddInvoiceVC_lblAddImage_text_invoice".localize_
            case .requestPayment:
                return "ChatOrderAddInvoiceVC_lblAddImage_text_requestPayment".localize_
        }
    }
}

class ChatOrderAddInvoiceViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblOrderNo: UILabel!
    @IBOutlet weak var lblAddImageTitle: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var txtInvoiceDetails: UITextView!
    @IBOutlet weak var txtInvoiceTotalPrice: UITextField!
    @IBOutlet weak var txtMobileNumber: PhoneFormattedTextField!
    @IBOutlet weak var txtIdentificationNumber: UITextField!
    
    var vcType:ChatOrderAddInvoiceType = .invoice
    var selectedImage:UIImage?{
        didSet{
            self.img.image = self.selectedImage
        }
    }
    
    var verification_code:String?
    var order_id: NSNumber?
    var order_no: NSNumber?
    var parentVC: ChatOrderViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    func setupView(){
        self.txtMobileNumber.config.defaultConfiguration = PhoneFormat(defaultPhoneFormat: " (##) #######")
        self.txtMobileNumber.prefix = "+966"
        self.txtMobileNumber.placeholder = " (54) 1234567"


        self.lblOrderNo.text = "\("OrderID".localize_) #\(self.order_no?.stringValue ?? "0")"
        self.lblTitle.text = self.vcType.s_title
        self.lblAddImageTitle.text = self.vcType.s_lblAddImage
        self.txtInvoiceDetails.superview?.superview?.isHidden = self.vcType != .invoice
        self.txtInvoiceTotalPrice.superview?.superview?.isHidden = self.vcType != .invoice
        self.txtMobileNumber.superview?.superview?.superview?.isHidden = self.vcType != .requestPayment
        self.txtIdentificationNumber.superview?.superview?.isHidden = self.vcType != .requestPayment
    }

    @IBAction func btnAddImage(_ sender: UIButton) {
        self.fdTake_action(sender) { (image, userInfo) in
            self.selectedImage = image
        }
    }
    
    func showErrorMSG(msgText:String) -> Bool {
        self.showPopAlert(title: "Error".localize_, message: "TextFeildValidation".localized(with: msgText))
        return false
    }
    func validation() -> Bool {
        if self.vcType == .invoice {
            if self.selectedImage == nil {
                return self.showErrorMSG(msgText: "ChatOrderAddInvoiceVC_lblAddImage_text_invoice".localize_)
            }else if (self.txtInvoiceDetails.text ?? "").isEmptyOrWhiteSpace() == true {
                return self.showErrorMSG(msgText: "ChatOrderAddInvoiceVC_lblInvoiceDetails_text".localize_)
            }else if (self.txtInvoiceTotalPrice.text ?? "").isEmptyOrWhiteSpace() == true || self.txtInvoiceTotalPrice.text?.toInt() == 0{
                return self.showErrorMSG(msgText: "ChatOrderAddInvoiceVC_lblInvoiceTotalPrice_text".localize_)
            }
        }else if self.vcType == .requestPayment {
            if self.selectedImage == nil {
                return self.showErrorMSG(msgText: "ChatOrderAddInvoiceVC_lblAddImage_text_requestPayment".localize_)
            }else if self.txtMobileNumber.text?.isEmptyOrWhiteSpace() == true || (self.txtMobileNumber.text ?? "").count < 15 {
                return self.showErrorMSG(msgText: "ChatOrderAddInvoiceVC_lblFullName_text".localize_)
            }else if (self.txtIdentificationNumber.text ?? "").isEmptyOrWhiteSpace() == true{
                return self.showErrorMSG(msgText: "ChatOrderAddInvoiceVC_lblIdentificationNumber_text".localize_)
            }
//            else if (self.txtInvoiceTotalPrice.text ?? "").isEmptyOrWhiteSpace() == true || self.txtInvoiceTotalPrice.text?.toInt() == 0{
//                return self.showErrorMSG(msgText: "ChatOrderAddInvoiceVC_lblInvoiceTotalPrice_text".localize_)
//            }
        }
        return true
    }
    @IBAction func btnSend(_ sender: Any) {
        if !self.validation() {
            return
        }
        self.view.endEditing(true)
        if self.vcType == .invoice {
            let request = ChatOrderRequest(.driverAddInvoice(order_id: self.order_id, price: self.txtInvoiceTotalPrice.text, invoice_photo: self.selectedImage, invoice_text: self.txtInvoiceDetails.text))
            RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
                self.parentVC?.getDataFromServer()
                self.dismiss(animated: true, completion: nil)
            }
        } else if self.vcType == .requestPayment {
            let request = UserRequest(.sendVerificationCode(mobile: self.txtMobileNumber.phoneNumberWithoutPrefix(), mobile_intro: self.txtMobileNumber.prefix, password: nil,type:.support))
            RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
//                let vc = LoginVerificationCodeViewController.initiateInstance(storyboard: .main) as! LoginVerificationCodeViewController
//                vc.mobile = self.txtMobileNumber.phoneNumberWithoutPrefix()
//                vc.mobile_intro = self.txtMobileNumber.prefix
//                vc.vcType = .support
//                vc.parentVC = self
//                self.present(vc, animated: true, completion: nil)
            }
        }
    }
    
    func sendDriverFinancialSupport() {
        let request = ChatOrderRequest(.driverFinancialSupport(order_id: self.order_id, amount: self.txtInvoiceTotalPrice.text, face_photo: self.selectedImage, id_no: self.txtIdentificationNumber.text, mobile: self.txtMobileNumber.phoneNumberWithoutPrefix(), verification_code: self.verification_code))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
            self.parentVC?.getDataFromServer()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
extension ChatOrderAddInvoiceViewController:MIBlurPopupDelegate{
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
