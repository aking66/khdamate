/************************* Mo’min J.Abusaada *************************/
//
//  HomeProviderTableViewCell.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 23/11/2021.
//

import UIKit

class HomeProviderTableViewCell : GeneralTableViewCell {
    
    @IBOutlet weak var lblOrderNo: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    
    var obj: TOrderObject?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func configerCell() {
        let obj = self.object.object as! TOrderObject
        self.obj = obj
        self.lblOrderNo.text = "#" + "\(obj.order_no?.stringValue ?? "")"
        self.lblDate.text = obj.order_date?.dateString(customFormat: "yyyy-MM-dd")
        self.lblTitle.text = obj.service_name
        self.lblSubTitle.text = obj.service_detail_name
        
        self.lblOrderNo.alpha = self.parentVC is HomeProviderViewController ? 0 : 1
    }
    
    override func didselect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {
        if let parent = self.parentVC as? OrdersListViewController {
            InitiateInstanceWithPush(vcClass: OrderDetailsViewController(), storyboard: .orders) { vc in
               // let obj = self.object.object as! TOrderObject
                vc.choosedCategory_name = self.obj?.service_name
                vc.choosedSubService_name = self.obj?.service_detail_name
                vc.choosedDate = self.obj?.order_date
                vc.choosedTime = self.obj?.order_time
                vc.order_id = self.obj?.pk_i_id
                vc.routeType = .makeOffer
                vc.orderObject = self.obj
                vc.parentVC = parent
                vc.refreshStart = { () in
                    DispatchQueue.main.async {
                        parent.getDataFromServer()
                    }
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath, forObject object:GeneralTableViewData) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {
        
    }
}
