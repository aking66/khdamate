/************************* Mo’min J.Abusaada *************************/
//
//  MoreTableViewCell.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 03/11/2021.
//

import UIKit
import MIBlurPopup

class MoreTableViewCell : GeneralTableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var stackViewLanguageContaner: UIStackView!
    @IBOutlet weak var viewLanguageARContaner: UIView!
    @IBOutlet weak var viewLanguageENContaner: UIView!
    
    @IBOutlet weak var switchStatus: UISwitch!
    @IBOutlet weak var lblSubTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func configerCell() {
        let obj = self.object.object as! MoreListType
        
        self.img.image = obj.icon
        self.img.imageTintColor = "#00A1C3".color_
        self.lblTitle.text = obj.s_title
        
        self.accessoryType = (obj == .language || obj == .status ) ? .none : .disclosureIndicator
        
        self.lblSubTitle.text = "MoreVC_lblOnlineOffline".localize_
        self.lblSubTitle.isHidden = obj != .status
        self.switchStatus.isHidden = obj != .status
        self.stackViewLanguageContaner.isHidden = obj != .language
        
        if UserProfile.sharedInstance.currentUser?.b_provider == true {
            self.switchStatus.setOn((parentVC as? MoreViewController)?.user?.is_online?.boolValue ?? false, animated: false)
        }
        
        if UserProfile.sharedInstance.isRTL() == true {
            self.viewLanguageARContaner.alpha = 0.5
            self.viewLanguageENContaner.alpha = 1
        }else{
            self.viewLanguageARContaner.alpha = 1
            self.viewLanguageENContaner.alpha = 0.5
        }
    }
    
    override func didselect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {
        let obj = self.object.object as! MoreListType
        
        switch obj {
        case .profile:
            guard !UserProfile.sharedInstance.isUserGuest else {
                self.parentVC.showPopAlertWithCancel(title: "Alert", message: "LoginIsRequired".localize_) {
                    UserProfile.sharedInstance.currentUser = nil
                    AppDelegate.sharedInstance.rootNavigationController.setFirstVC()
                }
                return
            }
            if UserProfile.sharedInstance.currentUser?.b_provider == true {
                InitiateInstanceWithPush(vcClass: ProfileViewController(), storyboard: .more) { vc in
                    vc.title = obj.s_title
                }
                
            }else{
                
                InitiateInstanceWithPush(vcClass: EditProfileViewController(), storyboard: .more) { vc in
                    vc.title = "MoreListType_profile".localize_
                    vc.refreshStart = { () in
                        DispatchQueue.main.async {
                            
                        }
                    }
                }
            }
            break
        case .password:
            guard !UserProfile.sharedInstance.isUserGuest else {
                self.parentVC.showPopAlertWithCancel(title: "Alert", message: "LoginIsRequired".localize_) {
                    UserProfile.sharedInstance.currentUser = nil
                    AppDelegate.sharedInstance.rootNavigationController.setFirstVC()
                }
                return
            }
            let vc = ChangePasswordViewController.initiateInstance(storyboard: .more)
            MIBlurPopup.show(vc, on: self.parentVC)
            
            break
        case .settings:
            break
        case .favorite:
            guard !UserProfile.sharedInstance.isUserGuest else {
                self.parentVC.showPopAlertWithCancel(title: "Alert", message: "LoginIsRequired".localize_) {
                    UserProfile.sharedInstance.currentUser = nil
                    AppDelegate.sharedInstance.rootNavigationController.setFirstVC()
                }
                return
            }
            InitiateInstanceWithPush(vcClass: ServicesListViewController(), storyboard: .home) { vc in
                vc.screenType = .favorite
            }
            break
        case .about:
            InitiateInstanceWithPush(vcClass: TermsAndPrivacyViewController(), storyboard: .userAuth) { (vc) in
                vc.title = obj.s_title
                vc.route = .aboutApp
            }
            break
        case .contanctUS:
            InitiateInstanceWithPush(vcClass: ContactUSViewController(), storyboard: .more) { (vc) in
                vc.title = obj.s_title
            }
            break
        case .privacy:
            InitiateInstanceWithPush(vcClass: TermsAndPrivacyViewController(), storyboard: .userAuth) { (vc) in
                vc.title = obj.s_title
                vc.route = .privacy
            }
            break
        case .language:
            break
        case .logout:
          if  UserProfile.sharedInstance.isUserGuest {
              UserProfile.sharedInstance.currentUser = nil
              AppDelegate.sharedInstance.rootNavigationController.setFirstVC()

               return
            }
            let alertController = UIAlertController(title: "Attention".localize_, message:"DoYouWantToLogout".localize_, preferredStyle:.alert)
            alertController.addAction(UIAlertAction(title: "OK".localize_, style:.default, handler: { (action) in
                RequestWrapper.sharedInstance.makeRequest(request: UserRequest(.logout)).didComplete({ (data, error) in
                   
                }).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                        UserProfile.sharedInstance.currentUser = nil
                        AppDelegate.sharedInstance.rootNavigationController.setFirstVC()
                    }
                }
            }))
            alertController.addAction(UIAlertAction(title: "Cancel".localize_, style:.cancel, handler: { (action) in
                
            }))
            self.parentVC.present(alertController, animated: true, completion: nil)
            break
        case .status:
           
            break
        case .wallet:
            InitiateInstanceWithPush(vcClass: WalletViewController(), storyboard: .more) { (vc) in
                vc.title = obj.s_title
            }
        case .deleteAccount:
            guard !UserProfile.sharedInstance.isUserGuest else {
                self.parentVC.showPopAlertWithCancel(title: "Alert", message: "LoginIsRequired".localize_) {
                    UserProfile.sharedInstance.currentUser = nil
                    AppDelegate.sharedInstance.rootNavigationController.setFirstVC()
                }
                return
            }
                self.parentVC.showPopAlertWithCancel(title: "Alert", message: "Are you sure delete acount ?".localize_) {
                    self.showPopAlert(title: "Succses".localize_, message: "The account will be deleted within 48 hours".localize_
                    )

                }
           
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {
    }
    
    @IBAction func btnAR(_ sender: Any) {
        if UserProfile.sharedInstance.isRTL() == true {
            return
        }
        UserProfile.changeLangTo("ar",okHandler: {
            self.configerCell()
        }) {
            self.configerCell()
        }
    }
    
    @IBAction func btnEN(_ sender: Any) {
        if UserProfile.sharedInstance.isRTL() == false {
            return
        }
        UserProfile.changeLangTo("en",okHandler: {
            self.configerCell()
        }) {
            self.configerCell()
        }
    }
    @IBAction func switchStatus(_ sender: Any) {
        let request = ServiceProviderRequest(.changeStatus)
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
           // self.switchStatus.toggle()
        }
    }
    func showPopAlert(title:String,message msg:String,okAction:(() -> Void)? = nil)  {
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title:"OK".localize_, style: .default, handler: { (pAlert) in
            //Do whatever you wants here
            okAction?()
        })
        alertController.addAction(defaultAction)
        self.parentVC.present(alertController, animated: true, completion: nil)
    }
}
