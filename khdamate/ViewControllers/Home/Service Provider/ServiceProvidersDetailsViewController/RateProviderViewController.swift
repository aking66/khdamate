//
//  RateViewController.swift
//  khdamate
//
//  Created by Yaser on 01/01/2022.
//

import Foundation
import UIKit
import MIBlurPopup
import HCSStarRatingView
import SONetwork

class RateProviderViewController: UIViewController {

   // @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblOrderNumber: UILabel!
    @IBOutlet weak var txtDetails: UITextView!
    @IBOutlet weak var viewRate: HCSStarRatingView!
    
    var provider_id:NSNumber?
    var parentVC: reviewListViewController?
    var selectedType: OrderListType = .comments
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        viewRate.isHidden = self.selectedType == .comments
    }
    
   

    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showErrorMSG(msgText: String) -> Bool {
        self.showPopAlert(title: "Error".localize_, message: "TextFeildValidation".localized(with: msgText))
        return false
    }

    func validation() -> Bool {
        if self.txtDetails.text?.isEmptyOrWhiteSpace() == true  {
            return self.showErrorMSG(msgText: "Comments".localize_)
        }
        return true
    }
    @IBAction func btnSend(_ sender: Any) {
        if !self.validation() {
            return
        }

        
                
        
        let dic2 : HTTPHeaders = [
                "Content-Language" : "\(UserProfile.sharedInstance.isRTL() == true ? "ar" : "en")",
                "device-os" : "ios",
                "Authorization" : "Bearer \(UserProfile.sharedInstance.currentUserToken ?? "")"
            ]
            self.showHideLoaderView(showLoader: true)
        var parameters: Dictionary<String, AnyObject> = [:]
        parameters["provider_id"] = "\(self.provider_id ?? 0)" as AnyObject
        parameters["text"] = "\(txtDetails.text ?? "")" as AnyObject
        if self.selectedType == .rates {
            parameters["rate"] = NSNumber(value: Float(self.viewRate.value)) as AnyObject

        }
        SO.request("POST", url:  GlobalConstants.API_Provider_getProvider_Controller +  "\(self.selectedType == .comments ? "/comment" : "/rate" )" , header:dic2, parameters: parameters, success: { (jsonString) in
                DispatchQueue.main.async {
                    
                    let parVC = self.parentVC!
                    parVC.fetchData()
                    self.dismiss(animated: true, completion: nil)

                }
                
                    }) { (error) in
                        self.showHideLoaderView(showLoader: false)
                        DispatchQueue.main.async {
                            
                            self.showPopAlert(title: "Error".localize_, message: error?.localizedDescription ?? "Somthing Wrong")
                        }
                    }
     
        

    }
}


extension RateProviderViewController:MIBlurPopupDelegate{
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
