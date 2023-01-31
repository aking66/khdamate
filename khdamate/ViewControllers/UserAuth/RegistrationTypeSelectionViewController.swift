//
//  RegistrationTypeSelectionViewController.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 19/10/2021.
//

import UIKit

class RegistrationTypeSelectionViewController: UIViewController {

    @IBOutlet weak var viewContaner: customMaskUIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.viewContaner.roundCorners(roundshapeType: .topCorner, radius: 20)
    }

    @IBAction func btnClient(_ sender: Any) {
        InitiateInstanceWithPush(vcClass: RegistrationViewController(), storyboard: .userAuth) { vc in
            vc.route = .client
        }
    }
    @IBAction func btnServiceProvider(_ sender: Any) {
        InitiateInstanceWithPush(vcClass: RegistrationViewController(), storyboard: .userAuth) { vc in
            vc.route = .service_provider
        }
    }
    @IBAction func btnSkip(_ sender: Any) {
        AppDelegate.sharedInstance.rootNavigationController.skipLogin()        
    }
}
