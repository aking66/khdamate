/************************* Mo’min J.Abusaada *************************/
//
//  AppDelegate.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase
import FirebaseMessaging
import SwiftyJSON

#if DEBUG
import CocoaDebug
#endif

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    static let sharedInstance = UIApplication.shared.delegate as! AppDelegate
    
    var rootNavigationController: MainNavigationController! = nil
    var rootTabBarController: MainTabBarController! = nil
    var orderChatVC: ChatOrderViewController! = nil
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        L102Localizer.DoTheMagic()
#if canImport(RestKit)
        BaseModel.sharedInstance.modelSetup()
#endif
        
#if DEBUG
        CocoaDebug.enable()
        CocoaDebugSettings.shared.showBubbleAndWindow = true
        CocoaDebugSettings.shared.enableLogMonitoring = true
        self.setupShortcuts()
#endif
        IQKeyboardManager.shared.enable = true
        UIFont.overrideInitialize()
        if #available(iOS 13.0, *) {
            self.window?.rootViewController?.overrideUserInterfaceStyle = .light
        }
        
        FirebaseApp.configure()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        var bgTask: UIBackgroundTaskIdentifier = UIBackgroundTaskIdentifier(rawValue: 0)
        bgTask = application.beginBackgroundTask(expirationHandler: {
            application.endBackgroundTask(bgTask)
            bgTask = UIBackgroundTaskIdentifier.invalid
        })
    }

    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        if self.rootNavigationController.viewControllers.last is ChatOrderViewController {
            let chatVC = self.rootNavigationController.viewControllers.last as? ChatOrderViewController
            chatVC?.getDataFromServer()
        }
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

//MARK: - Push Notifications
extension AppDelegate: UNUserNotificationCenterDelegate, MessagingDelegate {
    func setupFCM(application: UIApplication) {
        Messaging.messaging().delegate = self
        
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
        } else {
            let settings: UIUserNotificationSettings =
            UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        
        application.registerForRemoteNotifications()
        
        updateFCMToken()
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        updateFCMToken()
    }
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken as Data
        updateFCMToken()
    }
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject], fetchCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        // Let FCM know about the message for analytics etc.
        Messaging.messaging().appDidReceiveMessage(userInfo)
        updateFCMToken()
        //  BaseModel.sharedInstance.updateHeadrs()
    }
    
    func updateFCMToken() {
        Messaging.messaging().token { token, error in
            if let error = error {
                debugPrint("Error fetching remote instange ID: \(error)")
            } else if let result = token {
                debugPrint("Remote instance ID token: \(result)")
                UserProfile.sharedInstance.fcm_token = result
                debugPrint("FCM Token updated == \(result)")
                
                let request = NotificationsRequest(.updateRegistrationId)
                request.registration_id = UserProfile.sharedInstance.fcm_token
                RequestWrapper.sharedInstance.makeRequest(request: request).executeWithCheckResponse(showLodaer: true, showMsg: false) { (result) in
                    
                }
            }
        }
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        completionHandler(UIBackgroundFetchResult.newData)
        //        notificationAction(userInfo: userInfo)
        debugPrint("Push Notification : \(userInfo.formatJSON() ?? "")")
        let json = JSON.init(parseJSON: userInfo.formatJSON() ?? "")
        self.notifcatonAction(json: json)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if let userInfo = notification.request.content.userInfo as? [AnyHashable: Any] {
            let json = JSON.init(parseJSON: userInfo.formatJSON() ?? "")
            // self.notifcatonPresenting(json: json)
            let category = json["category"].stringValue
            if category == "chat" {
                if self.rootNavigationController.viewControllers.last is ChatOrderViewController {
                    let chatVC = self.rootNavigationController.viewControllers.last as? ChatOrderViewController
                    if json["reference_id"].numberValue == chatVC?.order_id {
                        chatVC?.getDataFromServer(showLodaer: false)
                        completionHandler([])
                    } else {
                        completionHandler([.alert, .badge, .sound])
                    }
                }
            }
        }
        completionHandler([.alert, .badge, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let application = UIApplication.shared
        if let userInfo = response.notification.request.content.userInfo as? [AnyHashable: Any] {
            let json = JSON.init(parseJSON: userInfo.formatJSON() ?? "")
            self.notifcatonAction(json: json)
            debugPrint(json)
            if(application.applicationState == .active){
                print("user tapped the notification bar when the app is in foreground")
            }
            
            if(application.applicationState == .inactive)
            {
                print("user tapped the notification bar when the app is in background")
            }
            
            /* Change root view controller to a specific viewcontroller */
            
        }
        completionHandler()
    }
    
    func notifcatonAction(json: JSON) {
        //        let data = JSON(parseJSON: json["data"].stringValue)
        let category = json["category"].stringValue
        if UserProfile.sharedInstance.currentUser?.b_provider == true {
            if category == "chat" {
                if let vc = rootNavigationController.viewControllers.last as? ChatOrderViewController {
                    vc.getDataFromServer()
                } else {
                    let reference_id = json["reference_id"].numberValue
                    InitiateInstanceWithPush(vcClass: ChatOrderViewController(), storyboard: .chatOrder) { vc in
                        vc.order_id = reference_id
                    }
                }
            } else if category == "order" {
                let reference_id = json["reference_id"].numberValue
                let reference_status = json["reference_status"].stringValue
                if reference_status == "new" {
                    InitiateInstanceWithPush(vcClass: OrderDetailsViewController(), storyboard: .orders) { vc in
                        vc.routeType = .makeOffer
                        vc.order_id = reference_id
                    }
                } else  if reference_status == "cancelled" || reference_status == "cancelled_by_provider" || reference_status == "rejected" || reference_status == "deleted_by_admin" {
                    InitiateInstanceWithPush(vcClass: OrderDetailsViewController(), storyboard: .orders) { vc in
                        vc.routeType = .orderDetails
                        vc.order_id = reference_id
                    }
                } else {
                    InitiateInstanceWithPush(vcClass: ChatOrderViewController(), storyboard: .chatOrder) { vc in
                        vc.order_id = reference_id
                    }
                }
            } else if category == "offer" {
            }
        } else {
            if category == "chat" {
                if let vc = rootNavigationController.viewControllers.last as? ChatOrderViewController {
                    vc.getDataFromServer()
                } else {
                    let reference_id = json["reference_id"].numberValue
                    InitiateInstanceWithPush(vcClass: ChatOrderViewController(), storyboard: .chatOrder) { vc in
                        vc.order_id = reference_id
                    }
                }
            } else if category == "order" {
                
                let reference_id = json["reference_id"].numberValue
                let reference_status = json["reference_status"].stringValue
                if reference_status == "cancelled" || reference_status == "cancelled_by_provider" || reference_status == "rejected" || reference_status == "deleted_by_admin" {
                    InitiateInstanceWithPush(vcClass: OrderDetailsViewController(), storyboard: .orders) { vc in
                        vc.routeType = .orderDetails
                        vc.order_id = reference_id
                    }
                } else {
                    InitiateInstanceWithPush(vcClass: ChatOrderViewController(), storyboard: .chatOrder) { vc in
                        vc.order_id = reference_id
                    }
                }
            } else if category == "offer" {
                let mainTabBar = AppDelegate.sharedInstance.rootTabBarController
                if let secondtTab = mainTabBar?.viewControllers?[1] as? OrdersListViewController {
                    mainTabBar?.selectedIndex = 1
                    secondtTab.getDataFromServer()
                }
            }
        }
    }
    //    {
    //      "aps" : {
    //        "alert" : {
    //          "body" : "طلب جديد",
    //          "title" : "ProService"
    //        },
    //        "sound" : "custom.caf"
    //      },
    //      "gcm.notification.category" : "order",
    //      "gcm.notification.reference_id" : "70",
    //      "title" : "ProService",
    //      "google.c.a.e" : "1",
    //      "body" : "طلب جديد",
    //      "google.c.sender.id" : "583035444836",
    //      "sound" : "custom.caf",
    //      "google.c.fid" : "cX8u66LGKkC6pJLcx_qJk4",
    //      "reference_status" : "new",
    //      "gcm.message_id" : "1641210215499744",
    //      "gcm.notification.order_no" : "2201000004",
    //      "reference_id" : "70",
    //      "category" : "order",
    //      "gcm.notification.reference_status" : "new",
    //      "order_no" : "2201000004"
    //    }
    func notifcatonPresenting(json: JSON) {
        
    }
}

//MARK: - override Swift `print` method
public func print<T>(file: String = #file, function: String = #function, line: Int = #line, _ message: T, color: UIColor = .white) {
#if DEBUG
    Swift.print(message)
    _SwiftLogHelper.shared.handleLog(file: file, function: function, line: line, message: message, color: color)
#endif
}

//Shortcut Menu Configeration
extension AppDelegate {
    func setupShortcuts(){
        var shortcutItems = [UIApplicationShortcutItem]()
        
        shortcutItems.append(UIApplicationShortcutItem(type: "com.mja.app_info",
                                                       localizedTitle: "App Info",
                                                       localizedSubtitle: "\(Bundle.main.infoDictionary?["CFBundleShortVersionString"] ?? "-1") | (\(Bundle.main.infoDictionary?["CFBundleVersion"] ?? "-1"))",
                                                       icon: UIApplicationShortcutIcon(type: .task),
                                                       userInfo: nil))
        
        shortcutItems.append(UIApplicationShortcutItem(type: "com.mja.clear_app",
                                                       localizedTitle: "Clear App",
                                                       localizedSubtitle: "clear app data",
                                                       icon: UIApplicationShortcutIcon(type: .confirmation),
                                                       userInfo: nil))
        
        UIApplication.shared.shortcutItems = shortcutItems
    }
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        if shortcutItem.type == "com.mja.clear_app" {
            let alertController = UIAlertController(title: "Alert", message:"Do you want to clear app\nApplication will close after clearing data", preferredStyle:.alert)
            alertController.addAction(UIAlertAction(title: "App only", style:.destructive, handler: { (action) in
                if let bundleID = Bundle.main.bundleIdentifier {
                    UserDefaults.standard.removePersistentDomain(forName: bundleID)
                }
                exit(0)
            }))
            alertController.addAction(UIAlertAction(title: "App With DB", style:.destructive, handler: { (action) in
                if let bundleID = Bundle.main.bundleIdentifier {
                    UserDefaults.standard.removePersistentDomain(forName: bundleID)
                }
                do {
                    let storeUrl = URL(string:String(format: "\(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0])%@.sqlite", GlobalConstants.DataBaseName) )
                    try FileManager.default.removeItem(at: storeUrl!)
                    exit(0)
                } catch {
                    print("Could not delete file: \(error)")
                    exit(0)
                }
            }))
            alertController.addAction(UIAlertAction(title: "Cancel", style:.cancel, handler: { (action) in
                
            }))
            self.window?.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
}
