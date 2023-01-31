//
//  ServiceProviderTableViewCell.swift
//  khdamate
//
//  Created by Karim Amsha on 9.11.2022.
//

import UIKit

class ServiceProviderCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var rowImage: UIImageView!
    var obj: KHServices?
    var parentViewController: UIViewController?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configerCell(parentViewController: UIViewController, indexPath: IndexPath) {
        if let obj = obj {
            self.lblName.text = obj.name
        }
        self.parentViewController = parentViewController
    }
    
    func didSelect(indexPath: NSIndexPath) {
        if let obj = obj {
            InitiateInstanceWithPush(vcClass: reviewListViewController(), storyboard: .main) { (vc) in
            }

        }
        
    }
//    override func configerCell() {
//        let obj = self.object.object as! TServiceObject
//        self.lblName.text = obj.name
//
//    }
// 
//    override func didselect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {
//        let obj = self.object.object as! TServiceObject
//        let parVC = (self.parentVC as? ServicesListViewController)
//        if parVC?.screenType == .selection {
//            parVC?.didSelect?(obj)
//        } else {
//            InitiateInstanceWithPush(vcClass: ServiceProvidersDetailsViewController(), storyboard: .main) { vc in
////                vc.choosedCategory_name = obj.main_service_name
////                vc.choosedSubService_id = obj.pk_i_id?.stringValue
////                vc.routeType = .makeOrder
//            }
//        }
//    }
}
