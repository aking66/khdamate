/************************* Mo’min J.Abusaada *************************/
//
//  OrderListTableViewCell.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 02/11/2021.
//

import UIKit

class OrderListTableViewCell : UITableViewCell {
    
    @IBOutlet weak var lblOrderNo: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    
    var obj: TOrderObject?
    var parentViewController: UIViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configerCell(parentViewController: UIViewController, indexPath: IndexPath) {
        if let obj = obj {
            self.lblOrderNo.text = "#" + "\(obj.order_no?.stringValue ?? "")"
            self.lblDate.text = obj.created_at
            self.lblTitle.text = obj.service_name
            self.lblSubTitle.text = obj.service_detail_name
        }
        self.parentViewController = parentViewController
    }
    
    func didSelect(indexPath: NSIndexPath) {
        if let obj = obj {
            if (parentViewController as? OrdersListViewController)?.selectedType == .rejected {
                InitiateInstanceWithPush(vcClass: OrderDetailsViewController(), storyboard: .orders) { (vc) in
                    vc.order_id = obj.pk_i_id
                    vc.order_no = obj.order_no?.stringValue//NSNumber(value: obj.order_no?.toDouble() ?? 0.0)
                    vc.routeType = .orderDetails
                }
            } else {
                if let parent = self.parentViewController as? OrdersListViewController {
                    InitiateInstanceWithPush(vcClass: ChatOrderViewController(), storyboard: .chatOrder) { (vc) in
                        vc.order_id = obj.pk_i_id
                        vc.order_no = obj.order_no
                        vc.parentVC = parent
//                        vc.refreshParentList = { () in
//                            DispatchQueue.main.async {
//                                parent.getDataFromServer()
//                            }
//                        }
                    }
                }
            }
        }
    }
}
