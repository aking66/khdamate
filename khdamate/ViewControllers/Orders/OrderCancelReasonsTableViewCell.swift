/************************* Mo’min J.Abusaada *************************/
//
//  OrderCancelReasonsTableViewCell.swift
//  Done
//
//  Created by Mo'min J.Abusaada on 23/02/2021.
//

import UIKit

class OrderCancelReasonsTableViewCell : GeneralTableViewCell {
    
    @IBOutlet weak var imgCheckMark: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func configerCell() {
        let obj = self.object.object as! TConstantObject
        self.lblTitle.text = obj.name
        self.imgCheckMark.isHidden = !self.isSubObjectSelected
        
    }
    override func didselect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {
        
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath, forObject object:GeneralTableViewData) -> Bool {
        return false
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {
        
    }
}
