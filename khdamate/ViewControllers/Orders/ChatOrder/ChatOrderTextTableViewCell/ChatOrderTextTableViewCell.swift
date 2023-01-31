/************************* Mo’min J.Abusaada *************************/
//
//  ChatOrderTextTableViewCell.swift
//  Done
//
//  Created by Mo'min J.Abusaada on 07/03/2021.
//

import UIKit
import MIBlurPopup
import EventKit

class ChatOrderTextTableViewCell: GeneralTableViewCell {

    @IBOutlet weak var stackViewContaner: UIStackView!
    @IBOutlet weak var viewContaner: customMaskUIView!
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var lblTotalPrice: UILabel!
    @IBOutlet weak var lblTitlePrice: UILabel!
    @IBOutlet weak var imgActions: UIImageView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblFinalPrice: UILabel!
    @IBOutlet weak var txtCoupon: UITextField!
    
    @IBOutlet weak var LayoutConstraintRight: NSLayoutConstraint!
    @IBOutlet weak var LayoutConstraintLeft: NSLayoutConstraint!
    
    @IBOutlet weak var stackViewActions: UIStackView!
    @IBOutlet weak var stackPayment: UIStackView!
    @IBOutlet weak var stackPayService: UIStackView!
    @IBOutlet weak var stackConfirmOrder: UIStackView!
    @IBOutlet weak var stackCoupon: UIStackView!
    @IBOutlet weak var stackFinalPrice: UIStackView!
    @IBOutlet weak var stackRate: UIStackView!
    
    @IBOutlet weak var btnAccept: UIButton!
    @IBOutlet weak var btnReject: UIButton!
    @IBOutlet weak var btnRate: UIButton!
    
    var obj: TChatObject?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       // self.stackCoupon.isHidden = true
        self.imgActions.isHidden = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func configerCell() {
        let obj = self.object.object as! TChatObject
        self.obj = obj
        print("e_category2:\(obj.e_category)")

        if obj.e_category == .send_working_time {
            self.lblText.text = "\(obj.value ?? "") at \(obj.working_date ?? "") \(obj.working_time ?? "")"

        } else if obj.e_category == .answer_working_time {
            self.lblText.text = "\(obj.value ?? "") at \(obj.working_date ?? "") \(obj.working_time ?? "")"
            
            
        } else{
            self.lblText.text = obj.value

        }
        self.lblFinalPrice.text = (obj.final_price ?? "") + " " + "Riyal".localize_
        self.lblTotalPrice.text = ((self.parentVC as? ChatOrderViewController)?.chatOrderObject?.total_price ?? "") + " " + "Riyal".localize_
        if let coupon = obj.coupon_code {
            txtCoupon.text = coupon
        }
        if obj.my_messsage?.boolValue == true {
            self.viewContaner.roundCorners(roundshapeType: .allCournerWithoutTopRightCorner, radius: 10)
            self.lblText.textAlignment = .right
            if UserProfile.sharedInstance.isRTL() {
                self.stackViewContaner.alignment = .leading
            } else {
                self.stackViewContaner.alignment = .trailing
            }
            self.viewContaner.backgroundColor = UIColor(named: "#0096B4")
            self.lblText.textColor = .white
            
            self.LayoutConstraintRight.priority = UILayoutPriority(rawValue: 1000)
            self.LayoutConstraintLeft.priority = UILayoutPriority(rawValue: 250)
        } else {
            self.viewContaner.roundCorners(roundshapeType: .allCournerWithoutTopLeftCorner, radius: 10)
            self.lblText.textAlignment = .left
            if UserProfile.sharedInstance.isRTL() {
                self.stackViewContaner.alignment = .trailing
            } else {
                self.stackViewContaner.alignment = .leading
            }
            self.viewContaner.backgroundColor = .white
            self.lblText.textColor = UIColor(named: "#0096B4")
            self.LayoutConstraintRight.priority = UILayoutPriority(rawValue: 250)
            self.LayoutConstraintLeft.priority = UILayoutPriority(rawValue: 1000)
        }
//Actions
        if UserProfile.sharedInstance.currentUser?.b_provider == true {
            self.stackViewActions.isHidden = true
            self.stackPayment.isHidden = true
            self.stackFinalPrice.isHidden = true
            self.stackConfirmOrder.isHidden = true
            self.stackRate.isHidden = true
        } else {
            if obj.e_category == .answer_working_time && obj.is_accepted == 1 {
                self.btnAccept.setTitle("Add to my calendar".localize_, for: .normal)
                self.btnAccept.isHidden = false
                self.stackViewActions.isHidden = false
                self.btnReject.isHidden = true


            } else if obj.e_category == .send_working_time && obj.s_answered == 0 {
                self.btnAccept.setTitle("Accepted".localize_, for: .normal)
                self.btnAccept.isHidden = false
                self.btnReject.isHidden = false
                self.stackFinalPrice.isHidden = false
                self.stackPayment.isHidden = true
                self.imgActions.isHidden = false
                self.stackConfirmOrder.isHidden = true
                self.stackRate.isHidden = true
                self.stackViewActions.isHidden = false
                self.stackFinalPrice.isHidden = true
                self.lblTitlePrice.text = "Time: ".localize_
                self.lblFinalPrice.text = "\(obj.working_date ?? "") \(obj.working_time ?? "")"
            }else   if obj.e_category == .send_final_price {
                self.btnAccept.setTitle("OrderOffersCell_btnAccept_text".localize_, for: .normal)
                self.btnAccept.isHidden = false
                self.btnReject.isHidden = false
                self.stackFinalPrice.isHidden = false
                self.stackPayment.isHidden = true
                self.imgActions.isHidden = false
                self.stackConfirmOrder.isHidden = true
                self.stackRate.isHidden = true
                self.stackViewActions.isHidden = (obj.b_answered?.boolValue ?? false)
                self.stackFinalPrice.isHidden = (obj.b_answered?.boolValue ?? false)
                self.lblTitlePrice.text = "Total Price".localize_

            } else if obj.e_category == .order_finished {
                self.btnAccept.isHidden = true
                self.btnReject.isHidden = true
                self.stackFinalPrice.isHidden = true
                self.stackPayment.isHidden = true
                self.imgActions.isHidden = true
                self.stackConfirmOrder.isHidden = false
                self.stackRate.isHidden = true
                if (self.parentVC as? ChatOrderViewController)?.chatOrderObject?.e_status != .finished {
                    self.stackConfirmOrder.isHidden = true
                }
            } else if obj.e_category == .asked_to_pay {
                self.btnAccept.isHidden = true
                self.btnReject.isHidden = true
                self.stackFinalPrice.isHidden = true
                self.stackPayment.isHidden = false
                self.imgActions.isHidden = true
                self.stackConfirmOrder.isHidden = true
                self.stackRate.isHidden = true
                self.stackPayment.isHidden = false
                if (self.parentVC as? ChatOrderViewController)?.chatOrderObject?.e_status != .asked_to_pay {
                    self.stackPayment.isHidden = true
                }
            } else if obj.e_category == .rate_request {
                self.btnAccept.isHidden = true
                self.btnReject.isHidden = true
                self.stackFinalPrice.isHidden = true
                self.stackPayment.isHidden = true
                self.imgActions.isHidden = true
                self.stackConfirmOrder.isHidden = true
                self.stackRate.isHidden = false
                if (self.parentVC as? ChatOrderViewController)?.chatOrderObject?.order_rate?.intValue ?? -1 >= 1 {
                    self.btnRate.isHidden = true
                }
                
            }else {
                self.stackViewActions.isHidden = true
                self.stackPayment.isHidden = true
                self.stackFinalPrice.isHidden = true
                self.imgActions.isHidden = true
                self.stackConfirmOrder.isHidden = true
                self.stackRate.isHidden = true
            }
        }
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
    
    @IBAction func btnAccept(_ sender: Any) {
        if let paretVC = (self.parentVC as? ChatOrderViewController) {
            if let obj = self.object.object as? TChatObject{
                if obj.e_category == .answer_working_time && obj.is_accepted == 1 {
                    let eventStore : EKEventStore = EKEventStore()
                          
                    // 'EKEntityTypeReminder' or 'EKEntityTypeEvent'

                    eventStore.requestAccess(to: .event) { (granted, error) in
                      
                      if (granted) && (error == nil) {
                          print("granted \(granted)")
                          print("error \(error)")
                          
                          let event:EKEvent = EKEvent(eventStore: eventStore)
                          let dateFormatter = DateFormatter()
                          dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
                          dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
                          let date = dateFormatter.date(from:"\(obj.working_date ?? "") \(obj.working_time ?? "")")

                          event.title = "ProServer Order"
                          event.startDate = date
                          event.endDate = date?.addingTimeInterval(3600 as TimeInterval)
                          event.notes = obj.value
                          event.calendar = eventStore.defaultCalendarForNewEvents
                          var errorDone = true
                          do {
                              try eventStore.save(event, span: .thisEvent)
                          } catch let error as NSError {
                              errorDone = false
                              print("failed to save event with error : \(error)")
                              self.showPopAlert(title: "Error".localize_, message: ("failed to save event with error : \(error)").localize_)

                          }
                          if errorDone {
                              self.showPopAlert(title: "DoneSuccessfully".localize_, message: ("Saved Event").localize_)
                          }
                          print("Saved Event")
                      }
                      else{
                          self.showPopAlert(title: "Error".localize_, message: ("failed to save event with error : \(error?.localizedDescription ?? "") or access not granted").localize_)

                          print("failed to save event with error : \(error?.localizedDescription ?? "") or access not granted")
                      }
                    }

                }
               else if obj.e_category == .send_final_price {
                    let request = OrderRequest(.answerFinalPrice(order_id: (self.parentVC as? ChatOrderViewController)?.order_id?.intValue, is_accepted: 1))
                    RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
                        paretVC.getDataFromServer()
                    }
                    
                }else{
                    let request = OrderRequest(.answerWorkTime(order_id: (self.parentVC as? ChatOrderViewController)?.order_id?.intValue, is_accepted: 1))
                    RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
                        paretVC.getDataFromServer()
                    }
                    
                }
            }
        }
    }
    func showPopAlert(title:String,message msg:String,okAction:(() -> Void)? = nil)  {
        DispatchQueue.main.async {
            
            let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
            let defaultAction = UIAlertAction(title:"OK".localize_, style: .default, handler: { (pAlert) in
                //Do whatever you wants here
                okAction?()
            })
            alertController.addAction(defaultAction)
            self.parentVC.present(alertController, animated: true, completion: nil)
        }
    }
    @IBAction func btnReject(_ sender: Any) {
        if let obj = self.object.object as? TChatObject{
            let alertController = UIAlertController(title: "Attention", message:"DoYouWantToRejetThisOffer".localize_, preferredStyle:.alert)
            alertController.addAction(UIAlertAction(title: "OK".localize_, style:.default, handler: { (action) in
                if obj.e_category == .send_final_price {
                    
                    let request = OrderRequest(.answerFinalPrice(order_id: (self.parentVC as? ChatOrderViewController)?.order_id?.intValue, is_accepted: 0))
                    RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
                        (self.parentVC as? ChatOrderViewController)?.getDataFromServer()
                    }
                }else{
                    let request = OrderRequest(.answerWorkTime(order_id: (self.parentVC as? ChatOrderViewController)?.order_id?.intValue, is_accepted: 0))
                    RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
                        (self.parentVC as? ChatOrderViewController)?.getDataFromServer()
                        
                    }
                    
                }
            }))
            alertController.addAction(UIAlertAction(title: "Cancel", style:.cancel, handler: { (action) in
                
            }))
            self.parentVC?.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnPayNow(_ sender: Any) {
        if let paretVC = (self.parentVC as? ChatOrderViewController) {
        let request = OrderRequest(.getPaymentUrl(order_id: (self.parentVC as? ChatOrderViewController)?.order_id))
            RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
                InitiateInstanceWithPush(vcClass: WebViewViewController(), storyboard: .home) { (vc) in
                    vc.type = .payment
                    vc.url = responce.paymentURL?.url ?? ""
                    vc.didFinishPayment = {
                        
                        let request = OrderRequest(.checkPayment(order_id: (self.parentVC as? ChatOrderViewController)?.order_id))
                        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) { [weak self] in
                                guard let self = self else { return }
                                self.parentVC.showPopAlert(title: "Success".localize_, message: responce.status?.message ?? "")
                            }
                            
                            (self.parentVC as? ChatOrderViewController)?.getDataFromServer()
                        }
                    }
                    
                    
                    //                if let url = URL(string: responce.paymentURL?.url ?? "") {
                    //                    UIApplication.shared.open(url)
                    //            }
                    
                    
                    //        let request = OrderRequest(.payOrder(order_id: (self.parentVC as? ChatOrderViewController)?.order_id))
                    //            RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
                    //                paretVC.getDataFromServer()
                    //                paretVC.showPopAlert(title: "Success".localize_, message: "ChatOrderVC_PaySuccess_text".localize_) {
                    //                }
                }
            }
        }
    }
    @IBAction func btnConfirmOrder(_ sender: Any) {
        if let paretVC = (self.parentVC as? ChatOrderViewController) {
        let request = OrderRequest(.confirmFinishOrder(order_id: (self.parentVC as? ChatOrderViewController)?.order_id))
            RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
                paretVC.getDataFromServer()
            }
        }
    }
    
    @IBAction func btnRate(_ sender: Any) {
        if let paretVC = (self.parentVC as? ChatOrderViewController) {
            paretVC.performSegueWithCheck(withIdentifier: "toRateViewController", sender: self)
        }
    }
    @IBAction func btnCooupon(_ sender: Any) {
        if !self.validationCoupon() {
            return
        }
        if let paretVC = (self.parentVC as? ChatOrderViewController) {
            let request = OrderRequest(.addCoupon(order_id: (self.parentVC as? ChatOrderViewController)?.order_id, coupon_code: txtCoupon.text ?? ""))
            RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
                paretVC.showPopAlert(title: "Success".localize_, message: "CouponAddedSuccess".localize_, okAction: nil)
                paretVC.getDataFromServer()
            }
        }

    }
    
    func validationCoupon() -> Bool {
            if !self.txtCoupon.isValidateValue() {
                 self.parentVC.ShowErrorMessage(message: "CouponMissing".localize_)
                return false
            }
        return true
    }

}
