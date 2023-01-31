//
//  OffersListTableViewCell.swift
//  khdamate
//
//  Created by Yaser on 18/12/2021.
//

import UIKit

class OffersListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblOrderNo: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblServiceProviderName: UILabel!
    @IBOutlet weak var lblOfferPrice: UILabel!
    @IBOutlet weak var lblRate: UILabel!
    @IBOutlet weak var lblRateCount: UILabel!
    @IBOutlet weak var stackViewActions: UIStackView!
    
    var obj: TOfferObject?
    var orderObj: TOrderOfferObject?
    var parentViewController: UIViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //    override func setSelected(_ selected: Bool, animated: Bool) {
    //        super.setSelected(selected, animated: animated)
    //    }
    
    func configerCell(parentViewController: UIViewController, indexPath: IndexPath) {
        if let obj = obj {
            // self.lblOrderNo.text = "#1234456789"
            self.lblDate.text = obj.created_at
            self.lblServiceProviderName.text = obj.service_provider_name
            
            let attrString = NSMutableAttributedString(string: (obj.offer_price?.stringValue ?? ""),
                                                       attributes: [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12) ])
            attrString.append(NSMutableAttributedString(string: " Riyal".localize_,
                                                        attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10) ]))
            self.lblOfferPrice.attributedText = attrString
            
            self.lblRate.text = NSString(format: "%.1f", obj.rate?.floatValue ?? 0.0) as String
            self.lblRateCount.text = "("+(obj.rate_count?.stringValue ?? "")+")"
        }
        self.parentViewController = parentViewController
    }
    
    func didSelect(indexPath: NSIndexPath) {
        InitiateInstanceWithPush(vcClass: OfferDetailsViewController(), storyboard: .chatOrder) { (vc) in
            vc.offerObject = self.obj
            vc.orderNo = NSNumber(value: Int(self.orderObj?.i_order_no?.stringValue ?? "") ?? -1 )
            vc.orderID = self.orderObj?.i_order_id
            vc.parentVC = self.parentViewController
        }
        self.isSelected = false
    }
    
    @IBAction func btnReject(_ sender: Any) {
        let request = OrderRequest(.rejectOffer(offer_id: obj?.pk_i_id?.intValue))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
            if let vc = self.parentViewController as? OrdersListViewController {
                vc.getDataFromServer()
            }
        }
    }
    
    @IBAction func btnAccept(_ sender: Any) {
        let request = OrderRequest(.acceptOffer(offer_id: obj?.pk_i_id?.intValue))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
            if let parent = self.parentViewController as? OrdersListViewController {
                InitiateInstanceWithPush(vcClass: ChatOrderViewController(), storyboard: .chatOrder) { vc in
                    vc.order_id = self.orderObj?.i_order_id
                    vc.order_no = NSNumber(value: self.orderObj?.i_order_no?.doubleValue ?? 0.0)
                }
                parent.getDataFromServer()
            }
        }
    }
}
