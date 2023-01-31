//
//  WalletViewController.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 16/11/2021.
//

import UIKit
import AlertsPickers
import DateTools
import SONetwork
import Fastis

class WalletViewController: UIViewController {
    @IBOutlet weak var orderCountLbl: UILabel!
    @IBOutlet weak var incomeLbl: UILabel!
    @IBOutlet weak var profitLbl: UILabel!
    @IBOutlet weak var selectDate: UILabel!
    @IBOutlet weak var btnClear: UIButton!

    @IBOutlet weak var btnAmount: UIButton!
    @IBOutlet weak var btnCurrentDate: UIButton!
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            self.tableView.registerNib(NibName: WalletTableViewCell.className_)
        }
    }
    var transtion = [KHData]()
    var Object: KHWallet?
    var urlDate = ""
    var selectedDate:NSDate!{
        didSet{
//            self.getDataFromServer()
//            self.btnCurrentDate.setTitle(self.selectedDate.dateString(customFormat: "dd - MMM - yyyy"), for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getDataFromServer()
        self.tableView.delegate = self
        self.tableView.dataSource = self

        // Do any additional setup after loading the view.
        self.setupView()
    }
    func setupView(){
//        self.btnAmount.setTitle("570 SAR", for: .normal)
        orderCountLbl.text = "\(Object?.result?.totalOrders ?? 0)"
        incomeLbl.text = "\(Object?.result?.totalPrice ?? "0")"
        profitLbl.text = "\(Object?.result?.totalProfit ?? "0")"
        self.selectedDate = NSDate()
    }
    func getDataFromServer(){
        var dic2 : HTTPHeaders = [
            "Content-Language" : "\(UserProfile.sharedInstance.isRTL() == true ? "ar" : "en")",
            "device-os" : "ios",
            "Authorization" : "Bearer \(UserProfile.sharedInstance.currentUserToken ?? "")"
        ]
        self.showHideLoaderView(showLoader: true)


        SO.request("GET", url:  GlobalConstants.API_Provider_getProvider_Controller +  "/wallet?paging_count=100&\(urlDate ?? "")" , header:dic2, parameters: [:], success: { (jsonString) in
                    let data = jsonString?.data(using: .utf8)!
                if let serverResponse = try? JSONDecoder().decode(KHWallet.self, from: data!){
                    print("json : \(serverResponse)")
                    DispatchQueue.main.async {
                        self.Object = serverResponse
                        self.setupView()
                        self.transtion = (serverResponse.result?.logs?.data)!
                        self.tableView.reloadData()
                        self.showHideLoaderView(showLoader: false)

                    }

                    } else {
                        print("bad json - do some recovery")
                        self.showHideLoaderView(showLoader: false)

                    }
                    
                }) { (error) in
                    self.showHideLoaderView(showLoader: false)

                }
        
        
//        let request = ProviderRequest(.getProvider(provider_id: provider_id))
//        request.provider_id = "\(provider_id ?? 0)"
//        RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
//            self.providerObject = result.provider
//            self.setupView()
//            self.services = result.provider?.services ?? []
//            self.tableView.reloadData()
//            self.lblRate.text = NSString(format: "%.1f", result.provider?.rate?.floatValue ?? 0.0) as String
//
//
//
//        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func btnCurrentDate(_ sender: Any) {
        let alert = UIAlertController(style: .actionSheet)
        var pickerDate = self.selectedDate ?? NSDate()
        alert.addDatePicker(mode: .date, date: self.selectedDate as Date, minimumDate: Date(), local: NSLocale(localeIdentifier: "en-us"), calender: NSCalendar(identifier: NSCalendar.Identifier.gregorian)) { (date) in
            pickerDate = date as NSDate
        }
        alert.addAction(title: "OK".localize_, style: .default,handler: { _ in
            self.selectedDate = pickerDate
        })
        alert.addAction(title: "Cancel".localize_, style: .cancel)
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func btnPrev(_ sender: Any) {
        if UserProfile.sharedInstance.isRTL() {
            self.addingDays()
        }else{
            self.subtractingDays()
        }
    }
    @IBAction func btnNext(_ sender: Any) {
        let fastisController = FastisController(mode: .range)
        fastisController.title = "Choose range".localize_
        fastisController.maximumDate = Date()
        fastisController.allowToChooseNilDate = true
        fastisController.shortcuts = [.today, .lastWeek]
        fastisController.doneHandler = { resultRange in
            self.selectedDate = resultRange?.fromDate as NSDate?
            let from = self.selectedDate.dateString(customFormat: "yyyy-MM-dd")
            let fromMMM = self.selectedDate.dateString(customFormat: "dd MMM")
            self.selectedDate = resultRange?.toDate as NSDate?
            let to = self.selectedDate.dateString(customFormat: "yyyy-MM-dd")
            let toMMM = self.selectedDate.dateString(customFormat: "dd MMM")
            self.urlDate = "from_date=\(from)&to_date=\(to)"
            print(self.urlDate) // resultDate is Date
            self.selectDate.text = "Transaction".localize_ + " \(fromMMM) - \(toMMM)"
            self.btnClear.isHidden = false
            self.getDataFromServer()
            
        }
        fastisController.present(above: self)
    }
    @IBAction func btnClear(_ sender: Any) {
        self.urlDate = ""
        print(self.urlDate) // resultDate is Date
        self.selectDate.text = "Transaction".localize_
        btnClear.isHidden = true

        self.getDataFromServer()

    }
    func subtractingDays() {
        let date = self.selectedDate.subtractingDays(1)! as NSDate
        if date.daysEarlierThan(Date()) > 0 {
            return
        }
        self.selectedDate = date
    }
    func addingDays(){
        let date = self.selectedDate.addingDays(1)! as NSDate
//        if date.daysLaterThan(Date()) >= 6 {
//            return
//        }
        self.selectedDate = date
    }
}
extension WalletViewController: UITableViewDataSource, UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transtion.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WalletTableViewCell", for: indexPath) as! WalletTableViewCell
        cell.obj = transtion[indexPath.row]
            return cell


    }
       
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
  

}
