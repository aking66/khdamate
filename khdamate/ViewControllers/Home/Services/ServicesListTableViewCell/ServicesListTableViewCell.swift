/************************* Mo’min J.Abusaada *************************/
//
//  ServicesListTableViewCell.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 31/10/2021.
//

import UIKit

class ServicesListTableViewCell : GeneralTableViewCell {

    @IBOutlet weak var img: roundedImage!
    @IBOutlet weak var btnFavorite: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func configerCell() {
        let obj = self.object.object as! TServiceObject
        self.img.sd_setImage_(urlString: obj.photo ?? "")
        self.lblTitle.text = obj.name
        self.lblSubTitle.text = obj.descriptions
        if obj.added_to_fav?.boolValue == true {
            btnFavorite.isSelected = true
//            self.tableView.selectedObjects.append(obj)
        }
        if let vc = self.parentVC as? ServicesListViewController ,vc.screenType == .favorite {
            self.btnFavorite.isSelected = true
        } else {
            self.btnFavorite.isSelected = obj.added_to_fav?.boolValue == true
        }
    }
    
    override func didselect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {
        let obj = self.object.object as! TServiceObject
        let parVC = (self.parentVC as? ServicesListViewController)
        if parVC?.screenType == .selection {
            parVC?.didSelect?(obj)
        } else {
            InitiateInstanceWithPush(vcClass: OrderDetailsViewController(), storyboard: .orders) { vc in
                vc.choosedCategory_id = obj.main_service_id?.stringValue
                vc.choosedCategory_name = obj.main_service_name
                vc.choosedSubService_id = obj.pk_i_id?.stringValue
                vc.routeType = .makeOrder
                vc.fromProvider = parVC?.fromProvider ?? false
                vc.nameProvider = parVC?.nameProvider ?? ""
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath, forObject object:GeneralTableViewData) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {
    }
    
    override func canSelect(objc: Any?) -> Bool {
        return false
    }
    
    @IBAction func btnFavorite(_ sender: Any) {
        let obj = self.object.object as! TServiceObject
        let request = ServiceDetailsRequest(.addRomoveFavorite(id: obj.pk_i_id))
        
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
            if let vc = self.parentVC as? ServicesListViewController ,vc.screenType == .favorite {
//                self.tableView.addRemoveSelectedObject(obj)
                vc.fetchData()
            } else {
                self.btnFavorite.isSelected = !self.btnFavorite.isSelected
            }
        }
    }
}
