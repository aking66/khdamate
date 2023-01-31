//
//  MainNavigationController.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 03/10/2021.
//

import UIKit

class MainNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        AppDelegate.sharedInstance.rootNavigationController = self
        AppDelegate.sharedInstance.rootNavigationController.delegate = self
        self.delegate = self
        self.setNavBG()
        self.setFirstVC()
    }
    func setNavBG(isHome:Bool = false) {
        let fancyImage = UIImage(named: "ic_back")
        if #available(iOS 13.0, *) {
            let fancyAppearance = self.navigationBar.standardAppearance
            fancyAppearance.configureWithOpaqueBackground()
            fancyAppearance.setBackIndicatorImage(fancyImage, transitionMaskImage: fancyImage)
            fancyAppearance.shadowImage = UIImage()
            fancyAppearance.shadowColor = .clear
            
            let font = UIFont(name: AppFontName.bold, size: UIFont.getFontSize(17))!
            fancyAppearance.backgroundColor = .clear
            self.navigationBar.tintColor = "#0096B4".color_
            fancyAppearance.titleTextAttributes = [.foregroundColor: "#0096B4".color_, .font: font]
            fancyAppearance.largeTitleTextAttributes = [.foregroundColor: "#0096B4".color_, .font: font]
            
            let button = UIBarButtonItemAppearance(style: .plain)
            button.normal.titleTextAttributes = [.foregroundColor: UIColor.clear, .font: UIFont(name: AppFontName.regular, size: 1)]
            fancyAppearance.buttonAppearance = button
            
            if isHome == true {
                self.navigationBar.tintColor = "#FFFFFF".color_
                fancyAppearance.titleTextAttributes = [.foregroundColor: "#FFFFFF".color_, .font: font]
                fancyAppearance.largeTitleTextAttributes = [.foregroundColor: "#FFFFFF".color_, .font: font]
            }
            
            self.navigationBar.scrollEdgeAppearance = fancyAppearance
            self.navigationBar.standardAppearance = fancyAppearance
            self.navigationBar.compactAppearance = fancyAppearance
            if #available(iOS 15.0, *) {
                self.navigationBar.compactScrollEdgeAppearance = fancyAppearance
            }
        } else {
            self.navigationBar.backIndicatorImage = fancyImage
            self.navigationBar.backIndicatorTransitionMaskImage = fancyImage
        }
        
        self.navigationBar.makeTransparent()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func setFirstVC(animated:Bool = false){
        let userPr = UserProfile.sharedInstance
        var vcArr = [UIViewController]()
        if userPr.b_walkthrough_show?.boolValue != true {
            vcArr = [WalkthroughViewController.initiateInstance(storyboard: .main)]
        } else if userPr.currentUserID == nil {
            vcArr = [LoginViewController.initiateInstance(storyboard: .userAuth)]
        } else {
            vcArr = [MainTabBarController.initiateInstance(storyboard: .main)]
        }
        self.setViewControllers(vcArr, animated: animated)
    }
    func skipLogin(){
        let userPr = UserProfile.sharedInstance
        userPr.currentUserID = NSNumber(value:-1)
        self.setFirstVC(animated: true)
        userPr.currentUserID = nil
    }
}
extension MainNavigationController:UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        self.setNavBG(isHome: viewController.addCustomNavBG)
        viewController.addNavigationBG()
    }
}
