/************************* Mo’min J.Abusaada *************************/
//
//  ChatOrderInfoTableViewCell.swift
//  Done
//
//  Created by Mo'min J.Abusaada on 06/03/2021.
//

import UIKit

class ChatOrderInfoTableViewCell : GeneralTableViewCell {

    @IBOutlet weak var viewContaner: customMaskUIView!
    @IBOutlet weak var imgServiceProvider: roundedImage!
    @IBOutlet weak var imgUser: roundedImage!
    @IBOutlet weak var lblTime: UILabel!
    
   // @IBOutlet weak var imgServiceProvider: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgStare: UIImageView!
    @IBOutlet weak var lblSubTitle: UILabel!
    
    @IBOutlet weak var stackFirst: UIStackView!
    @IBOutlet weak var lblFirstTitle: UILabel!
    @IBOutlet weak var lblFirstValue: UILabel!
    
    @IBOutlet weak var stackSecond: UIStackView!
    @IBOutlet weak var lblSecondTitle: UILabel!
    @IBOutlet weak var lblSecondValue: UILabel!
    
    @IBOutlet weak var lblThirdTitle: UILabel!
    @IBOutlet weak var lblThirdValue: UILabel!
    @IBOutlet weak var stackThird: UIStackView!
    @IBOutlet weak var viewThird: roundedView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func configerCell() {
        let isUserCell = self.object.object as! Bool
        let obj = (self.parentVC as? ChatOrderViewController)?.chatOrderObject
        
        self.viewContaner.roundCorners(roundshapeType: .topCorner, radius: 10)
        
        self.lblTime.text = obj?.dt_created?.timeAgoSinceNow()
        if UserProfile.sharedInstance.isRTL() == false {
            self.lblTime.textAlignment = isUserCell ? .right : .left
        } else {
            self.lblTime.textAlignment = isUserCell ? .left : .right
        }
        self.imgUser.alpha = isUserCell == true ? 1 : 0
        self.imgServiceProvider.alpha = isUserCell == true ? 0 : 1
        self.imgStare.isHidden = isUserCell
        self.stackSecond.isHidden = !isUserCell
        self.stackThird.isHidden = true
        
        self.imgUser.sd_setImage_(urlString: obj?.customer?.photo ?? "")
        self.imgServiceProvider.sd_setImage_(urlString: obj?.service_provider?.photo ?? "")
        if isUserCell == true {
            self.lblTitle.text = "\("OrderID".localize_) #\(obj?.order_no?.stringValue ?? "0")"
            
            self.lblSubTitle.text = obj?.dt_created?.dateString(customFormat: "MMM dd yyyy - HH:mm")
            
            self.lblFirstTitle.text = "ChatOrderVC_lblService_text".localize_
            self.lblFirstValue.text = "\(obj?.service_name ?? "")" // ( \(obj?.payment_way?.s_name ?? "") )"
            
            self.lblSecondTitle.text = "ChatOrderVC_lblSubService_text".localize_
            self.lblSecondValue.text = obj?.service_detail_name
            
        } else {
            self.lblTitle.text = obj?.service_provider?.s_name
            self.lblSubTitle.text = NSString(format: "%.1f (%@)", obj?.service_provider?.rate?.floatValue ?? 0.0, obj?.service_provider?.rate_count?.stringValue ?? "0") as String

            self.lblFirstTitle.text = "ChatOrderVC_lblServiceFee_text".localize_
            self.lblFirstValue.text = "\(obj?.total_price ?? "0") \("SAR".localize_)"

        }
        self.lblTime.isHidden = !self.isSubObjectSelected
    }
    override func didselect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {
        
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath, forObject object:GeneralTableViewData) -> Bool {
        return false
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {
        
    }
    @IBAction func btnViewDetails(_ sender: Any) {
        let isUserCell = self.object.object as! Bool
        if isUserCell == true {
            let obj = (self.parentVC as? ChatOrderViewController)?.chatOrderObject
            InitiateInstanceWithPush(vcClass: OrderDetailsViewController(), storyboard: .orders) { (vc) in
               // vc.orderObject = obj
                vc.order_id = obj?.pk_i_id
                vc.order_no = obj?.order_no?.stringValue
                vc.parentVC = self.parentVC
                vc.routeType = .orderDetails
            }
        } else {
            InitiateInstanceWithPush(vcClass: OfferDetailsViewController(), storyboard: .chatOrder) { (vc) in
                vc.chatOrderObject = (self.parentVC as? ChatOrderViewController)?.chatOrderObject
            }
        }
    }
}
