//
//  RegistrationViewController.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 23/10/2021.
//

import ActiveLabel
import EZSwiftExtensions
import SwiftPhoneNumberFormatter
import UIKit
import RSSelectionMenu
import LocationPickerViewController

class RegistrationViewController: UIViewController {
    public enum RegistrationVCType {
        case client
        case service_provider
    }
    @IBOutlet weak var txtAddress: UITextField!

    @IBOutlet var viewContaner: customMaskUIView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var txtPhoneNumber: PhoneFormattedTextField!
    @IBOutlet var txtFullName: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var btnShowPassword: UIButton!
    @IBOutlet var stackViewServiceProviderContaner: UIStackView!
    @IBOutlet var txtID: UITextField!
    @IBOutlet var txtServicesProvided: UITextField!
    @IBOutlet var txtProfessionLicense: UITextField!
    @IBOutlet var imgProfessionLicense: UIImageView!
    @IBOutlet var lblTerms: ActiveLabel!
    var lat = ""
    var long = ""

    public var route: RegistrationVCType = .client
    var selectServiceProviderArr = [String]() {
        didSet{
            self.txtServicesProvided.text = self.selectServiceProviderArr.joined(separator: ",")
        }
    }
    var selectedServicesArr = [Int32]()
    var services: [TConstantObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        if route == .service_provider {
            self.fetchData()
        }
    }

    func setupView() {
        self.viewContaner.roundCorners(roundshapeType: .topCorner, radius: 20)
        self.txtPhoneNumber.config.defaultConfiguration = PhoneFormat(defaultPhoneFormat: " (##) #######")
        self.txtPhoneNumber.prefix = "+966"
        self.txtPhoneNumber.placeholder = " (54) 1234567"

        do {
            var title1 = NSAttributedString(string: "RegestrationVC_lblTitle_text_1".localize_)
            title1 = title1.color(UIColor(named: "#313131")!)

            var title2 = NSAttributedString(string: "RegestrationVC_lblTitle_text_2".localize_)
            title2 = title2.color(UIColor(named: "#00A1C3")!)

            let fullTitle = NSMutableAttributedString(attributedString: title1 + NSAttributedString(string: " ") + title2)
            fullTitle.addAttribute(.font, value: self.lblTitle.font, range: NSMakeRange(0, fullTitle.length))

            self.lblTitle.attributedText = fullTitle
        }

        let termsAttributes = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.foregroundColor: "#0096B4".color_] as [NSAttributedString.Key: Any]
        let customTypeTerms = ActiveType.custom(pattern: "\\s\("RegestrationVC_btnTerms_text_Terms".localize_)\\b")
        let customTypePrivce = ActiveType.custom(pattern: "\\s\("RegestrationVC_btnTerms_text_Privacy".localize_)\\b")
        self.lblTerms.enabledTypes = [customTypeTerms, customTypePrivce]
        self.lblTerms.text = "\("RegestrationVC_btnTerms_text_title".localize_)\("RegestrationVC_btnTerms_text_Terms".localize_)\("RegestrationVC_btnTerms_text_And".localize_)\("RegestrationVC_btnTerms_text_Privacy".localize_)"
        self.lblTerms.customAttributes = [customTypeTerms: termsAttributes,
                                          customTypePrivce: termsAttributes]
        self.lblTerms.customSelectedColor[customTypeTerms] = "#0096B4".color_
        self.lblTerms.customSelectedColor[customTypePrivce] = "#0096B4".color_

        self.lblTerms.handleCustomTap(for: customTypeTerms) { _ in
            InitiateInstanceWithPush(vcClass: TermsAndPrivacyViewController(), storyboard: .userAuth) { (vc) in
                vc.title = "RegestrationVC_btnTerms_text_Terms".localize_
                vc.route = .terms
            }
        }
        self.lblTerms.handleCustomTap(for: customTypePrivce) { _ in
            InitiateInstanceWithPush(vcClass: TermsAndPrivacyViewController(), storyboard: .userAuth) { (vc) in
                vc.title = "RegestrationVC_btnTerms_text_Privacy".localize_
                vc.route = .privacy
            }
        }

        self.stackViewServiceProviderContaner.isHidden = self.route != .service_provider
        self.imgProfessionLicense.isHidden = true
    }

    func fetchData() {
        let request = ConstantsRequest(.getServices)
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
            self.services = result.services
        }
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
    @IBAction func btnMap(_ sender: Any) {
        
        let locationPicker = LocationPicker()
        locationPicker.currentLocationText = "CurrentLocation".localize_
        locationPicker.pickCompletion = { [self] (pickedLocationItem) in
            
            self.txtAddress.text = "\(pickedLocationItem.name ?? "\(pickedLocationItem.coordinate?.latitude ?? 0.0) -\(pickedLocationItem.coordinate?.longitude ?? 0.0) " )"
            self.lat = "\(pickedLocationItem.coordinate?.latitude ?? 0.0)"
            self.long = "\(pickedLocationItem.coordinate?.longitude ?? 0.0)"
            // Do something with the location the user picked.
        }
        navigationController!.pushViewController(locationPicker, animated: true)
    }
    @IBAction func btnSelectServiceProvider(_ sender: UIButton) {
        var dataArray = [String]()
        var dataDict = [Int: String]()
        guard let services = services else {
            return
        }
        for service in services {
            dataArray.append(service.name ?? "")
            dataDict[service.pk_i_id?.intValue ?? 0] = service.name
        }
        
        let selectionMenu = RSSelectionMenu(selectionStyle: .multiple, dataSource: dataArray) { (cell, item, indexPath) in
            cell.textLabel?.text = item
        }
        selectionMenu.setSelectedItems(items: selectServiceProviderArr) { [weak self] (item, index, isSelected, selectedItems) in
            self?.selectedServicesArr = []
            self?.selectServiceProviderArr = selectedItems
            for item in selectedItems {
                for (key, value) in dataDict {
                    if value == item {
                        self?.selectedServicesArr.append(Int32(key))
                    }
                }
            }
        }
        selectionMenu.show(style: .popover(sourceView: sender, size: CGSize(width: 300, height: 300)), from: self)
    }

    @IBAction func btnProfessionLicense(_ sender: UIButton) {
        self.fdTake_action(sender) { photo, _ in
            self.txtProfessionLicense.isHidden = true
            self.imgProfessionLicense.isHidden = false
            self.imgProfessionLicense.image = photo
        }
    }

    func showErrorMSG(msgText: String) -> Bool {
        self.showPopAlert(title: "Error".localize_, message: "TextFeildValidation".localized(with: msgText))
        return false
    }

    @IBAction func btnRegistration(_ sender: Any) {
        if !self.validation() {
            return
        }
        
        switch self.route {
        case .client:
            let request = UserRequest(.signUp(mobile: self.txtPhoneNumber.phoneNumberWithoutPrefix(), mobileIntro: self.txtPhoneNumber.prefix, password: self.txtPassword.text?.removeArabicNumbers, fullName: txtFullName.text?.removeArabicNumbers,address: self.txtAddress.text,lat: self.lat,long: self.long))
            RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
                InitiateInstanceWithPush(vcClass: VerificationCodeViewController(), storyboard: .userAuth) { (vc) in
                    vc.mobile = self.txtPhoneNumber.phoneNumberWithoutPrefix()
                    vc.mobile_intro = self.txtPhoneNumber.prefix
                    vc.password = self.txtPassword.text
                    vc.verificationType = .login
                }
            }
            break
        case .service_provider:
            let request = UserRequest(.providerSignUp(mobile: self.txtPhoneNumber.phoneNumberWithoutPrefix(), mobileIntro: self.txtPhoneNumber.prefix, password: self.txtPassword.text?.removeArabicNumbers, fullName: txtFullName.text?.removeArabicNumbers, idno: txtID.text, license_photo: self.imgProfessionLicense.image, service_ids: selectedServicesArr ,address: self.txtAddress.text,lat: self.lat,long: self.long))
            RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (response) in
//                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) { [weak self] in
//                    AppDelegate.sharedInstance.rootNavigationController.showPopAlert(title: "Success".localize_, message: "RegestrationVC_number_check".localize_)
//                }
                AppDelegate.sharedInstance.rootNavigationController.setFirstVC()
                InitiateInstanceWithPush(vcClass: VerificationCodeViewController(), storyboard: .userAuth) { (vc) in
                    vc.mobile = self.txtPhoneNumber.phoneNumberWithoutPrefix()
                    vc.mobile_intro = self.txtPhoneNumber.prefix
                    vc.password = self.txtPassword.text
                    vc.verificationType = .registeration
                }
            }
            break
        }
    }
}

extension RegistrationViewController {
    func validation() -> Bool {
        if self.txtPhoneNumber.text?.isEmptyOrWhiteSpace() == true || (self.txtPhoneNumber.text ?? "").count < 15 {
            return self.showErrorMSG(msgText: "LoginVC_lblPhoneNumber_text".localize_)
        } else if self.txtFullName.text?.isEmptyOrWhiteSpace() == true {
            return self.showErrorMSG(msgText: "RegestrationVC_lblUsername_text".localize_)
        } else if self.txtPassword.text?.isEmptyOrWhiteSpace() == true {
            return self.showErrorMSG(msgText: "LoginVC_lblPassword_text".localize_)
        } else if self.txtID.text?.isEmptyOrWhiteSpace() == true && self.route == .service_provider{
            return self.showErrorMSG(msgText: "RegestrationVC_lblIDNumber_text".localize_)
        } else if self.txtServicesProvided.text?.isEmptyOrWhiteSpace() == true && self.route == .service_provider{
            return self.showErrorMSG(msgText: "RegestrationVC_lblServicesProvided_text".localize_)
        } else if self.imgProfessionLicense.image == nil && self.route == .service_provider {
            return self.showErrorMSG(msgText: "RegestrationVC_lblProfessionLicense_text".localize_)
        }
        return true
    }
}
