//
//  CustomOffersListSectionHeaderView.swift
//  khdamate
//
//  Created by Yaser on 31/12/2021.
//

import UIKit

class CustomOffersListSectionHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var lblOrderNo: UILabel!
    
    var orderID: NSNumber?
    
    @IBAction func btnDetails(_ sender: Any) {
        InitiateInstanceWithPush(vcClass: OrderDetailsViewController(), storyboard: .orders) { vc in
            vc.order_id = self.orderID
            vc.routeType = .orderDetails
        }
    }
}
