//
//  ServiceProviderTableViewCell.swift
//  khdamate
//
//  Created by Karim Amsha on 9.11.2022.
//

import UIKit

class reviewProviderCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblRate: UILabel!
    @IBOutlet weak var lblComment: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var rateStack: UIStackView!
    var obj: TServiceObject?
    var parentViewController: UIViewController?
    var comment: KHComments! {
        didSet {
            lblName.text = comment.customerName ?? ""
            lblDate.text = comment.date ?? ""
            lblComment.text = comment.text ?? ""
            rateStack.isHidden = true
        }
        
    }
    var work: KHWorks! {
        didSet {
            lblName.text = work.serviceName ?? ""
            lblDate.text = work.date ?? ""
            lblComment.text = work.serviceDetailName ?? ""
            rateStack.isHidden = true
        }
        
    }
    var rate: KHRates! {
        didSet {
            lblName.text = rate.customerName ?? ""
            lblDate.text = rate.date ?? ""
            lblComment.text = rate.text ?? ""
            rateStack.isHidden = false
            self.lblRate.text = NSString(format: "%.1f", rate.rate ?? 0.0) as String

        }
        
    }
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
