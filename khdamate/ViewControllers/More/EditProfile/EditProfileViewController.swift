//
//  EditProfileViewController.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 14/11/2021.
//

import UIKit
import SwiftPhoneNumberFormatter
import RSSelectionMenu
import LocationPickerViewController

class EditProfileViewController: UIViewController {

    @IBOutlet weak var viewContaner: customMaskUIView!
    @IBOutlet weak var img: roundedImage!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var txtPhoneNumber: PhoneFormattedTextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet var stackViewServiceProviderContaner: UIStackView!
    @IBOutlet var txtID: UITextField!
    @IBOutlet var txtServicesProvided: UITextField!
    @IBOutlet var txtProfessionLicense: UITextField!
    @IBOutlet var imgProfessionLicense: UIImageView!
    var lat = ""
    var long = ""
    var selectedServicesArr: [Int32] = []
    var selectServiceProviderArr = [String]() {
        didSet {
            self.txtServicesProvided.text = self.selectServiceProviderArr.joined(separator: ",")
            self.updateSelectedServicesArr()
        }
    }
    var user: TUserObject?
    var services: [TConstantObject]?
    var professionLicense = UIImage()
    var refreshStart: (()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setupView()
        self.fetchData()
    }
    

    @IBAction func gestChangeImage(_ sender: Any) {
        self.fdTake_action(self.img) { photo, info in
            self.img.image = photo
        }
    }
    
    @IBAction func btnSelectServiceProvider(_ sender: UIButton) {
        var dataArray = [String]()
        guard let services = services else {
            return
        }
        for service in services {
            dataArray.append(service.name ?? "")
        }
        let selectionMenu = RSSelectionMenu(selectionStyle: .multiple, dataSource: dataArray) { (cell, item, indexPath) in
            cell.textLabel?.text = item
            guard let services = self.user?.service_names as? [String] else { return }
            for n in (services) {
                if n == item {
                    cell.isSelected = true
                }
            }
        }
        selectionMenu.setSelectedItems(items: selectServiceProviderArr) { [weak self] (item, index, isSelected, selectedItems) in
            self?.selectServiceProviderArr = selectedItems
        }
        selectionMenu.show(style: .popover(sourceView: sender, size: CGSize(width: 300, height: 300)), from: self)
    }
    
    func updateSelectedServicesArr() {
        var dataDict = [Int: String]()
        guard let services = services else {
            return
        }
        for service in services {
            dataDict[service.pk_i_id?.intValue ?? 0] = service.name
        }
        self.selectedServicesArr = []
        for item in self.selectServiceProviderArr {
            for (key, value) in dataDict {
                if value == item {
                    self.selectedServicesArr.append(Int32(key))
                }
            }
        }
    }
    
    @IBAction func btnProfessionLicense(_ sender: UIButton) {
        self.fdTake_action(sender) { photo, _ in
            self.txtProfessionLicense.isHidden = true
            self.imgProfessionLicense.isHidden = false
            self.imgProfessionLicense.image = photo
            self.professionLicense = photo
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
    @IBAction func btnUpdate(_ sender: Any) {
        let request = UserRequest(.editProfile(name: self.txtName.text, image: self.img.image, address: self.txtAddress.text,lat: self.lat,long: self.long, email: self.txtEmail.text, idNo: self.txtID.text, service_ids: self.selectedServicesArr, license_photo: self.imgProfessionLicense.image))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (result) in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) { [weak self] in
//                self?.refreshStart?()
                (AppDelegate.sharedInstance.rootTabBarController.viewControllers?[2] as? MoreViewController)?.fetchData()
            }
            self.popToRootVC()
        }
    }
   
    func setupView() {
        self.viewContaner.roundCorners(roundshapeType: .topCorner, radius: 20)
        if let img = user?.s_profileImageUrl, user?.s_profileImageUrl != "http://khadamat.techno2030.com/public/logo.png" {
            self.img.sd_setImage_(urlString: img)
        } else {
            self.img.image = "img_defaultProfile".image_
        }
        
        self.lblUserName.text = user?.s_name
        
        self.txtPhoneNumber.config.defaultConfiguration = PhoneFormat(defaultPhoneFormat: " (##) #######")
        self.txtPhoneNumber.prefix = user?.mobile_intro
        self.txtPhoneNumber.placeholder = " (54) 1234567"
        self.txtPhoneNumber.formattedText = user?.mobile
        
        self.txtName.text = user?.s_name
        self.txtEmail.text = user?.email
        self.txtAddress.text = user?.address
        self.lat = user?.latitude ?? ""
        self.long = user?.longitude ?? ""
        self.stackViewServiceProviderContaner.isHidden = UserProfile.sharedInstance.currentUser?.b_provider == false
        self.imgProfessionLicense.sd_setImage_(urlString: user?.license_photo ?? "")
        self.professionLicense = user?.license_photo?.getImage() ?? UIImage()
//        self.imgProfessionLicense.isHidden = true

        self.txtID.text = user?.idno
        guard let services = self.user?.service_names as? [String] else { return }
        self.selectServiceProviderArr = services
    }
    
    func fetchData() {
        let request = UserRequest(.getProfile)
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
            self.user = result.userObject
            if UserProfile.sharedInstance.currentUser?.b_provider == true {
                let request = ConstantsRequest(.getServices)
                RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
                    self.services = result.services
                    self.setupView()
                }
            } else {
                self.setupView()
            }
        }
    }
}
