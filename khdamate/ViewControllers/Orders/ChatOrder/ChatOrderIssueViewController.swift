//
//  ChatOrderIssueViewController.swift
//  Done
//
//  Created by Mo'min J.Abusaada on 16/03/2021.
//

import UIKit
import MIBlurPopup

class ChatOrderIssueViewController: UIViewController {

    @IBOutlet weak var lblOrderNo: UILabel!
    @IBOutlet weak var txtReportType: UITextField!
    @IBOutlet weak var txtReportDetails: UITextView!
    
    var order_id: NSNumber?
    var order_no: NSNumber?
    var parentVC: ChatOrderViewController?
    var selectedType:OrderIssueType?
    var complaintTypes = [TConstantObject]()
    var choosedType: NSNumber?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblOrderNo.text = "\("OrderID".localize_) #\(self.order_no?.stringValue ?? "0")"
       // self.fetchData()
    }

    @IBAction func btnReportType(_ sender: UIButton) {
        let alertController = UIAlertController(title: "OrderCreateVC_menuActions_report_order".localize_, message:nil, preferredStyle:.actionSheet)
        for type in complaintTypes {
            alertController.addAction(UIAlertAction(title: type.name, style:.default, handler: { (action) in
                self.txtReportType.text = action.title
                self.choosedType = type.pk_i_id
            }))
        }
        
        alertController.addAction(UIAlertAction(title: "Cancel".localize_, style:.cancel, handler: { (action) in
            
        }))
        if let presenter = alertController.popoverPresentationController {
            presenter.sourceView = sender
            presenter.sourceRect = sender.bounds
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func btnSend(_ sender: Any) {
//        if self.choosedType == nil {
//            self.showPopAlert(title: "Error".localize_, message: "TextFeildValidation".localized(with: "ChatOrderIssueVC_lblReportType_text".localize_))
//            return
//        } else
        if (self.txtReportDetails.text ?? "").isEmptyOrWhiteSpace() == true {
            self.showPopAlert(title: "Error".localize_, message: "TextFeildValidation".localized(with: "ChatOrderIssueVC_lblReportDetails_text".localize_))
            return
        }
        let request = OrderRequest(.addOrderIssue(order_id: order_id, text: txtReportDetails.text))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
            self.dismiss(animated: true, completion: nil)
            self.parentVC?.getDataFromServer()
        }
    }
    @IBAction func btnCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func fetchData() {
        let request = ConstantsRequest(.getComplaintTypes)
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
            self.complaintTypes = result.complaintTypes
        }
    }
}

extension ChatOrderIssueViewController:MIBlurPopupDelegate{
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
