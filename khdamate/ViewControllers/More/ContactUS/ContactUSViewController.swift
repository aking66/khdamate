//
//  ContactUSViewController.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 03/11/2021.
//

import UIKit
import SwiftPhoneNumberFormatter
import MessageUI

class ContactUSViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var txtType: UITextField!
    @IBOutlet var txtPhoneNumber: PhoneFormattedTextField!
    @IBOutlet var txtTitle: UITextField!
    @IBOutlet var txtDetails: UITextView!
    
    var contactReasons: [TConstantObject]?
    var selectedReason: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchData()
    }
    
    func setupView() {
        self.txtPhoneNumber.config.defaultConfiguration = PhoneFormat(defaultPhoneFormat: " (##) #######")
        self.txtPhoneNumber.prefix = "+966"
        self.txtPhoneNumber.placeholder = " (54) 1234567"
    }
    
    func fetchData() {
        let request = ConstantsRequest(.getContactReasons)
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
            self.contactReasons = result.contactReasons
            self.setupView()
        }
    }
 
    @IBAction func btnType(_ sender: UIButton) {
        let alertController = UIAlertController(title: "ContactUSVC_lblInquiryType".localize_, message:nil, preferredStyle:.actionSheet)
        var dataArray = [String]()
        var dataDict = [Int: String]()
        guard let contactReasons = contactReasons else {
            return
        }
        for contactReason in contactReasons {
            dataArray.append(contactReason.name ?? "")
            dataDict[contactReason.pk_i_id?.intValue ?? 0] = contactReason.name
        }
       
        for res in dataArray {
            alertController.addAction(UIAlertAction(title: res, style:.default, handler: { (action) in
                self.txtType.text = action.title
                for (key, value) in dataDict {
                    if value == action.title {
                        self.selectedReason = key
                    }
                }
            }))
        }
        alertController.addAction(UIAlertAction(title: "Cancel".localize_, style:.cancel, handler: { (action) in
            
        }))
        if let presenter = alertController.popoverPresentationController {
            presenter.sourceView = sender
            presenter.sourceRect = sender.bounds
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showErrorMSG(msgText:String) -> Bool {
        self.showPopAlert(title: "Error".localize_, message: "TextFeildValidation".localized(with: msgText))
        return false
    }
    
    func validation() -> Bool {
        if self.selectedReason == nil {
            return self.showErrorMSG(msgText: "ContactUSVC_lblReason_text".localize_)
        } else if self.txtTitle.text?.isEmptyOrWhiteSpace() == true {
            return self.showErrorMSG(msgText: "ContactUSVC_lblTitle_text".localize_)
        } else if self.txtDetails.text?.isEmptyOrWhiteSpace() == true {
            return self.showErrorMSG(msgText: "ContactUSVC_lblMessage_text".localize_)
        }
        return true
    }
    
    @IBAction func btnSend(_ sender: Any) {
        if !self.validation() {
            return
        }
        
        let request = ContactRequest(.sendMessage(title: self.txtTitle.text, contact_reason_id: selectedReason, message: self.txtDetails.text, mobile: txtPhoneNumber.text))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
            AppDelegate.sharedInstance.rootNavigationController.setFirstVC(animated: true)
        }
    }
    
    @IBAction func btnEmail(_ sender: Any) {
        let request = ConstantsRequest(.getSocailLinks)
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
            let email = result.socialLinks?.email
            if let url = URL(string: "mailto:\(email)") {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            dismiss(animated: true, completion: nil)
        }
    @IBAction func btnPhone(_ sender: Any) {
        let request = ConstantsRequest(.getSocailLinks)
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
            if let url = URL(string: "tel://" + "00" + ("\(result.socialLinks?.phone ?? "")")), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }

        }
    }
    @IBAction func btnFacebook(_ sender: Any) {
        let request = ConstantsRequest(.getSocailLinks)
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
            if let url = URL(string: result.socialLinks?.facebook ?? ""),
               UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }

    @IBAction func btnTwitter(_ sender: Any) {
        let request = ConstantsRequest(.getSocailLinks)
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
            if let url = URL(string: result.socialLinks?.twitter ?? ""),
               UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }

}
