//
//  CalenderOrderTableViewCell.swift
//  khdamate
//
//  Created by Yaser on 20/12/2021.
//

import UIKit

class CalenderOrderTableViewCell: UITableViewCell {

    @IBOutlet weak var lblOrderNo: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    
    var obj: TCalendarObject?
    var parentViewController: UIViewController?
    var order: TOrderObject?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configerCell(parentViewController: UIViewController, indexPath: IndexPath) {
        if let obj = obj {
            order = obj.data[indexPath.row]
            lblSubTitle.text = obj.data[indexPath.row].service_detail_name
            lblTitle.text = obj.data[indexPath.row].service_name
            lblOrderNo.text = "#"+"\(obj.data[indexPath.row].order_no?.stringValue ?? "")"
            lblDate.text = obj.data[indexPath.row].order_date?.dateString(customFormat: "dd/MMM/yyyy")
        }
        self.parentViewController = parentViewController
    }
    
    func didSelect(indexPath: NSIndexPath) {
        InitiateInstanceWithPush(vcClass: OrderDetailsViewController(), storyboard: .orders) { vc in
            vc.order_id = self.order?.pk_i_id
            vc.routeType = .orderDetails
        }
    }
}
