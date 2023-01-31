/************************* Mo’min J.Abusaada *************************/
//
//  OrderCreatePaymentSelectionTableViewCell.swift
//  Done
//
//  Created by Mo'min J.Abusaada on 21/02/2021.
//

import UIKit

class OrderCreatePaymentSelectionTableViewCell : GeneralTableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgCheckmark: UIImageView!
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
        let obj = self.object.object as! TPaymentWayObject
        self.img.sd_setImage_(urlString: obj.s_image ?? "")
        self.lblTitle.text = obj.s_name
        self.lblSubTitle.text = (obj.s_descriptions ?? "")?.isEmptyOrWhiteSpace() == false ? "(\(obj.s_descriptions ?? ""))" : nil
        self.imgCheckmark.isHidden = !self.isSubObjectSelected
    }
    override func didselect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {
        
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath, forObject object:GeneralTableViewData) -> Bool {
        return false
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {
        
    }
}
