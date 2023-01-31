//
//  OfferDetailsViewController.swift
//  khdamate
//
//  Created by Yaser on 02/01/2022.
//

import UIKit

class OfferDetailsViewController: UIViewController {
    
    @IBOutlet weak var txtGeneralNote: UITextView!
    @IBOutlet weak var lblProviderName: UILabel!
    @IBOutlet weak var lbOfferlCost: UILabel!
    
    @IBOutlet weak var lblOfferDate: UILabel!
    @IBOutlet weak var lblRate: UILabel!
    
    @IBOutlet weak var stackActions: UIStackView!
    
    var chatOrderObject: TChatOrderObject?
    var offerObject: TOfferObject?
    var parentVC: UIViewController?
    var orderID: NSNumber?
    var orderNo: NSNumber?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNavigationBG()
        setupViews()
    }
    
    func setupViews() {
        self.stackActions.isHidden = true
        if self.parentVC is OrdersListViewController {
            self.stackActions.isHidden = false
        }
        txtGeneralNote.isEditable = false
        if let object = chatOrderObject {
            lblProviderName.text = object.service_provider?.s_name
            lbOfferlCost.text = "\(object.total_price ?? "") " + "Riyal".localize_
            lblOfferDate.text = object.order_date
            lblRate.text = NSString(format: "%.1f (%@)", object.service_provider?.rate?.floatValue ?? 0.0, object.service_provider?.rate_count?.stringValue ?? "0") as String
            txtGeneralNote.text = object.provider_notes
        }
        if let object = offerObject {
            lblProviderName.text = object.service_provider_name
            lbOfferlCost.text = "\(object.offer_price?.stringValue ?? "") " + "Riyal".localize_
            lblOfferDate.text = object.created_at
            lblRate.text = NSString(format: "%.1f (%@)", object.rate?.floatValue ?? 0.0, object.rate_count?.stringValue ?? "0") as String
            
            txtGeneralNote.text = object.notes
        }
    }
    
    @IBAction func btnReject(_ sender: Any) {
        let request = OrderRequest(.rejectOffer(offer_id: offerObject?.pk_i_id?.intValue))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
            if let vc = self.parentVC as? OrdersListViewController {
                vc.getDataFromServer()
            }
        }
    }
    
    @IBAction func btnAccept(_ sender: Any) {
        let request = OrderRequest(.acceptOffer(offer_id: offerObject?.pk_i_id?.intValue))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
            if let parent = self.parentVC as? OrdersListViewController {
                InitiateInstanceWithPush(vcClass: ChatOrderViewController(), storyboard: .chatOrder) { vc in
                    vc.order_id = self.orderID
                    vc.order_no = self.orderNo
                }
                parent.getDataFromServer()
            }
        }
    }
}
