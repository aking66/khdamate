//
//  ServiceProviderTableViewCell.swift
//  khdamate
//
//  Created by Karim Amsha on 9.11.2022.
//

import UIKit

class ServiceProviderTableViewCell: GeneralTableViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblRate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func configerCell() {
        let obj = self.object.object as! TProviderObject
        self.img.sd_setImage_(urlString: obj.image_url ?? "")
        self.lblName.text = obj.name
        self.lblRate.text = NSString(format: "%.1f", obj.rate?.floatValue ?? 0.0) as String

    }
 
    override func didselect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {
        let obj = self.object.object as! TProviderObject
        let parVC = (self.parentVC as? ServicesListViewController)
        if parVC?.screenType == .selection {
            parVC?.didSelect?(obj)
        } else {
            InitiateInstanceWithPush(vcClass: ServiceProvidersDetailsViewController(), storyboard: .main) { vc in
                vc.provider_id = obj.pk_i_id
//                vc.choosedCategory_name = obj.main_service_name
//                vc.choosedSubService_id = obj.pk_i_id?.stringValue
//                vc.routeType = .makeOrder
            }
        }
    }
}
