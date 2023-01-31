//
//  OrderDetailsViewController.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/11/2021.
//

import UIKit
import AlertsPickers
import DateTools
import LocationPickerViewControllerRTL
import CoreLocation
import Recorder
import AudioToolbox
import iRecordView

class OrderDetailsViewController: UIViewController {
    enum RouteType {
    case orderDetails
    case makeOrder
    case makeOffer
    }
    
    @IBOutlet weak var scrollViewContaner: UIScrollView!
    @IBOutlet weak var lblNote: UILabel!
    @IBOutlet weak var txtPrimaryType: Picker!
    @IBOutlet weak var txtSecondaryType: Picker!
    @IBOutlet weak var txtServiceType: Picker!
    @IBOutlet weak var txtServiceTitle: UITextField!
    @IBOutlet weak var txtServiceDetails: UITextView!
    @IBOutlet weak var txtAdress: UITextField!
    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var txtDatePicker: Picker!
    @IBOutlet weak var segmentedPMAM: UISegmentedControl!
    @IBOutlet weak var txtTime: UITextField!
    @IBOutlet weak var viewAddImages: UIView!
    @IBOutlet weak var viewAudioDescription: UIStackView!
    @IBOutlet weak var collectionViewImages: GeneralCollectionView!{
        didSet{
            self.collectionViewImages.registerNib(NibName: OrderDetailsImagesCollectionViewCell.className_)
        }
    }
    @IBOutlet weak var btnRequest: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnReorder: UIButton!
    @IBOutlet var btnRecord: RecordButton!
    @IBOutlet var viewRecord: RecordView!

    @IBOutlet weak var viewUserInfo: UIView!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblProviderName: UILabel!
    @IBOutlet weak var lblUserPhoneNumber: UILabel!
    
    @IBOutlet weak var stackOrderCost: UIStackView!
    @IBOutlet weak var stackAdress: UIStackView!
    @IBOutlet weak var stackDetails: UIStackView!
    @IBOutlet weak var stackPhotos: UIStackView!
    @IBOutlet weak var stackViewPhotos: UIStackView!
    @IBOutlet weak var stackTime: UIStackView!

    @IBOutlet weak var txtServiceCost: UITextField!
    @IBOutlet weak var txtGeneralNote: UITextView!
    
    var routeType: RouteType = .makeOrder
    
    var selectedDate: NSDate? {
        didSet{
            self.updateDateTimeSelection()
        }
    }
    var currentLocation: CLLocationCoordinate2D?
    var orderObject: TOrderObject?
    var order_id: NSNumber?
    var order_no: String?
    var choosedCategory_id: String?
    var choosedCategory_name: String?
    var choosedSubService_name: String?
    var choosedSubService_id: String?
    var choosedService_type: String?
    var choosedTime: String?
    var choosedDate: NSDate?
    var refreshStart: (()->())?
    var categories: [TConstantObject]?
    var subServices: [TServiceObject]?
    var parentVC: UIViewController?
    var imagesToPreview: [UIImage] = []
    var fromProvider = false
    var nameProvider = ""
    var recording: Recording!
    var docData: Data?
    var duration: CGFloat = 0

    
    @IBOutlet weak var viewContaner: customMaskUIView!
    @IBOutlet var btnPlay: roundedButton!
    @IBOutlet var sliderPlayer: UISlider!
    @IBOutlet var lblPlayTime: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchData()
        self.viewUserInfo.isHidden = true
        btnCancel.isHidden = true
        btnRequest.isHidden = true
        btnReorder.isHidden = true
    }
    override func viewDidDisappear(_ animated: Bool) {
        if self.recording != nil{
            self.recording.stop()
            self.recording.player.stop()
        }
        
        if let parent = self.parentVC as? OrdersListViewController {
            if self.routeType == .makeOffer {
                DispatchQueue.main.async {
                    parent.getDataFromServer()
                }
            }
        }
    }
    
    func setupView() {
        self.checkUserType()
        txtPrimaryType.imgICON.isHidden = true
        txtSecondaryType.imgICON.isHidden = true
        txtServiceType.imgICON.isHidden = true
//        self.lblNote.text = "Total Price".localize_ + " \(UserProfile.sharedInstance.service_price ?? "")"
        self.lblNote.text = "Total Price".localize_ + "-"

        self.segmentedPMAM.setTitle("OrderDetailsVC_lblTime_PM".localize_, forSegmentAt: 0)
        self.segmentedPMAM.setTitle("OrderDetailsVC_lblTime_AM".localize_, forSegmentAt: 1)
        self.segmentedPMAM.setTitleTextAttributes([.foregroundColor:"#FFFFFF".color_], for: .selected)
        self.segmentedPMAM.setTitleTextAttributes([.foregroundColor:"#091A53".color_], for: .normal)
        
        self.checkPhotosCount()
        
        self.selectedDate = NSDate()
        
        if UserProfile.sharedInstance.currentUser?.b_provider == true {
            self.imgUser.sd_setImage_(urlString: self.orderObject?.customer_photo ?? "")
            self.lblUserName.text = self.orderObject?.customer_name
            self.lblUserPhoneNumber.text = "+" + (self.orderObject?.customer_mobile ?? "")
        } else {
            self.imgUser.sd_setImage_(urlString: self.orderObject?.provider_photo ?? "")
            self.lblUserName.text = self.orderObject?.provider_name
            self.lblUserPhoneNumber.text = "+" + (self.orderObject?.provider_mobile ?? "")
        }
        
        if routeType == .orderDetails || routeType == .makeOffer {
            if routeType == .orderDetails {
                btnCancel.isHidden = false
                btnRequest.isHidden = true
                if self.parentVC is ChatOrderViewController {
                    self.viewUserInfo.isHidden = false
                }
                if UserProfile.sharedInstance.currentUser?.b_provider == false {
                    btnReorder.isHidden = true
                    if self.orderObject?.status == "cancelled" || self.orderObject?.status == "deleted_by_admin" || self.orderObject?.status == "rejected" || self.orderObject?.status == "cancelled_by_provider" {
                        btnReorder.isHidden = false
                        btnCancel.isHidden = true
                        btnRequest.isHidden = true
                    } else if self.orderObject?.status == "confirmed" {
                        btnReorder.isHidden = true
                        btnCancel.isHidden = true
                        btnRequest.isHidden = true
                    }
                } else {
                    btnReorder.isHidden = true
                    btnCancel.isHidden = true
                    btnRequest.isHidden = true
                }
            } else if routeType == .makeOffer {
                btnCancel.isHidden = true
                btnRequest.isHidden = false
            }
            self.txtPrimaryType.txtPicker.placeholder = self.orderObject?.service_name
            self.txtSecondaryType.txtPicker.placeholder = self.orderObject?.service_detail_name
            self.txtServiceType.txtPicker.placeholder = self.orderObject?.service_type_name
            print("self.orderObject?.service_type_name : \(self.orderObject?.service_type_name)")
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            let time = dateFormatter.date(from: self.orderObject?.order_time ?? "")
            self.txtDate.text = self.orderObject?.order_date?.dateString(customFormat: "yyyy-MM-dd",timeZone: TimeZone.current)
            self.txtTime.text = (time?.dateToString(customFormat: "hh:mm"))
            self.updateAMPMSengmented()
            
            self.txtAdress.text = self.orderObject?.full_address
            self.txtServiceDetails.text = self.orderObject?.order_desc
            
            if let images = self.orderObject?.files as? [String] {
                for image in images {
                    self.collectionViewImages.objects.append(GeneralCollectionViewData(reuseIdentifier: OrderDetailsImagesCollectionViewCell.className_, object: image, cellSize: nil))
                }
                imagesToPreview = (images ).map { URL(string: $0)?.getImage() ?? UIImage() }
                self.collectionViewImages.reloadData()
                self.checkPhotosCount()
            }
            self.btnRecord.isHidden = true
            if self.orderObject?.audio_description == nil{
                self.viewAudioDescription.isHidden = true
            }else{
                self.viewAudioDescription.isHidden = false
                self.recording.url = URL(string: self.orderObject?.audio_description ?? "")
            }
        } else {
            self.btnRecord.isHidden = false
            stackAdress.isHidden = true
            stackTime.isHidden = true

            self.recording = Recording(to: "recording.m4a")
            self.recording.delegate = self
            self.btnRecord.recordView = self.viewRecord
            self.viewRecord.delegate = self

            btnCancel.isHidden = true
            btnRequest.isHidden = false
            DispatchQueue.global(qos: .background).async {
                self.recording.prepare()
                self.recording.record()
                self.recording.stop()
            }
            txtPrimaryType.handlerFunc { [weak self] (item, date) in
                if let index = self?.txtPrimaryType.index, index > -1 {
                    self!.lblNote.text = "Total Price".localize_ + "\(self?.categories?[index].service_price ??  (UserProfile.sharedInstance.service_price ?? "0"))"

                    let request2 = ConstantsRequest(.getServiceDetails(service_id: self?.categories?[index].pk_i_id))
                    RequestWrapper.sharedInstance.makeRequest(request: request2).executeWithCheckResponse(showLodaer: true, showMsg: true) { [weak self] (result) in
                        guard let self = self else { return }
                        
                        self.subServices = result.subServices
                        self.txtSecondaryType.txtPicker.selectedItem = nil
                        self.txtSecondaryType.txtPicker.itemList = []
                        self.txtSecondaryType.items = []
                        self.txtSecondaryType.items = self.subServices?.map({ $0.name ?? "" }) ?? []
                        
                    }
                    //                if let obj = self?.object {
                    //                    if let index = self?.services?.firstIndex(where: { $0.id == obj.city?.id }) {
                    //                        self?.txtSubCatgory.selectedItem = self?.services?[index].name
                    //                        self?.txtSubCatgory.handler?(self?.services?[index].name, nil)
                    //                    }
                    //                }
                }
            }
            
            txtSecondaryType.handlerFunc { [weak self] (item, date) in
                if let index = self?.txtSecondaryType.index, index > -1 {
                    self?.choosedSubService_id = self?.subServices?[index].pk_i_id?.stringValue
                }
            }
            
            self.txtServiceType.items = ["Regular".localize_ ,"Direct".localize_]
            txtServiceType.handlerFunc { [weak self] (item, date) in
                if let index = self?.txtServiceType.index, index > -1 {
                    let arrauOpt = ["regular" ,"direct"]
                    self?.choosedService_type = arrauOpt[index]
                }
            }
            self.txtPrimaryType.items = self.categories?.map({ $0.name ?? "" }) ?? []
            let user = UserProfile.sharedInstance.currentUser
            if user?.b_provider == true {
                self.txtPrimaryType.txtPicker.placeholder = choosedCategory_name
            } else {
                self.categories?.forEach { i in
                    if i.pk_i_id?.stringValue == choosedCategory_id {
                        self.txtPrimaryType.selectedItem = i.name
                        self.lblNote.text = "Total Price".localize_ + "\(i.service_price ??  (UserProfile.sharedInstance.service_price ?? "0"))"
                        return
                    }
                }
            }
            
            self.txtSecondaryType.items = self.subServices?.map({ $0.name ?? "" }) ?? []
            if user?.b_provider == true {
                self.txtSecondaryType.txtPicker.placeholder = choosedSubService_name
            } else {
                self.subServices?.forEach { i in
                    if i.pk_i_id?.stringValue == choosedSubService_id {
                        self.txtSecondaryType.selectedItem = i.name

                        return
                    }
                }
            }
            if fromProvider {
                self.txtPrimaryType.txtPicker.isEnabled =  false
                self.txtSecondaryType.txtPicker.isEnabled = false
                stackDetails.isHidden = false
                lblProviderName.text = nameProvider
            }else{
                lblProviderName.isHidden = true

            }
        }
    }
    
    func checkUserType() {
        if routeType == .orderDetails {
            self.stackOrderCost.isHidden = true
            if self.collectionViewImages.objects.count == 0 {
                self.stackViewPhotos.isHidden =  true
                self.stackPhotos.isHidden =  true
            } else if self.collectionViewImages.objects.count >= 1 {
                self.stackViewPhotos.isHidden =  false
                self.stackPhotos.isHidden =  false
            }
            self.segmentedPMAM.isEnabled = false
            self.txtPrimaryType.txtPicker.isEnabled =  false
            self.txtSecondaryType.txtPicker.isEnabled = false
            self.txtServiceType.txtPicker.isEnabled = false

            self.txtServiceDetails.isEditable = false
            self.txtDate.isEnabled = false
            self.txtTime.isEnabled = false
            self.txtAdress.isEnabled = false
         
        } else if routeType == .makeOffer {
            self.stackOrderCost.isHidden = false
            
            if self.collectionViewImages.objects.count == 0 {
                self.stackViewPhotos.isHidden =  true
                self.stackPhotos.isHidden =  true
            } else if self.collectionViewImages.objects.count >= 1 {
                self.stackViewPhotos.isHidden =  false
                self.stackPhotos.isHidden =  false
            }
            self.stackDetails.isHidden = false
            self.stackAdress.isHidden = false
        } else if routeType == .makeOrder {
            self.stackOrderCost.isHidden = true
            self.stackPhotos.isHidden =  false
            self.stackViewPhotos.isHidden =  true
        }
        
        if UserProfile.sharedInstance.currentUser?.b_provider == true {
            self.segmentedPMAM.isEnabled = false
            self.txtPrimaryType.txtPicker.isEnabled =  false
            self.txtSecondaryType.txtPicker.isEnabled = false
            self.txtServiceType.txtPicker.isEnabled = false
            self.txtServiceDetails.isEditable = false
            self.txtDate.isEnabled = false
            self.txtTime.isEnabled = false
            self.txtAdress.isEnabled = false
            self.setDateTimeSelection()
            self.btnRequest.localized = "OrderDetailsVC_btnSendOffer"
        }
    }
    
    func setDateTimeSelection() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let time = dateFormatter.date(from: self.choosedTime ?? "")
        self.txtDate.text = self.choosedDate?.dateString(customFormat: "yyyy-MM-dd",timeZone: TimeZone.current)
        self.txtTime.text = (time?.dateToString(customFormat: "hh:mm"))
        self.updateAMPMSengmented()
    }
    
    func updateDateTimeSelection() {
        if routeType == .makeOrder {
        self.txtDate.text = self.selectedDate?.dateString(customFormat: "yyyy-MM-dd",timeZone: TimeZone.current)
        self.txtTime.text = self.selectedDate?.dateString(customFormat: "hh:mm",timeZone: TimeZone.current)
        }
        self.updateAMPMSengmented()
    }
    
    func updateAMPMSengmented(){
        self.segmentedPMAM.selectedSegmentIndex = (Int(self.selectedDate?.dateString(customFormat: "HH",timeZone: TimeZone.current) ?? "0") ?? 0) > 12 ? 0 : 1
    }
    
    func checkPhotosCount(){
        self.collectionViewImages.isHidden = self.collectionViewImages.objects.count == 0
        self.stackViewPhotos.isHidden = self.collectionViewImages.objects.count == 0
    }
    
    func fetchData() {
        if routeType == .orderDetails || routeType == .makeOffer{
            let request = OrderRequest(.getOrder(order_id: order_id))
            RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
                self.orderObject = result.order
                self.setupView()
            }
        } else if routeType == .makeOrder {
            let request = ConstantsRequest(.getServices)
            RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { [weak self] (result) in
                guard let self = self else { return }
                
                self.categories = result.services
                let request2 = ConstantsRequest(.getServiceDetails(service_id: NSNumber(value: Int(self.choosedCategory_id ?? "") ?? 0)))
                RequestWrapper.sharedInstance.makeRequest(request: request2).executeWithCheckResponse(showLodaer: true, showMsg: true) { [weak self] (result) in
                    guard let self = self else { return }
                    
                    self.subServices = result.subServices
                    self.setupView()
                }
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let size = CGSize(width: 105, height: 85)
        self.collectionViewImages.cellSize(size)
    }
 
    @IBAction func btnPrimaryType(_ sender: Any) {
        if UserProfile.sharedInstance.currentUser?.b_provider == true {
            return
        }
    }
    
    @IBAction func btnSecondaryType(_ sender: Any) {
        if UserProfile.sharedInstance.currentUser?.b_provider == true {
            return
        }
    }
    
    @IBAction func segmentedPMAM(_ sender: UISegmentedControl) {
        var tempDate = self.selectedDate as NSDate?
        if sender.selectedSegmentIndex == 0 {
            tempDate = tempDate?.addingHours(12) as NSDate?
        } else {
            tempDate = tempDate?.subtractingHours(12) as NSDate?
        }
        if tempDate?.isEarlierThan(Date()) == true {
            self.showErrorMessage(message: "alert_select_later_date".localize_, okAction: nil)
            self.updateAMPMSengmented()
            return
        }
        self.selectedDate = tempDate
    }
    
    @IBAction func btnSelectDate(_ sender: Any) {
        if UserProfile.sharedInstance.currentUser?.b_provider == true {
            return
        }
        if routeType == .orderDetails || routeType == .makeOffer {
            return
        }
        self.showDateTimePicker(mode: .date)
    }
    
    @IBAction func btnSelectTime(_ sender: Any) {
        if UserProfile.sharedInstance.currentUser?.b_provider == true  {
            return
        }
        if routeType == .orderDetails || routeType == .makeOffer {
            return
        }
        self.showDateTimePicker(mode: .time)
    }
    
    func showDateTimePicker(mode:UIDatePicker.Mode) {
        let alert = UIAlertController(style: .actionSheet, title: "Select date")
        var tempDate = self.selectedDate as! Date

        if mode == .date {
            alert.addAction(UIAlertAction(title: "Today".localize_, style: .default , handler:{ (UIAlertAction)in
                self.selectedDate = Date() as NSDate
            }))
            
            alert.addAction(UIAlertAction(title: "Tomorrow".localize_, style: .default , handler:{ (UIAlertAction)in
                self.selectedDate = Calendar.current.date(byAdding: .day, value: 1, to: Date())! as NSDate
            }))
            
            alert.addAction(UIAlertAction(title: "AfterTomorrow".localize_, style: .default , handler:{ (UIAlertAction)in
                self.selectedDate = Calendar.current.date(byAdding: .day, value: 2, to: Date())! as NSDate
            }))
            alert.addAction(title: "Cancel".localize_, style: .cancel)
            alert.show()
        } else if mode == .time {
            alert.addDatePicker(mode: mode, date: self.selectedDate as Date?, minimumDate: Date(), local: NSLocale(localeIdentifier: "en-us"), calender: NSCalendar(calendarIdentifier: .gregorian)) { date in
                tempDate = date
            }
            alert.addAction(title: "OK".localize_, style: .default) { action in
                self.selectedDate = tempDate as NSDate
            }
            alert.addAction(title: "Cancel".localize_, style: .cancel)
            alert.show()
        }
    }
    
    @IBAction func btnAddPhoto(_ sender: UIButton) {
        if UserProfile.sharedInstance.currentUser?.b_provider == true {
            return
        }
        self.fdTake_action(sender) { photo, info in
            self.collectionViewImages.objects.append(GeneralCollectionViewData(reuseIdentifier: OrderDetailsImagesCollectionViewCell.className_, object: photo, cellSize: nil))
            self.collectionViewImages.reloadData()
            self.imagesToPreview.append(photo)
            self.checkPhotosCount()

            DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
                let bottomOffset = CGPoint(x: 0, y: self.scrollViewContaner.contentSize.height - self.scrollViewContaner.bounds.height + self.scrollViewContaner.contentInset.bottom)
                self.scrollViewContaner.setContentOffset(bottomOffset, animated: true)
            }
        }
    }
    
    @IBAction func btnRequest(_ sender: Any) {
        if !self.validation() {
            return
        }
        if UserProfile.sharedInstance.currentUser?.b_provider == true {
            let request = ServiceProviderRequest(.sendOffer(order_id: orderObject?.pk_i_id?.intValue, price: Int(txtServiceCost.text ?? ""), notes: self.txtGeneralNote.text))
            RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) { [weak self] in
                    AppDelegate.sharedInstance.rootNavigationController.showPopAlert(title: "Success".localize_, message: "OfferSuccess".localize_)
                }
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) { [weak self] in
                    self?.refreshStart?()
                }
                self.popToRootVC()
            }
        } else {
            let images = self.collectionViewImages.objects.map({ ($0.object as? UIImage) ?? UIImage()})
            let request = OrderRequest(.addOrder(service_detail_id: self.choosedSubService_id, descriptionValue: self.txtServiceDetails.text, full_address: self.txtAdress.text, order_date: self.txtDate.text, order_time: self.selectedDate?.dateString(customFormat: "HH:mm",timeZone: TimeZone.current), order_type: self.choosedService_type ?? "regular", images: images, media:  try? Data(contentsOf: self.recording.url)))
            RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { (result) in
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) { [weak self] in
                    AppDelegate.sharedInstance.rootNavigationController.showPopAlert(title: "Success".localize_, message: "OderSuccess".localize_)
                }
                self.popToRootVC()
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toOrderCancelReasonsViewController" {
            if let vc = segue.destination as? OrderCancelReasonsViewController {
                vc.order_id = self.order_id
                vc.order_no = NSNumber(value: Int(self.order_no ?? "0") ?? 0)
            }
        }
    }
    
    @IBAction func btnReorderPressed(_ sender: Any) {
        let request = OrderRequest(.reOrder(order_id: orderObject?.pk_i_id))
        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) { [weak self] in
                AppDelegate.sharedInstance.rootNavigationController.showPopAlert(title: "Success".localize_, message: "OderSuccess".localize_)
            }
            self.popToRootVC()
        }
    }
    
    @IBAction func btnCancel(_ sender: Any) {
      //  performSegueWithCheck(withIdentifier: "toOrderCancelReasonsVC", sender: self)
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OrderCancelReasonsViewController") as! OrderCancelReasonsViewController
//        vc.order_id = self.order_id
//        vc.order_no = NSNumber(value: Int(self.order_no ?? "0") ?? 0)
//        self.present(vc, animated: true, completion: nil)
        performSegue(withIdentifier: "toOrderCancelReasonsViewController", sender: nil)
    }
}

extension OrderDetailsViewController {
    
    func showErrorMSG(msgText: String) -> Bool {
        self.showPopAlert(title: "Error".localize_, message: "TextFeildValidation".localized(with: msgText))
        return false
    }
    
    func validation() -> Bool {
        if UserProfile.sharedInstance.currentUser?.b_provider == true {
            if self.txtServiceCost.text?.isEmptyOrWhiteSpace() == true {
                return self.showErrorMSG(msgText: "OrderDetailsVC_lblServiceCost".localize_)
            } else if self.txtGeneralNote.text?.isEmptyOrWhiteSpace() == true {
                return self.showErrorMSG(msgText: "OrderDetailsVC_lblGeneralNotes".localize_)
            }
        } else {
            if self.txtPrimaryType.isValidateValue == false {
                return self.showErrorMSG(msgText: "OrderDetailsVC_lblPrimaryType".localize_)
            } else if self.txtSecondaryType.isValidateValue == false {
                return self.showErrorMSG(msgText: "OrderDetailsVC_lblSecondaryType".localize_)
            }
//            else if self.txtServiceDetails.text?.isEmptyOrWhiteSpace() == true {
//                return self.showErrorMSG(msgText: "OrderDetailsVC_lblServiceDetails".localize_)
//            }
            else if self.txtServiceType.isValidateValue == false  {
               return self.showErrorMSG(msgText: "Server Type".localize_)
           }
//            else if self.txtAdress.text?.isEmptyOrWhiteSpace() == true {
//                return self.showErrorMSG(msgText: "OrderDetailsVC_lblAdrress".localize_)
//            }
//            else if self.collectionViewImages.objects.count == 0 {
//                return self.showErrorMSG(msgText: "OrderDetailsVC_lblUploadPhotos".localize_)
//            }
        }
        return true
    }
}
extension OrderDetailsViewController: RecorderDelegate {
    func audioMeterDidUpdate(dB: Float) {
        print("audioMeterDidUpdate : \(dB)")
    }
}

extension OrderDetailsViewController: RecordViewDelegate {
    func onStart() {
        self.recording.player.stop()
        self.recording.record()
        self.viewRecord.isHidden = false
        self.viewContaner.isHidden = !self.viewRecord.isHidden
    }
    
    func onCancel() {
        self.recording.stop()
        //        self.stackViewPlayerContaner.isHidden = false
    }
    
    func onAnimationEnd() {
        self.recording.stop()
        self.viewRecord.isHidden = true
        self.viewContaner.isHidden = !self.viewRecord.isHidden
    }
    
    func onFinished(duration: CGFloat) {
        self.recording.stop()
        self.recording.player.stop()
        self.duration = duration
        self.viewRecord.isHidden = true
        self.viewContaner.isHidden = !self.viewRecord.isHidden
        
        let request = ChatOrderRequest(.sendMessage(order_id: self.order_id, type: .voice, media: try? Data(contentsOf: self.recording.url), text: nil))
//        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: true) { responce in
//            let obj = TChatObject(fromDictionary: [:])
//            obj.s_answered = nil
//            obj.my_messsage = NSNumber(value: true)
//            obj.created_at = NSDate()
//            obj.pk_i_id = nil
//            obj.category = ChatCategory.regular.rawValue
//            obj.s_photo = nil
//            obj.s_text = nil
//            obj.s_total_price = nil
//            obj.types = ChatType.voice.rawValue
//            obj.value = responce.media_path
////
////            self.appedChatObjects(obj: obj)
////            self.scrollToEnd()
//        }
    }
    
    @IBAction func btnPlay(_ sender: Any) {

        guard let url = self.recording.url else {
            return
        }
        if recording.player.currentItemURL?.absoluteString ?? "" != self.recording.url.absoluteString {
            recording.player.stop()
            //self.tableView.reloadData()
            recording.player = AudioPlayer(cutomeUrl: url)
        }
        if recording.player?.isPlaying == true {
            recording.player.stop()
//            tempVoiceCell = nil
            self.btnPlay.setImage(UIImage(named: "ic_order_create_player_full"), for: .normal)
        } else {
            if let current = recording.player?.currentItem?.currentTime(), let duration = recording.player?.currentItem?.duration, current.isValid == true, duration.seconds > 0, Int(current.seconds) == Int(duration.seconds) {
                recording.player?.seekTo(value: 0)
            }
            recording.player.stop()
          //  self.tableView.reloadData()
            
            recording.player = AudioPlayer(cutomeUrl: url)
            recording.play()
            self.btnPlay.setImage(UIImage(named: "ic_order_create_pause_full"), for: .normal)
//            tempVoiceCell = self
        }
//        self.recording.player.currentTimerHandler { time in
//
//        }
        recording.player?.currentTimerHandler(currentTimerHandler: {time in

//        self.recording.player?.currentTimerHandler!({[weak self] time in
//            guard let self = self else {return}
//            guard self == tempVoiceCell else {
//                return
//            }
            var duration = self.recording.player?.currentItem?.duration.seconds ?? 0.0
            if duration <= 1.0 {
                duration = 1.0
            }
            
//            if recording.player.currentItemURL?.absoluteString != obj.value {
//                obj.duration = Float(duration)
//                obj.currentDuration = Float(time)
//            }
//            self.sliderPlayer.maximumValue = obj.duration ?? 0.0
//            self.sliderPlayer.setValue(obj.currentDuration ?? 0.0, animated: true)
//            print("time plaing is : \(obj.currentDuration ?? 0.0)")
            self.sliderPlayer.maximumValue = Float(duration)
            self.sliderPlayer.setValue(Float(time), animated: true)
//            print("time plaing is : \(time)")
            
//            self.hmsFrom(seconds: Int(obj.currentDuration ?? 0.0)) { _, minutes, seconds in
            self.hmsFrom(seconds: Int(time)) { _, minutes, seconds in

                let minutes = self.getStringFrom(seconds: minutes)
                let seconds = self.getStringFrom(seconds: seconds)

                self.lblPlayTime.text = "\(minutes):\(seconds)"
            }
        })
        recording.player?.playerStateHandler(playerStateHandler: {[weak self] _ in
            guard let self = self else {return}
//            guard self == tempVoiceCell else {
//                return
//            }
            if self.recording.player?.isPlaying ?? false {
                self.btnPlay.setImage(UIImage(named: "ic_order_create_pause_full"), for: .normal)
                self.sliderPlayer.value = 0
                self.lblPlayTime.text = "00:00"
            } else {
                self.btnPlay.setImage(UIImage(named: "ic_order_create_player_full"), for: .normal)
            }
        })
    }
    func hmsFrom(seconds: Int, completion: @escaping (_ hours: Int, _ minutes: Int, _ seconds: Int) -> Void) {
        completion(seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    func getStringFrom(seconds: Int) -> String {
        return seconds < 10 ? "0\(seconds)" : "\(seconds)"
    }
}
