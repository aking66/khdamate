//
//  OrderCreatePaymentSelectionViewController.swift
//  Done
//
//  Created by Mo'min J.Abusaada on 21/02/2021.
//

import UIKit
import MIBlurPopup

class OrderCreatePaymentSelectionViewController: UIViewController {

    @IBOutlet weak var tableView: GeneralTableView!{
        didSet{
            self.tableView.selectionType = .single
            self.tableView.minimumSelectionCount = 1
            self.tableView.tableFooterView = UIView()
        }
    }
    @IBOutlet weak var btnSelect: UIButton!
    var completionBlock:((_ selectedPayment:TPaymentWayObject?) -> Void)?
    
//    var parentVC:OrderCreateViewController?
    var b_payOnly = false
    var b_onlineOnly = false
    var tempOrder_id: NSNumber?
    var tempOrder_no: NSNumber?
    var amount: NSNumber?
    var paymentOperation:OrderPaymentOperation?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if self.b_payOnly == true {
            self.btnSelect.localized = "Select"
        }
        self.tableView.clearData(true)
//        for obj in TempObjects.sharedInstance.paymentWaysArray {
//            if b_onlineOnly == true && obj.b_online?.boolValue == false{
//                continue
//            }
//            self.tableView.objects.append(GeneralTableViewData(reuseIdentifier: "OrderCreatePaymentSelectionTableViewCell", object: obj, rowHeight: nil))
//        }
        self.tableView.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func btnSelect(_ sender: Any) {
        if self.tableView.selectedObjects.count == 0 {
            self.showErrorMessage(message: "PleaseSelectPaymentMethod".localize_)
            return
        }
        let selectedPayment = self.tableView.selectedObjects.first as? TPaymentWayObject
//        self.parentVC?.selectedPayment = selectedPayment

        if self.b_onlineOnly == true {
//            HyperpayHelpers.shared.openHyperpayVC(type: selectedPayment?.e_type ?? .visa, order_id: self.tempOrder_id, amount: self.amount,operation: paymentOperation, parentVC: self) {
//                if self.completionBlock != nil {
//                    self.completionBlock?(selectedPayment)
//                }else{
//                    self.performSegueWithCheck(withIdentifier: "unwindToOrderCreateVC", sender: self)
//                }
//            }
        }else{
            self.performSegueWithCheck(withIdentifier: "unwindToOrderCreateVC", sender: self)
        }
    }
    
}
extension OrderCreatePaymentSelectionViewController:MIBlurPopupDelegate{
    var popupView: UIView {
        return self.view
    }
    var blurEffectStyle: UIBlurEffect.Style? {
        return .dark
    }
    var initialScaleAmmount: CGFloat {
        return 0.9
    }
    var animationDuration: TimeInterval {
        return 0.2
    }
}
