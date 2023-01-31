//
//  ChatOrderFinancialSupportDetailsViewController.swift
//  Done
//
//  Created by Mo'min J.Abusaada on 11/03/2021.
//

import UIKit
import MIBlurPopup
import MWPhotoBrowser

class ChatOrderFinancialSupportDetailsViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var btnAccept: UIButton!
    @IBOutlet weak var btnReject: UIButton!

    
    var object:TChatObject?
    var order_id: NSNumber?
    var order_no: NSNumber?
    var parentVC: ChatOrderViewController?
    var financialSupportObject: TFinancialSupportObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.getDataFromServer()
        self.setupView()
    }
    func setupView(){
        self.btnAccept.isHidden = self.object?.b_answered?.boolValue == true
        self.btnReject.isHidden = self.object?.b_answered?.boolValue == true
        self.img.sd_setImage_(urlString: self.financialSupportObject?.s_face_photo ?? "")
        self.lblDetails.text = "\("ChatOrderAddInvoiceVC_lblInvoiceTotalPrice_text".localize_) : \(self.financialSupportObject?.d_amount?.formatedNumber ?? "0") \("SAR".localize_)\n\("ChatOrderAddInvoiceVC_lblFullName_text".localize_) : \(self.financialSupportObject?.s_mobile ?? "0")\n\("ChatOrderAddInvoiceVC_lblIdentificationNumber_text".localize_) : \(self.financialSupportObject?.s_idno ?? "0")"
    }
    func getDataFromServer(){
        let request = ChatOrderRequest(.driverFinancialSupportDetails(order_id: self.order_id))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
            self.financialSupportObject = responce.financialSupportObject
            self.setupView()
        }
    }

    @IBAction func btnShowImage(_ sender: Any) {
        self.openPhotoBrowser()
    }
    @IBAction func btnAccept(_ sender: Any) {
        let vc = OrderCreatePaymentSelectionViewController.initiateInstance(storyboard: .orders) as! OrderCreatePaymentSelectionViewController
        vc.b_payOnly = true
        vc.b_onlineOnly = true
        vc.paymentOperation = .support
        vc.tempOrder_id = self.order_id
        vc.tempOrder_no = self.order_no
        vc.amount = NSNumber(value: self.object?.s_total_price?.toFloat() ?? 0.0) 
        vc.completionBlock = { selectedPayment in
            vc.dismiss(animated: true) {
                self.sendActionToServer(accept: NSNumber(value: true))
            }
        }
        MIBlurPopup.show(vc, on: self)
    }
    @IBAction func btnReject(_ sender: Any) {
        self.sendActionToServer(accept: NSNumber(value: false))
    }
    func sendActionToServer(accept:NSNumber){
        let request = ChatOrderRequest(.driverAcceptFinancialSupport(order_id: self.order_id, status: accept))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
            self.dismiss(animated: true) {
                self.parentVC?.getDataFromServer()
            }
        }
    }
}
extension ChatOrderFinancialSupportDetailsViewController:MIBlurPopupDelegate{
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
extension ChatOrderFinancialSupportDetailsViewController :MWPhotoBrowserDelegate{
    func openPhotoBrowser() {
        let browser = MWPhotoBrowser(delegate: self)
        browser?.displayActionButton = false
        browser?.displayNavArrows = false
        browser?.displaySelectionButtons = false
        browser?.zoomPhotosToFill = true
        browser?.alwaysShowControls = false
        browser?.enableGrid = true
        browser?.startOnGrid = false
        self.present(UINavigationController(rootViewController: browser!), animated: true, completion: nil)
    }
    func numberOfPhotos(in photoBrowser: MWPhotoBrowser!) -> UInt {
        return 1
    }
    func photoBrowser(_ photoBrowser: MWPhotoBrowser!, photoAt index: UInt) -> MWPhotoProtocol! {
        return MWPhoto(url: URL(string: self.financialSupportObject?.s_face_photo ?? ""))
    }
}
