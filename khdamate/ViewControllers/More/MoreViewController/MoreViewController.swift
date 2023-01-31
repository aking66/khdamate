//
//  MoreViewController.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 25/10/2021.
//

import UIKit

class MoreViewController: UIViewController {

    @IBOutlet weak var img: roundedImage!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblOrders: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblTotalOrders: UILabel!
    
    @IBOutlet weak var stackPhone: UIStackView!
    @IBOutlet weak var stackEmail: UIStackView!
    @IBOutlet weak var stackAddress: UIStackView!
    
    @IBOutlet weak var tableView: GeneralTableView!{
        didSet{
            self.tableView.registerNib(NibName: MoreTableViewCell.className_)
        }
    }
    
    var user: TUserObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNavigationBG()
       // self.setupView()
        self.fetchData()
    }
    
    func setupView() {
       // let user = UserProfile.sharedInstance.currentUser
        if let img = user?.s_profileImageUrl, user?.s_profileImageUrl != "http://khadamat.techno2030.com/public/logo.png" {
//            self.img.load(url: URL(string: img) ?? URL(fileURLWithPath: ""))
            self.img.sd_setImage_(urlString: img)
        } else {
            self.img.image = "img_defaultProfile".image_
        }
//        self.img.sd_setImage_(urlString: user?.s_profileImageUrl ?? "")
        self.lblUserName.text = user?.s_name
        self.lblOrders.text = user?.total_completed_order?.stringValue
        	
        if user?.email != nil {
            self.lblEmail.text = user?.email
            stackEmail.alpha = 1
        } else {
            stackEmail.alpha = 0
        }
        if user?.address != nil {
            self.lblAddress.text = user?.address
            stackAddress.alpha = 1
        } else {
            stackAddress.alpha = 0
        }
        if user?.mobile != nil {
            self.lblPhoneNumber.text = "+\(user?.mobile_intro ?? "") \(user?.mobile ?? "")"
            stackPhone.alpha = 1
        } else {
            stackPhone.alpha = 0
        }
        
        if UserProfile.sharedInstance.currentUser?.b_provider == true {
            lblTotalOrders.text = "MoreVC_titleProvider".localize_
        } else {
            lblTotalOrders.text = "MoreVC_titleCustomer".localize_
        }
        
        self.tableView.clearData(true)
        for type in MoreListType.allCases {
            self.tableView.objects.append(GeneralTableViewData(reuseIdentifier: MoreTableViewCell.className_, object: type,rowHeight: nil))
        }
        self.tableView.reloadData()
    }
    
    func fetchData() {
        let request = UserRequest(.getProfile)
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
            self.user = result.userObject
            self.user?.is_online = result.userObject?.is_online
            UserProfile.sharedInstance.currentUserPhotoUrl = result.userObject?.s_profileImageUrl
            UserProfile.sharedInstance.currentUserName = result.userObject?.s_name
            (AppDelegate.sharedInstance.rootTabBarController.viewControllers?[0] as? HomeViewController)?.setupView()
            self.setupView()
        }
    }
}


enum MoreListType:String {
    case status
    case profile
    case settings
    case favorite
    case about
    case contanctUS
    case wallet
    case privacy
    case logout
    case password
    case language
    case deleteAccount

    var s_title:String {
        switch self {
            case .profile:
                return "MoreListType_profile".localize_
            case .settings:
                return "MoreListType_settings".localize_
            case .favorite:
                return "MoreListType_favorite".localize_
            case .about:
                return "MoreListType_about".localize_
            case .contanctUS:
                return "MoreListType_contanctUS".localize_
            case .privacy:
                return "MoreListType_privacy".localize_
            case .logout:
            return UserProfile.sharedInstance.isUserGuest ? "MoreListType_login".localize_ : "MoreListType_logout".localize_
            case .password:
                return "MoreListType_password".localize_
            case .language:
                return "MoreListType_language".localize_
            case .status:
                return "MoreVC_lblCurrentStatus".localize_
            case .deleteAccount:
            return "Delete Account".localize_
            case .wallet:
            return "MoreListType_Wallet".localize_
        }
    }
    var icon:UIImage? {
        switch self {
            case .profile:
                return "ic_user".image_
            case .settings:
                return "ic_settings".image_
            case .favorite:
                return "ic_heart".image_
            case .about:
                return "ic_about".image_
            case .contanctUS:
                return "ic_contact_us".image_
            case .privacy:
                return "ic_private".image_
        case .deleteAccount:
            return "ic_user".image_
        case .logout:
            return "ic_user".image_
            case .password:
                return "ic_profile_password".image_
            case .language:
                return "ic_profile_language".image_
            case .status:
                return "ic_current_status".image_
            case .wallet:
                return "ic_wallet".image_
        }
    }
    static var allCases:[MoreListType] {
        if UserProfile.sharedInstance.currentUser?.b_provider == true {
            return [.status,.profile,.password,.about,.contanctUS,.wallet,.privacy,.language,.deleteAccount,.logout]//,.settings
        }
        return [.profile,.password,.favorite,.about,.contanctUS,.privacy,.language,.deleteAccount,.logout]//,.settings
    }
}
