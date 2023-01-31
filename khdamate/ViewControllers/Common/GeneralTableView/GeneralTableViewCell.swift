/************************* Mo’min J.Abusaada *************************/
//
//  GeneralTableViewCell.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//

import UIKit

protocol GeneralTableViewCellDelegate : NSObjectProtocol {
    func didselect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, forObject object:GeneralTableViewData)
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath, forObject object:GeneralTableViewData) -> Bool
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath, forObject object:GeneralTableViewData)
    func canSelect(objc:Any?)->Bool
}

class GeneralTableViewCell: UITableViewCell,GeneralTableViewCellDelegate {
    
    weak open var tableView : GeneralTableView!
    open var indexPath : IndexPath!
    weak open var parentVC : UIViewController!
    weak open var object : GeneralTableViewData!
    open var isSubObjectSelected : Bool = false
    weak open var delegate: GeneralTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.delegate = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configerCell() {
        
    }
    func didselect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, forObject object:GeneralTableViewData) {
        
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath, forObject object:GeneralTableViewData) -> Bool {
        return false
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath, forObject object:GeneralTableViewData) {
        
    }
    func canSelect(objc: Any?) -> Bool {
        return true
    }
}
