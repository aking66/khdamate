/************************* Mo’min J.Abusaada *************************/
//
//  ChatOrderInvoiceTableViewCell.swift
//  Done
//
//  Created by Mo'min J.Abusaada on 10/03/2021.
//

import UIKit
import MWPhotoBrowser

class ChatOrderInvoiceTableViewCell : GeneralTableViewCell {

    @IBOutlet weak var viewContanet: customMaskUIView!
    @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var stackViewActions: UIStackView!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var txtCoupon: UITextField!
    @IBOutlet weak var btnAccept: UIButton!
    @IBOutlet weak var btnReject: UIButton!
    @IBOutlet weak var lblDate: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func configerCell() {
        let obj = self.object.object as! TChatObject
        self.img.sd_setImage_(urlString: obj.s_photo ?? "")
        self.lblTotal.text = obj.s_total_calcolated
        self.viewContanet.roundCorners(roundshapeType: .allCournerWithoutTopLeftCorner, radius: 8)
        if obj.e_category == .support {
            self.img.superview?.isHidden = true
            self.txtCoupon.superview?.superview?.isHidden = true
            self.lblTotal.isHidden = true
            self.lblDetails.text = obj.value
        }else {
            self.lblDetails.text = obj.s_text
            self.img.superview?.isHidden = false
            self.txtCoupon.superview?.superview?.isHidden = false
            self.lblTotal.isHidden = false
        }
        #if DRIVER
        self.stackViewActions.isHidden = true
        #else
        self.btnAccept.isHidden = false
        self.btnReject.isHidden = false
        self.btnAccept.setTitle("ChatOrderInvoiceTableViewCell_btnAccept_text".localize_, for: .normal)
        if obj.e_category == .invoice{
            self.stackViewActions.isHidden = (obj.b_answered?.boolValue ?? false)
        }else if obj.e_category == .support{
            self.stackViewActions.isHidden = false
            self.btnAccept.isHidden = false
            self.btnReject.isHidden = true
            self.btnAccept.setTitle("ChatOrderInvoiceTableViewCell_btnShowDetails_text".localize_, for: .normal)
        }else{
            self.stackViewActions.isHidden = true
        }
        #endif
        self.lblDate.text = obj.created_at?.timeAgoSinceNow()
        self.lblDate.isHidden = !self.isSubObjectSelected

    }
    override func didselect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {
        
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath, forObject object:GeneralTableViewData) -> Bool {
        return false
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath, forObject object: GeneralTableViewData) {
        
    }
    @IBAction func btnOpenImage(_ sender: Any) {
        self.openPhotoBrowser()
    }
    @IBAction func btnCheck(_ sender: Any) {
        if (self.txtCoupon.text ?? "").isEmptyOrWhiteSpace() == true {
            self.parentVC.showPopAlert(title: "Error".localize_, message: "TextFeildValidation".localized(with: "ChatOrderInvoiceTableViewCell_lblCoupon_text".localize_))
            return
        }
        let parVC = self.parentVC as! ChatOrderViewController
        let obj = self.object.object as! TChatObject
        let request = ChatOrderRequest(.checkCoupon(order_id: parVC.order_id, coupon_code: self.txtCoupon.text))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
            if responce.status?.success == true {
                obj.prev_total_price = responce.prev_total_price
                obj.coupon_discount = responce.coupon_discount
                obj.total_price = responce.total_price
            }else{
                obj.prev_total_price = nil
                obj.coupon_discount = nil
                obj.total_price = nil
            }
            self.tableView.reloadData()
        }
    }
    @IBAction func btnAccept(_ sender: Any) {
        let parVC = self.parentVC as! ChatOrderViewController
        let obj = self.object.object as! TChatObject
        if obj.e_category == .invoice{
            self.sendInvoiceRequestAction(accept: NSNumber(value: true))
        }else if obj.e_category == .support{
            self.parentVC.performSegueWithCheck(withIdentifier: "toChatOrderFinancialSupportDetailsVC", sender: obj)
        }
    }
    @IBAction func btnReject(_ sender: Any) {
        let alertController = UIAlertController(title: "Attention", message:"DoYouWantToRejetThisInvoice".localize_, preferredStyle:.alert)
        alertController.addAction(UIAlertAction(title: "OK".localize_, style:.default, handler: { (action) in
            self.sendInvoiceRequestAction(accept: NSNumber(value: false))
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style:.cancel, handler: { (action) in
            
        }))
        self.parentVC?.present(alertController, animated: true, completion: nil)
    }
    func sendInvoiceRequestAction(accept:NSNumber){
        let parVC = self.parentVC as! ChatOrderViewController
        let request = ChatOrderRequest(.acceptInvoice(order_id: parVC.order_id, is_accepted: accept, coupon_code: self.txtCoupon.text, payment_way_id: nil))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
                parVC.getDataFromServer()
        }
    }
}
extension ChatOrderInvoiceTableViewCell :MWPhotoBrowserDelegate{
    func openPhotoBrowser() {
        let browser = MWPhotoBrowser(delegate: self)
        browser?.displayActionButton = false
        browser?.displayNavArrows = false
        browser?.displaySelectionButtons = false
        browser?.zoomPhotosToFill = true
        browser?.alwaysShowControls = false
        browser?.enableGrid = true
        browser?.startOnGrid = false
        self.parentVC?.navigationController?.pushViewController(browser!, animated: true)
    }
    func numberOfPhotos(in photoBrowser: MWPhotoBrowser!) -> UInt {
        return 1
    }
    func photoBrowser(_ photoBrowser: MWPhotoBrowser!, photoAt index: UInt) -> MWPhotoProtocol! {
        let obj = self.object.object as! TChatObject
        return MWPhoto(url: URL(string: obj.s_photo ?? ""))
    }
}
