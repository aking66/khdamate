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

class RateViewController: UIViewController {

   // @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblOrderNumber: UILabel!
    @IBOutlet weak var txtDetails: UITextView!
    @IBOutlet weak var viewRate: HCSStarRatingView!
    
    var order_id:NSNumber?
    var order_no:NSNumber?
    var reasons: [TConstantObject]?
    var choosedReason: NSNumber?
    var parentVC: ChatOrderViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblOrderNumber.text = "\("OrderOffersVC_lblOrder_title".localize_) #\(self.order_no?.stringValue ?? "0")"
        self.getDataFromServer()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.setupView()
    }
    
    func setupView() {
    }
    
    func getDataFromServer() {
    }

    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnSend(_ sender: Any) {
        let request = OrderRequest(.rate(order_id: order_id, rate:  NSNumber(value: Float(self.viewRate.value)), text: txtDetails.text))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (result) in
            let parVC = self.parentVC as! ChatOrderViewController
            parVC.getDataFromServer()
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension RateViewController:MIBlurPopupDelegate{
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
