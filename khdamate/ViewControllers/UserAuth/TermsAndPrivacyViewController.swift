//
//  TermsAndPrivacyViewController.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 23/10/2021.
//

import UIKit
import WebKit

class TermsAndPrivacyViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet var viewContaner: customMaskUIView!
    
    enum TermsAndPrivacyType {
        case terms
        case privacy
        case aboutApp
    }
    var content: String?
    public var route: TermsAndPrivacyType = .terms
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchData()
    }
    
    func setupView() {
        self.viewContaner.roundCorners(roundshapeType: .topCorner, radius: 20)
        self.webView.loadHTMLWithLocalCSS(content ?? "")
    }

    func fetchData() {
        switch route {
            
        case .terms:
            let request = ConstantsRequest(.getTermsAndConditions)
            RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
                self.content = result.terms?.content
                self.setupView()
            }
        case .privacy:
            let request = ConstantsRequest(.getPrivacyPolicy)
            RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
                self.content = result.privacy?.content
                self.setupView()
            }
        case .aboutApp:
            let request = ConstantsRequest(.getAboutUs)
            RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
                self.content = result.aboutUs?.content
                self.setupView()
            }
        }
    }
}
