/************************* Mo’min J.Abusaada *************************/
//
//  BaseModel.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//



import UIKit

#if canImport(Alamofire)
import Alamofire

class BaseModel: NSObject {
    static let sharedInstance = BaseModel()
    
    func requestsHeadrs() -> [String: String] {
        var dic : [String: String] = [:]
        dic["Content-Language"] = UserProfile.sharedInstance.isRTL() == true ? "ar" : "en"
        dic["device-os"] = "ios"
        if let token = UserProfile.sharedInstance.currentUserToken {
            dic["Authorization"] = "Bearer \(token)"
        }
        return dic
    }
}
#elseif canImport(RestKit)

import RestKit
import MagicalRecord

@objcMembers
class BaseModel: NSObject {
    static let sharedInstance = BaseModel()
    
    func updateHeadrs() -> Void {
        RKObjectManager.shared().httpClient.setDefaultHeader("lang", value: "ar")
        
        RKObjectManager.shared().httpClient.setDefaultHeader("Content-Type", value: "application/json")
    }
    
    func modelSetup (){
        let options = [NSSQLitePragmasOption:["journal_mode":"DELETE",
                                              NSInferMappingModelAutomaticallyOption:Int(true),
                                              NSMigratePersistentStoresAutomaticallyOption:Int(true)]]
        
        let storeUrl = URL(string:String(format: "\(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0])/%@.sqlite", GlobalConstants.DataBaseName) )
        
        var modelURL = URL(fileURLWithPath: Bundle.main.path(forResource: GlobalConstants.DataBaseName, ofType: "momd")!)
        var managedObjectModel = NSManagedObjectModel(contentsOf: modelURL)
        
        var managedObjectStore = RKManagedObjectStore(managedObjectModel:managedObjectModel)
        managedObjectStore?.createPersistentStoreCoordinator()
        do {
            try managedObjectStore?.persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeUrl, options: options)
        } catch {
            do {
                try FileManager.default.removeItem(at: storeUrl!)
                if let bundleID = Bundle.main.bundleIdentifier {
                    UserDefaults.standard.removePersistentDomain(forName: bundleID)
                }
                modelURL = URL(fileURLWithPath: Bundle.main.path(forResource: GlobalConstants.DataBaseName, ofType: "momd")!)
                managedObjectModel = NSManagedObjectModel(contentsOf: modelURL)
                
                managedObjectStore = RKManagedObjectStore(managedObjectModel:managedObjectModel)
                managedObjectStore?.createPersistentStoreCoordinator()
                do {
                    try managedObjectStore?.persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeUrl, options: options)
                } catch {
                    fatalError("Error migrating store: \(error)")
                }
            } catch {
                print("Could not delete file: \(error)")
            }
        }
        managedObjectStore?.createManagedObjectContexts()
        
        
        
        NSPersistentStoreCoordinator.mr_setDefaultStoreCoordinator(managedObjectStore?.persistentStoreCoordinator)
        NSManagedObjectContext.mr_setRootSaving(managedObjectStore?.persistentStoreManagedObjectContext)
        NSManagedObjectContext.mr_setDefaultContext(managedObjectStore?.mainQueueManagedObjectContext)
        
        let objectManager = RKObjectManager(baseURL: URL(string: GlobalConstants.APIUrl))
        RKObjectManager.setShared(objectManager)
        objectManager?.managedObjectStore = managedObjectStore
        //        objectManager?.requestSerializationMIMEType = RKMIMETypeJSON
        
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        dateFormatter2.timeZone   = NSTimeZone(name: "Asia/Riyadh")! as TimeZone
        dateFormatter2.locale     = Locale(identifier : "en_US_POSIX")
        RKObjectMapping.addDefaultDateFormatter(dateFormatter2)
        RKValueTransformer.defaultValueTransformer().insert(dateFormatter2, at: 0)
        
//        RKlcl_configure_by_name("RestKit/Network", RKlcl_vTrace.rawValue);
//        RKlcl_configure_by_name("RestKit/ObjectMapping", RKlcl_vInfo.rawValue);
        
        self.updateHeadrs()
        
        let responseMapping = BaseResponse.prepareMapping()
        RKObjectManager.shared()?.addResponseDescriptors(from: [
            RKResponseDescriptor(mapping: responseMapping, method: RKRequestMethod.any, pathPattern: nil, keyPath: nil, statusCodes: RKStatusCodeIndexSetForClass(RKStatusCodeClass.successful))
            ,RKResponseDescriptor(mapping: responseMapping, method: RKRequestMethod.any , pathPattern: nil, keyPath: nil, statusCodes: RKStatusCodeIndexSetForClass(RKStatusCodeClass.serverError))
            ])
        
//        self.logCoredataOperations()
    }
}
extension BaseModel {
    func logCoredataOperations(){
        NotificationCenter.default.addObserver(self, selector: #selector(managedObjectContextObjectsDidChange), name: NSNotification.Name.NSManagedObjectContextObjectsDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(managedObjectContextObjectsWillSave), name: NSNotification.Name.NSManagedObjectContextWillSave, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(managedObjectContextObjectsDidSave), name: NSNotification.Name.NSManagedObjectContextDidSave, object: nil)
    }
    @objc func managedObjectContextObjectsDidChange(notification: NSNotification){
        self.printManagedObjectContextObjectsChanges(notification: notification, type: "DidChange")
    }
    @objc func managedObjectContextObjectsWillSave(notification: NSNotification){
        self.printManagedObjectContextObjectsChanges(notification: notification, type: "WillSave")
    }
    @objc func managedObjectContextObjectsDidSave(notification: NSNotification){
        self.printManagedObjectContextObjectsChanges(notification: notification, type: "DidSave")
    }
    func printManagedObjectContextObjectsChanges(notification: NSNotification,type:String){
        guard let userInfo = notification.userInfo else { return }
        if let inserts = userInfo[NSInsertedObjectsKey] {
            print("\n\n\n\n")
            print("\(type)")
            print("************************** inserts **************************")
            print(inserts)
            print("************************** inserts **************************")
            print("\n\n\n\n")
        }
        if let updates = userInfo[NSUpdatedObjectsKey]{
            print("\n\n\n\n")
            print("\(type)")
            print("************************** updates **************************")
            print(updates)
            print("************************** updates **************************")
            print("\n\n\n\n")
            
        }
        if let deletes = userInfo[NSDeletedObjectsKey]{
            print("\n\n\n\n")
            print("\(type)")
            print("************************** deletes **************************")
            print(deletes)
            print("************************** deletes **************************")
            print("\n\n\n\n")
        }
    }
}
#endif
