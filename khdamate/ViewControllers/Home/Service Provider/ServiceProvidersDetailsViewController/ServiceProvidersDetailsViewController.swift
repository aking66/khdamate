//
//  ServiceProvidersDetailsViewController.swift
//  khdamate
//
//  Created by Karim Amsha on 13.11.2022.
//

import UIKit
import SONetwork
import SVProgressHUD

class ServiceProvidersDetailsViewController: UIViewController {
    
    var provider_id: NSNumber?
    var providerObject: KHProvider?
    @IBOutlet weak var imgProvider: UIImageView!
    @IBOutlet weak var lblProviderName: UILabel!
    @IBOutlet weak var lblProviderTel: UILabel!
    @IBOutlet weak var lblRate: UILabel!
    @IBOutlet weak var lblAddres: UILabel!
    
    var services = [KHServices]()
    var works = [KHWorks]()
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            self.tableView.registerNib(NibName: ServiceProviderCell.className)
            self.tableView.registerNib(NibName: reviewProviderCell.className_)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNavigationBG()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        setupView()
        fetchData()
    }
    
    func setupView() {
        self.title = "ServiceProviersDetailsVC_title".localize_
        
        self.imgProvider.sd_setImage_(urlString: self.providerObject?.result?.imageUrl ?? "")
        lblProviderName.text = self.providerObject?.result?.name
        lblProviderTel.text = self.providerObject?.result?.mobile
        lblAddres.text = self.providerObject?.result?.address
    }
    
    @IBAction func btnOpenMap(_ sender: Any) {
        
        if (UIApplication.shared.canOpenURL(NSURL(string:"comgooglemaps://")! as URL)) {
            UIApplication.shared.openURL(NSURL(string:
                                                "comgooglemaps://?saddr=&daddr=\(String(describing: self.providerObject?.result?.latitude ?? "")),\(self.providerObject?.result?.longitude ?? "")&directionsmode=driving")! as URL)
            
        } else {
            NSLog("Can't use comgooglemaps://");
        }
    }
    
    func fetchData() {
        var dic2 : HTTPHeaders = [
            "Content-Language" : "\(UserProfile.sharedInstance.isRTL() == true ? "ar" : "en")",
            "device-os" : "ios",
            "Authorization" : "Bearer \(UserProfile.sharedInstance.currentUserToken ?? "")"
        ]
        self.showHideLoaderView(showLoader: true)


        SO.request("GET", url:  GlobalConstants.API_Provider_getProvider_Controller +  "/provider/\(provider_id ?? 0)" , header:dic2, parameters: [:], success: { (jsonString) in
                    let data = jsonString?.data(using: .utf8)!
//            print("json : \(parsedData)")
                if let serverResponse = try? JSONDecoder().decode(KHProvider.self, from: data!){
                    print("json : \(serverResponse)")
                    DispatchQueue.main.async {
                        
                        self.providerObject = serverResponse
                        self.setupView()
                        self.services = serverResponse.result?.services ?? []
                        self.works = serverResponse.result?.works ?? []

                        self.tableView.reloadData()
                        self.lblRate.text = NSString(format: "%.1f", serverResponse.result?.rate ?? 0.0) as String
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
    @IBAction func btnComments(_ sender: Any) {
        InitiateInstanceWithPush(vcClass: reviewListViewController(), storyboard: .main) { (vc) in
            vc.rates = self.providerObject?.result?.rates ?? []
            vc.comments = self.providerObject?.result?.comments ?? []
            vc.provider_id = self.provider_id
            
        }
    }

}

extension ServiceProvidersDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return services.count

        default:
            return works.count

        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceProviderCell", for: indexPath) as! ServiceProviderCell
            cell.obj = services[indexPath.row]
            cell.configerCell(parentViewController: self, indexPath: indexPath)
            return cell

        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "reviewProviderCell", for: indexPath) as! reviewProviderCell
            cell.work = works [indexPath.row]
            return cell
            
        }
    }
       
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? ServiceProviderCell {
            let obj = services[indexPath.row]

            InitiateInstanceWithPush(vcClass: ServicesListViewController(), storyboard: .home) { vc in
                vc.categoryID = obj.id as NSNumber?
                vc.categoryName = obj.name
                vc.fromProvider = true
                vc.nameProvider = self.providerObject?.result?.name ?? ""
            }
            
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Services".localize_
            
        default:
            return "Works".localize_

        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

}
    
    
    
