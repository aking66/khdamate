/************************* Mo’min J.Abusaada *************************/
//
//  WalletTableViewCell.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 16/11/2021.
//

import UIKit

class WalletTableViewCell : UITableViewCell {

    @IBOutlet weak var lblOrderNo: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblOrderPrice: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var obj: KHData! {
        didSet {
            self.lblOrderNo.text = "#" + (obj.orderNo ?? "")
            self.lblDate.text = obj.payDate ?? ""
            self.lblTitle.text = obj.serviceName ?? ""
            self.lblSubTitle.text = obj.serviceDetailName ?? ""
            self.lblOrderPrice.text = "\(obj.totalPrice ?? "") " + "SAR"
        }
        
    }
//    override func configerCell() {
////        let obj = self.object.object as! <#Object Class#>
//        self.lblOrderNo.text = "#1234456789"
//        self.lblDate.text = "16/12/2021"
//        self.lblTitle.text = "Legal Payment Tax"
//        self.lblSubTitle.text = "General Legal Service"
//        self.lblOrderPrice.text = "160 SAR"
//    }
//    override func didselect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {
//        //TODO: open order details
//    }
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath, forObject object:GeneralTableViewData) -> Bool {
//        return false
//    }
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {
//
//    }
}
