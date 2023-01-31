/************************* Mo’min J.Abusaada *************************/
//
//  ChatOrderRateTableViewCell.swift
//  Done
//
//  Created by Mo'min J.Abusaada on 13/03/2021.
//

import UIKit
import HCSStarRatingView

class ChatOrderRateTableViewCell : GeneralTableViewCell {

    @IBOutlet weak var viewRate: HCSStarRatingView!
    @IBOutlet weak var btnComplete: UIButton!
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func configerCell() {
        let obj = self.object.object as! TChatObject
        self.btnComplete.isHidden = obj.e_category != .rate_request
        self.viewRate.isUserInteractionEnabled = obj.e_category == .rate_request
        self.viewRate.value = CGFloat(obj.value?.toFloat() ?? 0.0)
        self.lblDate.text = obj.created_at?.timeAgoSinceNow()
        self.lblDate.isHidden = !self.isSubObjectSelected
    }
    override func didselect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {

        
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath, forObject object:GeneralTableViewData) -> Bool {
        return false
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {
        
    }
    @IBAction func btnComplete(_ sender: Any) {
        let parVC = self.parentVC as! ChatOrderViewController
        let request = ChatOrderRequest(.driverRateOrder(order_id: parVC.order_id, rate: NSNumber(value: Float(self.viewRate.value))))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
            parVC.getDataFromServer()
        }
    }
}
