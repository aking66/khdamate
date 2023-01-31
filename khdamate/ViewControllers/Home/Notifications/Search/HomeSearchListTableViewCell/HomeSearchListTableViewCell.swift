//
//  HomeSearchListTableViewCell.swift
//  khdamate
//
//  Created by Yaser on 18/12/2021.
//

import UIKit

class HomeSearchListTableViewCell: UITableViewCell {
    @IBOutlet weak var img: roundedImage!
    @IBOutlet weak var btnFavorite: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    
    var obj: TSearchResultObject?
    var serviceDetails: TServiceObject?
    var parentViewController: UIViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnFavorite.isSelected = false
        btnFavorite.isHidden = false
        btnFavorite.setImage(UIImage(named: "ic_favorite"), for: .normal)
        btnFavorite.setImage(UIImage(named: "ic_favorite_fill"), for: .selected)
    }
    
    func configerCell(parentViewController: UIViewController, indexPath: IndexPath) {
        
        if let obj = obj {
            self.obj = obj
            self.serviceDetails = obj.service_details[indexPath.row]
            self.img.sd_setImage_(urlString: serviceDetails?.photo ?? "") //setImageFromURL(urlString: serviceDetails?.photo)
            lblTitle.text = serviceDetails?.name
            lblSubTitle.text = serviceDetails?.descriptions
            if obj.service_details[indexPath.row].added_to_fav?.boolValue == true {
                btnFavorite.isSelected = true
            }
        }
        self.parentViewController = parentViewController
    }
    
    func didSelect(indexPath: NSIndexPath) {
        InitiateInstanceWithPush(vcClass: OrderDetailsViewController(), storyboard: .orders) { vc in
            vc.choosedCategory_id = self.obj?.pk_i_id?.stringValue
            vc.choosedCategory_name = self.obj?.name
            vc.choosedSubService_id = self.serviceDetails?.pk_i_id?.stringValue
            vc.routeType = .makeOrder
        }
    }
    
    @IBAction func btnFavorite(_ sender: Any) {
        let request = ServiceDetailsRequest(.addRomoveFavorite(id: serviceDetails?.pk_i_id))
        
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
//
            if let vc = self.parentViewController as? ServicesListViewController ,vc.screenType == .favorite {
//                self.tableView.addRemoveSelectedObject(obj)
                vc.fetchData()
            } else {
                self.btnFavorite.isSelected = !self.btnFavorite.isSelected
            }
            
        }
    }
}
