//
//  ChatOrderViewController.swift
//  Done
//
//  Created by Mo'min J.Abusaada on 23/02/2021.
//

import FTPopOverMenu_Swift
import IQKeyboardManagerSwift
import iRecordView
import Recorder
import UIKit
import AlertsPickers
import DKCamera
import QBImagePickerController
import MobileCoreServices
import UniformTypeIdentifiers
import MWPhotoBrowser

class ChatOrderViewController: UIViewController {
    @IBOutlet var tableView: GeneralTableView! {
        didSet {
            self.tableView.selectionType = .single
            self.tableView.registerNib(NibName: "ChatOrderInfoTableViewCell")
            self.tableView.registerNib(NibName: "ChatOrderTextTableViewCell")
            self.tableView.registerNib(NibName: "ChatOrderVoiceTableViewCell")
            self.tableView.registerNib(NibName: "ChatOrderInvoiceTableViewCell")
            self.tableView.registerNib(NibName: "ChatOrderRateTableViewCell")
            self.tableView.registerNib(NibName: "ChatImageTableViewCell")
            self.tableView.registerNib(NibName: "ChatOrderAttachmentTableViewCell")
        }
    }
    
    @IBOutlet var lblOrderNO: UILabel!
    @IBOutlet var lblOrderDistance: UILabel!
    @IBOutlet var viewTextContaner: customMaskUIView!
    @IBOutlet var txtMessage: UITextField!
    @IBOutlet var btnSend: UIButton!
    @IBOutlet var btnRecord: RecordButton!
    @IBOutlet var viewRecord: RecordView!
    @IBOutlet weak var stackSendMessage: UIStackView!
    @IBOutlet weak var viewBGTextContainer: UIView!
    
    lazy var imagePickerController: QBImagePickerController = { [weak self] in
        let temp = QBImagePickerController()
        temp.delegate = self
        temp.allowsMultipleSelection = true
        temp.minimumNumberOfSelection = 1
        temp.maximumNumberOfSelection = 10
        temp.mediaType = .image
        temp.showsNumberOfSelectedAssets = true
        return temp
    }()
    var selectedDate:NSDate!{
        didSet{
        }
    }

    var chatOrderObject: TChatOrderObject?
    var orderObject: TOrderObject?
    var itemObject: TItemObject?
    var offerObject: TOfferObject?
    var order_id: NSNumber?
    var order_no: NSNumber?
    var recording: Recording!
    var refreshParentList: (()->())?
    var docData: Data?
    var duration: CGFloat = 0
    var tempVoiceCell: ChatOrderVoiceTableViewCell?
    var photos = [MWPhoto]()
    var parentVC: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.setupView()
        
        if self.view.frame.size.height >= 800 {
            self.navBGHeight = 90
        } else if self.view.frame.size.height < 800 {
            self.navBGHeight = 86
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getDataFromServer()
        AppDelegate.sharedInstance.orderChatVC = self
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.recording.stop()
        self.recording.player.stop()
        AppDelegate.sharedInstance.orderChatVC = nil
        
        if let parent = self.parentVC as? OrdersListViewController {
            DispatchQueue.main.async {
                parent.getDataFromServer()
            }
        }
    }
    
    func setupView() {
        IQKeyboardManager.shared.disabledToolbarClasses.append(ChatOrderViewController.self)
        
        self.lblOrderNO.text = "\("OrderID".localize_) #\(self.chatOrderObject?.order_no ?? 0)"
        self.lblOrderDistance.text = self.chatOrderObject?.s_total_distance
        
        self.viewTextContaner.roundCorners(roundshapeType: .topCorner, radius: 20)
        
        self.fillData()
        
        self.checkBtnSendVisible()
        
        self.btnRecord.recordView = self.viewRecord
        self.viewRecord.delegate = self
        self.viewRecord.slideToCancelText = "OrderCreateVC_lblSlideToCancel_text".localize_
        self.btnRecord.setImage(UIImage(named: "ic_chat_recording"), for: .normal)
        
        self.recording = Recording(to: "recording.m4a")
        self.recording.delegate = self
        DispatchQueue.global(qos: .background).async {
            self.recording.prepare()
            self.recording.record()
            self.recording.stop()
        }
        
        FTConfiguration.shared.backgoundTintColor = .white
        FTConfiguration.shared.menuSeparatorColor = .clear
        FTConfiguration.shared.borderColor = UIColor(named: "#D8D8D8") ?? UIColor.hexColor(hex: "#D8D8D8")
        FTConfiguration.shared.cornerRadius = 10
        FTConfiguration.shared.menuWidth = 220
        
        self.tableView.spr_setIndicatorHeader {
            self.getDataFromServer()
        }
        
        self.viewTextContaner.isHidden = self.chatOrderObject?.chat_closed?.boolValue == true
        self.viewBGTextContainer.isHidden = self.chatOrderObject?.chat_closed?.boolValue == true
    }
    
    func getDataFromServer(showLodaer: Bool = true) {
        let request = ChatOrderRequest(.orderSummary(order_id: self.order_id, without_chat: NSNumber(value: false)))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: showLodaer, showMsg: true) { responce in
            self.tableView.spr_endRefreshing()
            self.chatOrderObject = responce.ordersObject
            self.setupView()
        }
    }
    
    func checkBtnSendVisible() {
        self.btnSend.isHidden = self.txtMessage.text?.isEmptyOrWhiteSpace() == true
        self.btnRecord.isHidden = !self.btnSend.isHidden
        self.viewRecord.isHidden = true
    }
    
    func fillData() {
        self.tableView.clearData(true)
        if self.chatOrderObject != nil {
            self.tableView.objects.append(GeneralTableViewData(reuseIdentifier: "ChatOrderInfoTableViewCell", object: true, rowHeight: nil))
            self.tableView.objects.append(GeneralTableViewData(reuseIdentifier: "ChatOrderInfoTableViewCell", object: false, rowHeight: nil))
        }
        
        for (index,obj) in (self.chatOrderObject?.chat ?? []).enumerated() {
            obj.pk_i_id = "\(index)"
            self.appedChatObjects(obj: obj)
        }
        
        self.checkOrderIsRated()
        self.scrollToEnd()
    }
    
    func checkOrderIsRated() {
        if (self.chatOrderObject?.order_rate?.intValue ?? -1) >= 1 {
            let obj = TChatObject(fromDictionary: [:])
            obj.s_answered = nil
            obj.my_messsage = NSNumber(value: true)
            obj.created_at = NSDate()
            obj.pk_i_id = nil
            obj.category = ChatCategory.regular.rawValue
            obj.s_photo = nil
            obj.s_text = nil
            obj.s_total_price = nil
            obj.types = ChatType.text.rawValue
            obj.value = "ChatOrderIssueVC_ThisOrderIsRated_text".localize_
            
            self.appedChatObjects(obj: obj)
        }
    }
    
    func appedChatObjects(obj: TChatObject) {
        if obj.e_category == .regular || obj.e_category == .send_final_price || obj.e_category == .order_finished || obj.e_category == .asked_to_pay || obj.e_category == .order_finished || obj.e_category == .rate || obj.e_category == .rate_request || obj.e_category == .send_working_time  || obj.e_category == .answer_working_time{
            self.tableView.objects.append(GeneralTableViewData(reuseIdentifier: obj.e_type.s_cell_id, object: obj, rowHeight: nil))
        } else if obj.e_category == .invoice || obj.e_category == .support {
            self.tableView.objects.append(GeneralTableViewData(reuseIdentifier: "ChatOrderInvoiceTableViewCell", object: obj, rowHeight: nil))
        }
//        else if  {
//            self.tableView.objects.append(GeneralTableViewData(reuseIdentifier: "ChatOrderRateTableViewCell", object: obj, rowHeight: nil))
//        }
    }
    
    func scrollToEnd() {
        self.tableView.reloadData()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if self.tableView.objects.count != 0 {
                self.tableView.scrollToRow(at: IndexPath(row: self.tableView.objects.count - 1, section: 0), at: .bottom, animated: true)
            }
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toOrderCancelReasonsVC" {
            let vc = segue.destination as? OrderCancelReasonsViewController
            vc?.order_id = self.order_id
            vc?.order_no = self.order_no
        }else if segue.identifier == "toChatOrderAddInvoiceVC" {
            let vc = segue.destination as? ChatOrderAddInvoiceViewController
            vc?.order_id = self.order_id
            vc?.order_no = self.order_no
            vc?.parentVC = self
            vc?.vcType = sender as! ChatOrderAddInvoiceType
        }else if segue.identifier == "toChatOrderFinancialSupportDetailsVC" {
            let vc = segue.destination as? ChatOrderFinancialSupportDetailsViewController
            vc?.order_id = self.order_id
            vc?.order_no = self.order_no
            vc?.parentVC = self
            vc?.object = sender as? TChatObject
        }else if segue.identifier == "toChatOrderIssueVC" {
            let vc = segue.destination as? ChatOrderIssueViewController
            vc?.order_id = self.order_id
            vc?.order_no = self.order_no
            vc?.parentVC = self
        } else if segue.identifier == "toRateViewController" {
            let vc = segue.destination as? RateViewController
            vc?.order_id = self.order_id
            vc?.order_no = self.order_no
            vc?.parentVC = self
        }
    }
    
    @IBAction func txtMessageChanged(_ sender: Any) {
        self.checkBtnSendVisible()
    }
    @IBAction func btnAttach(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "Do you want to take a photo or a selection from the Gallery!".localize_, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Capture image".localize_, style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            let camera : DKCamera = { [unowned self] in
                let temp = DKCamera()
                temp.showsCameraControls = true
                temp.defaultCaptureDevice = .rear
                temp.didCancel = { [weak self] () in
                    self?.dismiss(animated: true, completion: nil)
                }
                temp.didFinishCapturingImage = { [weak self] (image , data) in
                    self?.dismiss(animated: true, completion: nil)
                    let attachment = imagesWithURL()
                    attachment.url = attachment.id.string
                    attachment.isLoacal = true
                    attachment.image = image
                    self?.addImage(object: attachment)
                }
                return temp
            }()
            self.present(camera, animated: true, completion: nil)
        })
        let galleryAction = UIAlertAction(title: "Chose From Gallery".localize_, style: .default, handler: { [weak self]
            (alert: UIAlertAction!) -> Void in
            guard let self = self else { return }
            if #available(iOS 13.0, *) {
                self.imagePickerController.overrideUserInterfaceStyle = .light
            } else {
            }
            self.present(self.imagePickerController, animated: true, completion: nil)
        })
        let filesAction = UIAlertAction(title: "Choose Document".localize_, style: .default, handler: { [weak self]
            (alert: UIAlertAction!) -> Void in
            guard let self = self else { return }
            let types = [kUTTypePDF, kUTTypeText, kUTTypeRTF, kUTTypeSpreadsheet]
                let importMenu = UIDocumentPickerViewController(documentTypes: types as [String], in: .import)

                if #available(iOS 11.0, *) {
                    importMenu.allowsMultipleSelection = true
                }

                importMenu.delegate = self
                importMenu.modalPresentationStyle = .formSheet

            self.present(importMenu, animated: true)
            
        })
        let cancelAction = UIAlertAction(title: "Cancel".localize_, style: .cancel, handler: { [weak self]
            (alert: UIAlertAction!) -> Void in
        })
        
        optionMenu.addAction(cameraAction)
        optionMenu.addAction(galleryAction)
        optionMenu.addAction(filesAction)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    // MARK: - Actions
    
    @IBAction func btnActionMore(_ sender: UIButton) {
        var titles = [String]()
        var images = [String]()
        let orderActions = self.chatOrderObject?.actions
        
        titles.append("OrderCreateVC_menuActions_orderDetails".localize_)
        images.append("ic_chat_order_details")
        
        if UserProfile.sharedInstance.currentUser?.b_provider == true {
//Provider
            if chatOrderObject?.e_status != .completed && chatOrderObject?.e_status.isRejected != true && self.chatOrderObject?.chat_closed?.boolValue != true {
                
                
                if chatOrderObject?.order_status == "accepted" {
                    titles.append("OrderCreateVC_menuActions_SendFinalPrice".localize_)
                    images.append("ic_chat_request_payment")
                }
                if chatOrderObject?.order_status == "final_price_accepted" {
                    titles.append("OrderCreateVC_menuActions_AskToPay".localize_)
                    images.append("ic_chat_request_payment")
                }
                if chatOrderObject?.service_type == "direct" {
                    
                    if chatOrderObject?.order_status == "payed" {
                        titles.append("Implementation Date".localize_)
                        images.append("ic_calender")
                    }
                    if chatOrderObject?.order_status == "working_time_accepted" {
                        titles.append("OrderCreateVC_menuActions_ProcessOrder".localize_)
                        images.append("ic_start_order")
                    }
                    if chatOrderObject?.order_status == "inprocess" {
                        titles.append("OrderCreateVC_menuActions_CompleteOrder".localize_)
                        images.append("ic_chat_order_done")
                    }

                    
                }else{
                    if chatOrderObject?.order_status == "payed" {
                        titles.append("OrderCreateVC_menuActions_ProcessOrder".localize_)
                        images.append("ic_start_order")
                    }
                    if chatOrderObject?.order_status == "inprocess" {
                        titles.append("OrderCreateVC_menuActions_CompleteOrder".localize_)
                        images.append("ic_chat_order_done")
                    }
                }
              
            }
        } else {
//Customer
            if chatOrderObject?.e_status == .confirmed && chatOrderObject?.e_status.isRejected != true {
                titles.append("OrderCreateVC_menuActions_rating".localize_)
                images.append("ic_chat_star_full")
            }
            if chatOrderObject?.e_status.isRejected == true {
                titles.append("OrderCreateVC_menuActions_reorder".localize_)
                images.append("ic_reorder")
            }
        }
//Both Provider & Customer
        if chatOrderObject?.e_status != .inprocess && chatOrderObject?.e_status != .confirmed && chatOrderObject?.e_status.isRejected != true {
            titles.append("OrderCreateVC_menuActions_cancelOrder".localize_)
            images.append("ic_chat_cancel")
        }
        if chatOrderObject?.e_status == .inprocess && chatOrderObject?.e_status.isRejected != true {
            titles.append("OrderCreateVC_menuActions_report_order".localize_)
            images.append("ic_chat_sendComplaint")
        }
        if chatOrderObject?.e_status == .confirmed && chatOrderObject?.e_status.isRejected != true {
            titles.append("OrderCreateVC_menuActions_report_order".localize_)
            images.append("ic_chat_sendComplaint")
        }
        let config = FTCellConfiguration()
        config.textColor = .black
        config.textAlignment = .natural
        config.textFont = UIFont.systemFont(ofSize: 8)
        
        var configArr = [FTCellConfiguration]()
        for _ in 0 ..< titles.count {
            configArr.append(config)
        }
        
        FTPopOverMenu.showForSender(sender: sender,
                                    with: titles,
                                    menuImageArray: images,
                                    cellConfigurationArray: configArr,
                                    done: { (selectedIndex) -> Void in
            if titles[selectedIndex] == "OrderCreateVC_menuActions_orderDetails".localize_ {
                self.viewOrderDetails()
            } else if titles[selectedIndex] == "OrderCreateVC_menuActions_viewOffer".localize_ {
                self.viewOfferDetails()
            } else if titles[selectedIndex] == "OrderCreateVC_menuActions_cancelOrder".localize_ {
                self.cancelOrder()
            } else if titles[selectedIndex] == "OrderCreateVC_menuActions_arrived_to_service_provider".localize_ {
                self.arrivedToServiceProvider()
            } else if titles[selectedIndex] == "OrderCreateVC_menuActions_add_bill".localize_ {
                self.addBill()
            } else if titles[selectedIndex] == "OrderCreateVC_menuActions_request_payment".localize_ {
                self.requestPayment()
            } else if titles[selectedIndex] == "OrderCreateVC_menuActions_change_delivery_price".localize_ {
                self.changeDeliveryPrice()
            } else if titles[selectedIndex] == "OrderCreateVC_menuActions_on_my_way".localize_ {
                self.onMyWay()
            } else if titles[selectedIndex] == "OrderCreateVC_menuActions_arrived".localize_ {
                self.arrived()
            } else if titles[selectedIndex] == "OrderCreateVC_menuActions_complete_order".localize_ {
                self.completeOrder()
            } else if titles[selectedIndex] == "OrderCreateVC_menuActions_report_order".localize_ {
                self.sendComplain()
            } else if titles[selectedIndex] == "OrderCreateVC_menuActions_purchase_done".localize_ {
                self.purchaseDone()
            } else if titles[selectedIndex] == "OrderCreateVC_menuActions_purchase_done_parcels".localize_ {
                self.purchaseDone()
            } else if titles[selectedIndex] == "OrderCreateVC_menuActions_ProcessOrder".localize_ {
                self.processOrder()
            }else if titles[selectedIndex] == "Implementation Date".localize_ {
                   self.ImplementationDate()
            } else if titles[selectedIndex] == "OrderCreateVC_menuActions_SendFinalPrice".localize_ {
                self.changeDeliveryPrice()
            } else if titles[selectedIndex] == "OrderCreateVC_menuActions_CompleteOrder".localize_ {
                self.finishOrder()
            } else if titles[selectedIndex] == "OrderCreateVC_menuActions_reorder".localize_ {
                self.reOrder()
            }else if titles[selectedIndex] == "OrderCreateVC_menuActions_rating".localize_ {
                self.sendRating()
            }else if titles[selectedIndex] == "OrderCreateVC_menuActions_AskToPay".localize_ {
                self.askToPay()
            }
        }) {
        }
    }
    
    @IBAction func btnSend(_ sender: Any) {
        let request = ChatOrderRequest(.sendMessage(order_id: self.order_id, type: .text, media: nil, text: self.txtMessage.text))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { _ in
            let obj = TChatObject(fromDictionary: [:])
            obj.s_answered = nil
            obj.my_messsage = NSNumber(value: true)
            obj.created_at = NSDate()
            obj.pk_i_id = nil
            obj.category = ChatCategory.regular.rawValue
            obj.s_photo = nil
            obj.s_text = nil
            obj.s_total_price = nil
            obj.types = ChatType.text.rawValue
            obj.value = self.txtMessage.text
            
            self.appedChatObjects(obj: obj)
            self.scrollToEnd()
            
            self.txtMessage.text = ""
            self.txtMessage.endEditing(true)
            self.checkBtnSendVisible()
        }
    }
}

// Order Actions
extension ChatOrderViewController {
    func viewOrderDetails() {
        InitiateInstanceWithPush(vcClass: OrderDetailsViewController(), storyboard: .orders) { vc in
            vc.orderObject = self.orderObject
            vc.order_id = self.chatOrderObject?.pk_i_id
            vc.order_no = self.chatOrderObject?.order_no?.stringValue
            vc.parentVC = self
            vc.routeType = .orderDetails
        }
    }
    
    func viewOfferDetails() {
        InitiateInstanceWithPush(vcClass: OfferDetailsViewController(), storyboard: .chatOrder) { vc in
            vc.chatOrderObject = self.chatOrderObject
        }
    }
    
    func cancelOrder() {
        performSegueWithCheck(withIdentifier: "toOrderCancelReasonsVC", sender: self)
    }
    
    func sendComplain() {
        self.performSegueWithCheck(withIdentifier: "toChatOrderIssueVC", sender: self)
    }
    
    func sendRating() {
        self.performSegueWithCheck(withIdentifier: "toRateViewController", sender: self)
    }
    
    func askToPay() {
        let request = ServiceProviderRequest(.askToPay(order_id: self.order_id?.intValue))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (_) in
            self.getDataFromServer()
        }
    }
    
    func reOrder() {
        let request = ServiceProviderRequest(.processOrder(order_id: self.order_id?.intValue))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (_) in
            self.getDataFromServer()
        }
    }
    
    func arrivedToServiceProvider() {
        let request = ChatOrderRequest(.driverArrivedToProvider(order_id: self.order_id))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
            self.getDataFromServer()
        }
    }
    
    func addBill() {
        performSegueWithCheck(withIdentifier: "toChatOrderAddInvoiceVC", sender: ChatOrderAddInvoiceType.invoice)
    }
    
    func purchaseDone() {
        let request = ChatOrderRequest(.driverPurchaseDone(order_id: self.order_id))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
            self.getDataFromServer()
        }
    }
    
    func requestPayment() {
        performSegueWithCheck(withIdentifier: "toChatOrderAddInvoiceVC", sender: ChatOrderAddInvoiceType.requestPayment)
    }
    
    func changeDeliveryPrice() {
        let alert = UIAlertController(style: .alert, title: "OrderCreateVC_menuActions_change_Service_price".localize_)
        var txtField:UITextField?
        let config: TextField.Config = { textField in
            txtField = textField
            textField.becomeFirstResponder()
            textField.textColor = .black
            //            textField.placeholder = "Type something"
            //            textField.leftViewPadding = 12
            textField.borderWidth = 1
            textField.cornerRadius = 8
            textField.borderColor = UIColor.lightGray.withAlphaComponent(0.5)
            textField.backgroundColor = nil
            textField.keyboardAppearance = .default
            textField.keyboardType = .asciiCapableNumberPad
            textField.isSecureTextEntry = false
            textField.returnKeyType = .done
            textField.action { textField in
                // validation and so on
                for action in alert.actions {
                    if action.style == .default {
                        action.isEnabled = self.validate(textField.text ?? "", pattern: "[0-9]")
                    }
                }
            }
        }
        alert.addOneTextField(configuration: config)
        alert.addAction(title: "OK".localize_, style: .default,isEnabled: false){ (action) in
            let request = ServiceProviderRequest(.sendFinalPrice(order_id: self.order_id?.intValue, price: Int(txtField?.text ?? "")))
            RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
                self.getDataFromServer()
            }
        }
        alert.addAction(title: "Cancel".localize_, style: .cancel)
        alert.show()
    }
    func validate(_ str: String, pattern: String) -> Bool {
        if let range = str.range(of: pattern, options: .regularExpression) {
            let result = str.substring(with: range)
            print(result)
            return true
        }
        return false
    }
    
    func ImplementationDate() {
        let alert = UIAlertController(style: .actionSheet)
//        var pickerDate = self.selectedDate ?? NSDate()
        var pickerDate = self.selectedDate ?? NSDate()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from:self.chatOrderObject?.order_date ?? "")
        alert.addDatePicker(mode: .dateAndTime, date: date as Date? ?? Date() , minimumDate: date as Date?, local: NSLocale(localeIdentifier: "en-us"), calender: NSCalendar(identifier: NSCalendar.Identifier.gregorian)) { (date) in
            pickerDate = date as NSDate

            self.selectedDate =  pickerDate
        }
        alert.addAction(title: "OK".localize_, style: .default,handler: { _ in
            let day =  self.selectedDate?.dateString(customFormat: "yyyy-MM-dd",timeZone: TimeZone.current)
           let time =  self.selectedDate?.dateString(customFormat: "hh:mm",timeZone: TimeZone.current)
            print("\(day) \(time) ")
            let request = ServiceProviderRequest(.sendWorkTime(order_id: self.order_id?.intValue, date: day, time: time))
            RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
                self.getDataFromServer()
            }
            
        })
        alert.addAction(title: "Cancel".localize_, style: .cancel)
        self.present(alert, animated: true, completion: nil)

    }
    func processOrder() {
        let request = ServiceProviderRequest(.processOrder(order_id: self.order_id?.intValue))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (_) in
            self.getDataFromServer()
        }
    }
    
    func finishOrder() {
        let request = ServiceProviderRequest(.finishOrder(order_id: self.order_id?.intValue))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (_) in
            self.getDataFromServer()
        }
    }
    func onMyWay() {
        let request = ChatOrderRequest(.driverOnTheWay(order_id: self.order_id))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
            self.getDataFromServer()
        }
    }
    
    func arrived() {
        let request = ChatOrderRequest(.driverArrived(order_id: self.order_id))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
            self.getDataFromServer()
        }
    }
    
    func completeOrder() {
#if DRIVER
        let request = ChatOrderRequest(.driverFinishOrder(order_id: self.order_id))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
            self.getDataFromServer()
        }
        
#else
        let request = ChatOrderRequest(.completeOrder(order_id: self.order_id))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (responce) in
            self.getDataFromServer()
        }
#endif
    }
    
    
}

extension ChatOrderViewController: RecorderDelegate {
    func audioMeterDidUpdate(dB: Float) {
        print("audioMeterDidUpdate : \(dB)")
    }
}

extension ChatOrderViewController {
    
    func getImageAdded(url: String) -> Int? {
        return nil
    }
    
    func addImage(object: imagesWithURL) {
        let data = object.image?.pngData()
        let request = ChatOrderRequest(.sendMessage(order_id: self.order_id, type: .photo, media: data, text: nil))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { _ in
            let obj = TChatObject(fromDictionary: [:])
            obj.s_answered = nil
            obj.my_messsage = NSNumber(value: true)
            obj.created_at = NSDate()
            obj.pk_i_id = nil
            obj.category = ChatCategory.regular.rawValue
            obj.s_photo = nil
            obj.s_text = nil
            obj.s_total_price = nil
            obj.types = ChatType.photo.rawValue
            obj.value = object.url
            
            self.appedChatObjects(obj: obj)
            self.scrollToEnd()
            
            self.txtMessage.endEditing(true)
            self.checkBtnSendVisible()
        }
    }
}
extension ChatOrderViewController: RecordViewDelegate {
    func onStart() {
        self.recording.player.stop()
        self.recording.record()
        self.viewRecord.isHidden = false
        self.txtMessage.isHidden = !self.viewRecord.isHidden
    }
    
    func onCancel() {
        self.recording.stop()
        //        self.stackViewPlayerContaner.isHidden = false
    }
    
    func onAnimationEnd() {
        self.recording.stop()
        self.viewRecord.isHidden = true
        self.txtMessage.isHidden = !self.viewRecord.isHidden
    }
    
    func onFinished(duration: CGFloat) {
        self.recording.stop()
        self.recording.player.stop()
        self.duration = duration
        self.viewRecord.isHidden = true
        self.txtMessage.isHidden = !self.viewRecord.isHidden
        
        let request = ChatOrderRequest(.sendMessage(order_id: self.order_id, type: .voice, media: try? Data(contentsOf: self.recording.url), text: nil))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { responce in
            let obj = TChatObject(fromDictionary: [:])
            obj.s_answered = nil
            obj.my_messsage = NSNumber(value: true)
            obj.created_at = NSDate()
            obj.pk_i_id = nil
            obj.category = ChatCategory.regular.rawValue
            obj.s_photo = nil
            obj.s_text = nil
            obj.s_total_price = nil
            obj.types = ChatType.voice.rawValue
            obj.value = responce.media_path
            
            self.appedChatObjects(obj: obj)
            self.scrollToEnd()
        }
    }
}
extension NSLayoutConstraint {
    /**
     Change multiplier constraint

     - parameter multiplier: CGFloat
     - returns: NSLayoutConstraint
    */
    func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {

        NSLayoutConstraint.deactivate([self])

        let newConstraint = NSLayoutConstraint(
            item: firstItem,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)

        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier

        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}
extension ChatOrderViewController: QBImagePickerControllerDelegate {
    func qb_imagePickerControllerDidCancel(_ imagePickerController: QBImagePickerController!) {
        imagePickerController.dismiss(animated: true, completion: nil)
        //        UINavigationBar.appearance().tintColor = UIColor.white
        //        UINavigationBar.appearance().backgroundColor = UIColor.clear
        //        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.mySystemFont(ofSize: 17.0)]
    }
    
    func qb_imagePickerController(_ imagePickerController: QBImagePickerController!, didFinishPickingAssets assets: [Any]!) {
        //        UINavigationBar.appearance().tintColor = "#FFFFFF".color_
        //        UINavigationBar.appearance().backgroundColor = UIColor.clear
        //        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.mySystemFont(ofSize: 17.0)]
        let requestOptions = PHImageRequestOptions()
        requestOptions.resizeMode = PHImageRequestOptionsResizeMode.exact
        requestOptions.deliveryMode = PHImageRequestOptionsDeliveryMode.highQualityFormat
        requestOptions.isSynchronous = true
        for asset in assets {
            let asset = asset as! PHAsset
            asset.requestContentEditingInput(with: PHContentEditingInputRequestOptions(), completionHandler: { [weak self] (contentEditingInput, dictInfo) in
                if asset.mediaType == .image {
                    if let strURL = contentEditingInput?.fullSizeImageURL?.absoluteString { //debugPrint("IMAGE URL: ", strURL)
                        PHImageManager.default().requestImage(for: asset , targetSize: PHImageManagerMaximumSize, contentMode: PHImageContentMode.default, options: requestOptions, resultHandler: { [weak self] (pickedImage, info) in
                            if asset.mediaType == .image {
                                if let strURL = contentEditingInput?.fullSizeImageURL?.absoluteString { //debugPrint("IMAGE URL: ", strURL)
                                    PHImageManager.default().requestImage(for: asset , targetSize: PHImageManagerMaximumSize, contentMode: PHImageContentMode.default, options: requestOptions, resultHandler: { [weak self] (pickedImage, info) in
                                        if self?.getImageAdded(url: strURL) == nil {
                                            let attachment = imagesWithURL()
                                            attachment.url = strURL
                                            attachment.image = pickedImage
                                            attachment.isLoacal = true
                                            self?.addImage(object: attachment)
                                        }
                                    })
                                }
                            }
                        })
                    }
                }
            })
        }
        dismiss(animated: true)
    }
}

class imagesWithURL {
    var id: Int = 8.random
    var isLoacal: Bool = true
    var isMain: Bool = false
    var image: UIImage?
    var url: String?
    var isUploaded: Bool = false
    var object: Any?
}

extension ChatOrderViewController: UIDocumentPickerDelegate {
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let myURL = urls.first else {
            return
        }
        print("import result : \(myURL)")
        do {
            self.docData = try Data(contentsOf: myURL)
//            self.imgThumbNail.image = self.pdfThumbnail(url: myURL)
//            self.viewThumbnail.isHidden = false
//            self.Doc( docData: try Data(contentsOf: myURL), parameters: ["club_file": "file" as AnyObject], fileName: myURL.lastPathComponent)
//            self.docText.text = myURL.lastPathComponent
            //uploadActionDocument(documentURLs: myURL, pdfName: myURL.lastPathComponent)
            
            let request = ChatOrderRequest(.sendMessage(order_id: self.order_id, type: .file, media: self.docData, text: nil))
            RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { responce in
                let obj = TChatObject(fromDictionary: [:])
                obj.s_answered = nil
                obj.my_messsage = NSNumber(value: true)
                obj.created_at = NSDate()
                obj.pk_i_id = nil
                obj.category = ChatCategory.regular.rawValue
                obj.s_photo = nil
                obj.s_text = nil
                obj.s_total_price = nil
                obj.types = ChatType.file.rawValue
                obj.value = responce.media_path
                
                self.appedChatObjects(obj: obj)
                self.scrollToEnd()
            }
        } catch let error {
            print(error)
            self.showErrorMessage(message: "\(error.localizedDescription)")
        }
    }

    public func documentMenu(_ documentMenu:UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }

    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("view was cancelled")
       // dismiss(animated: true, completion: nil)
    }
}
extension ChatOrderViewController: MWPhotoBrowserDelegate {
    
    func numberOfPhotos(in photoBrowser: MWPhotoBrowser!) -> UInt {
        return UInt(1)
    }
    
    func photoBrowser(_ photoBrowser: MWPhotoBrowser!, photoAt index: UInt) -> MWPhotoProtocol! {
        if index < photos.count {
            return photos[Int(index)]
        }
        return nil
    }
}
