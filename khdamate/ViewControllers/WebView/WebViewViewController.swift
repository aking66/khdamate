//
//  WebViewViewController.swift
//  khdamate
//
//  Created by Yaser on 08/12/2021.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController{
    
    enum PageType {
        case adv
        case terms
        case about
        case privacy
        case payment
        
        var name: String {
            switch self {
            case .terms:
                return "TermsAndConditions".localize_
            case .about:
                return "About Seder".localize_
            case .privacy:
                return "Privacy Policy".localize_
            case .payment:
                return "Payment".localize_
            case .adv:
                return "Advertisment".localize_
            }
        }
        
        var url: String {
            switch self {
            case .about:
                return ""
            case .terms:
                return ""
            case .privacy:
                return ""
            case .payment:
                return ""
            case .adv:
                return ""
            }
        }
    }
    
    @IBOutlet weak var webView_: WKWebView!
    
    @IBOutlet weak var progressView_: UIProgressView!
    
    private var observation: NSKeyValueObservation? = nil
    
    var url: String?
    var order_id: String?
    var strData: String?
    var type: PageType = .terms
    var didFinishPayment: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localized()
        setupData()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension WebViewViewController {
    
    func setupView() {
        webView_.uiDelegate = self
        webView_.navigationDelegate = self
        self.isNavBarHidden = false
    }
    
    func localized() {
        self.title = self.type.name
    }
    
    func setupData() {
        if let str = strData, self.type != .payment {
            webView_.loadHTMLString(UserProfile.sharedInstance.isRTL() ? str.htmlAr : str.html, baseURL: URL.init(fileURLWithPath: Bundle.main.path(forResource: UserProfile.sharedInstance.isRTL() ? "styleAR" : "style", ofType: "css")!))
        } else if let url = self.url, let uRL = URL.init(string: url), self.type == .payment
        {
            self.webView_.load(URLRequest.init(url: uRL))
        } else if let url = self.url, let uRL = URL.init(string: url), self.type == .adv {
            self.webView_.load(URLRequest.init(url: uRL))
            
        }
        self.progressView_.isHidden = true
        self.observation = self.webView_.observe(\.estimatedProgress, options: [.new]) { [weak self] _, _ in
            guard let self = self else { return }
            self.progressView_.progress = Float(self.webView_.estimatedProgress)
            self.progressView_.isHidden = self.progressView_.progress > 0.99
        }
    }
    
    func fetchData() {
    }
}

extension WebViewViewController: WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler {
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
    }
//
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        debugPrint("payment url = \(navigationAction.request.url?.absoluteString ?? "")")
        if let uri = navigationAction.request.url {
            if uri.absoluteString.contains("https://khadamat.techno2030.com/public/order/savePaymentResponse") == true || uri.absoluteString.contains("http://khadamat.techno2030.com/public/order/savePaymentResponse") == true {
//                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) { [weak self] in
//                    guard let self = self else { return }
//                    let request = OrderRequest(.checkPayment(order_id: <#T##NSNumber?#>))
//                    RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
//                    }
//                }
//                self.popVC()
                
            }
//            if uri["ResponseCode"] == "000" && uri["Result"] == "Successful" {
////            let request = OrderRequest(.orders)
////            request.order_id = self.order_id
////            RequestWrapper.sharedInstance.makeRequest(request: request)?.executeWithCheckResponse(showLodaer: true, showMsg: true) { [weak self] (result) in
////                guard let self = self else { return }
////                if let obj = result.orders?.first, obj.e_status == .paid {
//                    let vc = PaymentSuccessViewController.storyboard_
//                    vc.presentVC()
////                } else {
//////                    self.ShowErrorMessage(message: "Payment failed".localize_)
////                }
//            } else {
//                self.ShowErrorMessage(message: "Something has happened and the payment process did not complete".localized(with: uri["ResponseCode"] ?? "-1"))
//            }
        }
        decisionHandler(.allow)
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        debugPrint("webView url = \(webView.url?.absoluteString ?? "")")
        if webView.url?.absoluteString.contains("https://khadamat.techno2030.com/public/order/savePaymentResponse") == true || webView.url?.absoluteString.contains("http://khadamat.techno2030.com/public/order/savePaymentResponse") == true {
            didFinishPayment?()
            self.popVC()
        }
        
    }
}

extension UIProgressView {
    @IBInspectable var progressBarHeight: CGFloat {
        set {
            let transform = CGAffineTransform(scaleX: 1.0, y: newValue)
            self.transform = transform
        }
        get {
            return self.frame.height
        }
    }
}
