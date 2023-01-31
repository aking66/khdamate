//
//  OrderCancelReasonsViewController.swift
//  Done
//
//  Created by Mo'min J.Abusaada on 23/02/2021.
//

import UIKit
import MIBlurPopup

class OrderCancelReasonsViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblOrderNumber: UILabel!
    @IBOutlet weak var tpickerCancelReasons: Picker!
    @IBOutlet weak var txtDetails: UITextView!
    @IBOutlet weak var tableView: GeneralTableView!{
        didSet{
            self.tableView.tableFooterView = UIView()
        }
    }
    
    var order_id:NSNumber?
    var order_no:NSNumber?
    var reasons: [TConstantObject]?
    var choosedReason: NSNumber?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblTitle.text = "\("OrderOffersVC_lblOrder_title".localize_) #\(self.order_no?.stringValue ?? "0")"
        self.lblOrderNumber.text = self.lblTitle.text
        self.getDataFromServer()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.setupView()
    }
    
    func setupView() {
        self.tpickerCancelReasons.imgICON.isHidden = true
        self.tpickerCancelReasons.items = self.reasons?.map({ $0.name ?? "" }) ?? []
        self.tpickerCancelReasons.handlerFunc { [weak self] (item, date) in
            if let index = self?.tpickerCancelReasons.index, index > -1 {
                self?.choosedReason = self?.reasons?[index].pk_i_id
            }
        }
    }
    
    func getDataFromServer(){
//        self.tableView.clearData(true)
//        let request = ConstantsRequest(.getCancelOrderReasons)
//        self.tableView.isPullToRefreshEnabled = true
////        self.tableView.isLoadMoreEnabled = true
//        self.tableView.ofRequest(request)
//            .reuseIdentifier("OrderCancelReasonsTableViewCell")
//            .handleResponse { (BaseResponse) -> [Any]? in
//                return BaseResponse.cancelReasons
//            }.start()
        
        let request = ConstantsRequest(.getCancelOrderReasons)
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
            self.reasons = result.cancelReasons
            self.setupView()
        }
    }

    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        guard let reasonObject = self.choosedReason else {
            self.showErrorMessage(message: "PleaseSelectOneOfCancelReasons".localize_)
            return
        }
        self.sendCancelReqesut(reason: reasonObject, confirm: false)
    }
    func sendCancelReqesut(reason: NSNumber, confirm: Bool) {
        let request = OrderRequest(.cancelOrder(order_id: self.order_id, cancel_reason_id: reason, cancel_reason_text: txtDetails.text))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
            if responce.status?.codeNumber?.intValue == -2 {
                let alertController = UIAlertController(title: "Attention".localize_, message:responce.status?.message ?? "", preferredStyle:.alert)
                alertController.addAction(UIAlertAction(title: "OK".localize_, style:.default, handler: { (action) in
                    self.sendCancelReqesut(reason:reason, confirm: true)
                }))
                alertController.addAction(UIAlertAction(title: "Cancel".localize_, style:.cancel, handler: { (action) in

                }))
                self.present(alertController, animated: true, completion: nil)
            } else {
                self.dismiss(animated: true, completion: nil)
                AppDelegate.sharedInstance.rootNavigationController.popToRootViewController(animated: true)
//                AppDelegate.sharedInstance.rootNavigationController.dismiss(animated: true, completion: {
//                    AppDelegate.sharedInstance.rootNavigationController.popToRootViewController(animated:true)
//                })
//                AppDelegate.sharedInstance.orderOffersVC = nil
                if let parent = self.parent as? ChatOrderViewController {
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) { [weak self] in
                        parent.refreshParentList?()
                    }
                }
            }
        }

    }
}

extension OrderCancelReasonsViewController:MIBlurPopupDelegate{
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
