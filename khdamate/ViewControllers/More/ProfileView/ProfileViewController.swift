//
//  EditProfileViewController.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 14/11/2021.
//

import UIKit
import SwiftPhoneNumberFormatter
import RSSelectionMenu
import SONetwork

class ProfileViewController: UIViewController {

    @IBOutlet weak var viewContaner: customMaskUIView!
    @IBOutlet weak var img: roundedImage!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var txtPhoneNumber: PhoneFormattedTextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var tableHigt: NSLayoutConstraint!

    @IBOutlet var stackViewServiceProviderContaner: UIStackView!
    @IBOutlet var txtID: UITextField!
    @IBOutlet var txtServicesProvided: UITextField!
    @IBOutlet var txtProfessionLicense: UITextField!
    @IBOutlet var imgProfessionLicense: UIImageView!
    var rightBarButtomItem: UIBarButtonItem?

    @IBOutlet weak var tableView: UITableView!{
        didSet{
            self.tableView.registerNib(NibName: ServiceProviderCell.className)
            self.tableView.registerNib(NibName: reviewProviderCell.className_)

        }
    }
    var selectedServicesArr: [Int32] = []
    var selectServiceProviderArr = [String]() {
        didSet {
            self.txtServicesProvided.text = self.selectServiceProviderArr.joined(separator: ",")
            self.updateSelectedServicesArr()
        }
    }
    var user: KHResultProfile?
    var services: [String]? = []
    var works: [KHWorks]? = []

    var professionLicense = UIImage()
    var refreshStart: (()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setupView()
        self.tableView.delegate = self
        self.tableView.dataSource = self

        setEditButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.fetchData()

    }
    func setEditButton() {
        let rightBarButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20 , height: 20))
        rightBarButton.setBackgroundImage(UIImage(named: "edite"), for: .normal)
        rightBarButton.addTarget(self, action: #selector(self.notifications), for: .touchUpInside)

        let rightBarButtomItem = UIBarButtonItem(customView: rightBarButton)
        self.rightBarButtomItem = rightBarButtomItem
        self.navigationItem.rightBarButtonItem = rightBarButtomItem
    }
    
    @objc private func notifications(_ sender: Any) {
        InitiateInstanceWithPush(vcClass: EditProfileViewController(), storyboard: .more) { vc in
            vc.title = "MoreListType_profile".localize_
            vc.refreshStart = { () in
                DispatchQueue.main.async {
                    
                }
            }
        }
    }

    @IBAction func gestChangeImage(_ sender: Any) {
        self.fdTake_action(self.img) { photo, info in
            self.img.image = photo
        }
    }
    
//    @IBAction func btnSelectServiceProvider(_ sender: UIButton) {
//        var dataArray = [String]()
//        guard let services = services else {
//            return
//        }
//        for service in services {
//            dataArray.append(service.name ?? "")
//        }
//        let selectionMenu = RSSelectionMenu(selectionStyle: .multiple, dataSource: dataArray) { (cell, item, indexPath) in
//            cell.textLabel?.text = item
//            guard let services = self.user?.serviceNames as? [String] else { return }
//            for n in (services) {
//                if n == item {
//                    cell.isSelected = true
//                }
//            }
//        }
//        selectionMenu.setSelectedItems(items: selectServiceProviderArr) { [weak self] (item, index, isSelected, selectedItems) in
//            self?.selectServiceProviderArr = selectedItems
//        }
//        selectionMenu.show(style: .popover(sourceView: sender, size: CGSize(width: 300, height: 300)), from: self)
//    }
    
    func updateSelectedServicesArr() {
//        var dataDict = [Int: String]()
//        guard let services = services else {
//            return
//        }
//        for service in services {
//            dataDict[service.id?.intValue ?? 0] = service.name
//        }
//        self.selectedServicesArr = []
//        for item in self.selectServiceProviderArr {
//            for (key, value) in dataDict {
//                if value == item {
//                    self.selectedServicesArr.append(Int32(key))
//                }
//            }
//        }
    }
    
    @IBAction func btnProfessionLicense(_ sender: UIButton) {
        self.fdTake_action(sender) { photo, _ in
            self.txtProfessionLicense.isHidden = true
            self.imgProfessionLicense.isHidden = false
            self.imgProfessionLicense.image = photo
            self.professionLicense = photo
        }
    }
    
    @IBAction func btnUpdate(_ sender: Any) {
        InitiateInstanceWithPush(vcClass: reviewListViewController(), storyboard: .main) { (vc) in
            vc.rates = self.user?.rates ?? []
            vc.comments = self.user?.comments ?? []
            vc.hideBtn = true
        }
    }
   
    func setupView() {
        self.viewContaner.roundCorners(roundshapeType: .topCorner, radius: 20)
        if let img = user?.profileImageUrl, user?.profileImageUrl != "http://khadamat.techno2030.com/public/logo.png" {
            self.img.sd_setImage_(urlString: img)
        } else {
            self.img.image = "img_defaultProfile".image_
        }
        let hightService = services!.count
        let hightWorks = works!.count
        tableHigt.constant = CGFloat(((hightService + hightWorks) * 65)  + 100)
        self.lblUserName.text = user?.name
        
        self.txtPhoneNumber.config.defaultConfiguration = PhoneFormat(defaultPhoneFormat: " (##) #######")
        self.txtPhoneNumber.prefix = user?.mobileIntro
        self.txtPhoneNumber.placeholder = " (54) 1234567"
        self.txtPhoneNumber.formattedText = user?.mobile
        
        self.txtName.text = user?.name
        self.txtEmail.text = user?.email
        self.txtAddress.text = user?.address
        
        self.stackViewServiceProviderContaner.isHidden = UserProfile.sharedInstance.currentUser?.b_provider == false
        self.imgProfessionLicense.sd_setImage_(urlString: user?.licensePhoto ?? "")
//        self.professionLicense = user?.licensePhoto?.getImage() ?? UIImage()
//        self.imgProfessionLicense.isHidden = true

        self.txtID.text = user?.idno
        guard let services = self.user?.serviceNames as? [String] else { return }
        self.selectServiceProviderArr = services
    }
    func fetchData() {
        let dic2 : HTTPHeaders = [
            "Content-Language" : "\(UserProfile.sharedInstance.isRTL() == true ? "ar" : "en")",
            "device-os" : "ios",
            "Authorization" : "Bearer \(UserProfile.sharedInstance.currentUserToken ?? "")"
        ]
        self.showHideLoaderView(showLoader: true)


        SO.request("GET", url:  GlobalConstants.API_User_getProfile_Controller  , header:dic2, parameters: [:], success: { (jsonString) in
                    let data = jsonString?.data(using: .utf8)!
//            print("json : \(parsedData)")
                if let serverResponse = try? JSONDecoder().decode(KHProfile.self, from: data!){
                    print("json : \(serverResponse)")
                    DispatchQueue.main.async {
                        self.user = serverResponse.result

                        self.services = serverResponse.result?.serviceNames ?? []
                        self.works = serverResponse.result?.works ?? []

                        self.tableView.reloadData()
                        self.showHideLoaderView(showLoader: false)
                        self.setupView()
                    }

                    } else {
                        print("bad json - do some recovery")
                        self.showHideLoaderView(showLoader: false)

                    }
                    
                }) { (error) in
                    self.showHideLoaderView(showLoader: false)

                }

    }
//    func fetchData() {
//        let request = UserRequest(.getProfile)
//        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
//            self.user = result.userObject
//            if UserProfile.sharedInstance.currentUser?.b_provider == true {
//                let request = ConstantsRequest(.getServices)
//                RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
//                    self.services = result.services
//                    self.setupView()
//                }
//            } else {
//                self.setupView()
//            }
//        }
//    }
}
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return services!.count

        default:
            return works!.count

        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceProviderCell", for: indexPath) as! ServiceProviderCell
            cell.lblName.text  = services?[indexPath.row]
            cell.rowImage.isHidden = true
//            cell.configerCell(parentViewController: self, indexPath: indexPath)
            return cell

        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "reviewProviderCell", for: indexPath) as! reviewProviderCell
            cell.work = works! [indexPath.row]
            return cell
            
        }
    }
       


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Services".localize_
            
        default:
            return "Works".localize_

        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

}
