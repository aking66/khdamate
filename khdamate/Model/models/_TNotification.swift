/************************* Mo’min J.Abusaada *************************/
// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to  instead.

#if canImport(SwiftRandom)
import SwiftRandom
#endif

#if canImport(RestKit)

import Foundation
import CoreData
import RestKit

public enum TNotificationAttributes: String {
   case category
   case date_time
   case is_read
   case notification_body
   case pk_i_id
   case reference_id
   case reference_status
   case reference_status_trans
}



public class _TNotification: NSManagedObject {
   public class var entityName: String {
      return "TNotification"
   }

   @objc @NSManaged public var category: String?
   @objc @NSManaged public var date_time: NSDate?
   @objc @NSManaged public var is_read: NSNumber?
   @objc @NSManaged public var notification_body: String?
   @objc @NSManaged public var pk_i_id: NSNumber?
   @objc @NSManaged public var reference_id: NSNumber?
   @objc @NSManaged public var reference_status: String?
   @objc @NSManaged public var reference_status_trans: String?


   static let rKmapping : RKEntityMapping = {
        var TNotificationMapping = RKEntityMapping(forEntityForName: NSStringFromClass(TNotification.classForCoder()), in: RKObjectManager.shared().managedObjectStore)
        TNotificationMapping?.addAttributeMappings(from: [
                "category":"category",
                "date_time":"date_time",
                "is_read":"is_read",
                "notification_body":"notification_body",
                "id":"pk_i_id",
                "reference_id":"reference_id",
                "reference_status":"reference_status",
                "reference_status_trans":"reference_status_trans",

            ])
        TNotificationMapping?.identificationAttributes = ["pk_i_id"]
        return TNotificationMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["category"] = category
        dictionary["date_time"] = date_time
        dictionary["is_read"] = is_read
        dictionary["notification_body"] = notification_body
        dictionary["id"] = pk_i_id
        dictionary["reference_id"] = reference_id
        dictionary["reference_status"] = reference_status
        dictionary["reference_status_trans"] = reference_status_trans


        return dictionary
    }

    func toNonDBObject() -> TNotificationObject {
       let obj = TNotificationObject()
       obj.category = self.category
       obj.date_time = self.date_time
       obj.is_read = self.is_read
       obj.notification_body = self.notification_body
       obj.pk_i_id = self.pk_i_id
       obj.reference_id = self.reference_id
       obj.reference_status = self.reference_status
       obj.reference_status_trans = self.reference_status_trans

       return obj
    }
    public override var description: String{
        var description: String = "<TNotification: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"category\" : \(category != nil ? "\"\(category?.description ?? "nil")\"" : "\(category?.description ?? "nil")");"
        description += "\n    \"date_time\" : \(date_time != nil ? "\"\(date_time?.description ?? "nil")\"" : "\(date_time?.description ?? "nil")");"
        description += "\n    \"is_read\" : \(is_read?.description ?? "nil");"
        description += "\n    \"notification_body\" : \(notification_body != nil ? "\"\(notification_body?.description ?? "nil")\"" : "\(notification_body?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"reference_id\" : \(reference_id?.description ?? "nil");"
        description += "\n    \"reference_status\" : \(reference_status != nil ? "\"\(reference_status?.description ?? "nil")\"" : "\(reference_status?.description ?? "nil")");"
        description += "\n    \"reference_status_trans\" : \(reference_status_trans != nil ? "\"\(reference_status_trans?.description ?? "nil")\"" : "\(reference_status_trans?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TNotification?) -> Bool {
        return self == object
    }
    static func == (left: _TNotification, right: _TNotification) -> Bool {
        if left.pk_i_id == nil {
            return false
        }
        if left.pk_i_id is NSNumber {
            return (left.pk_i_id as? NSNumber)?.intValue == (right.pk_i_id as? NSNumber)?.intValue
        }else{
           return left.pk_i_id == right.pk_i_id
        }
    }

    #if canImport(SwiftRandom)
    static func demoObject()-> TNotification?{
        let obj = TNotification.mr_createEntity()
        obj?.category = Randoms.randomFakeName()
        obj?.date_time = Randoms.randomDate() as NSDate
        obj?.is_read = NSNumber(value: Randoms.randomBool())
        obj?.notification_body = Randoms.randomFakeName()
        obj?.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj?.reference_id = NSNumber(value: Randoms.randomInt32())
        obj?.reference_status = Randoms.randomFakeName()
        obj?.reference_status_trans = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TNotification]{
        var arr = [TNotification]()
        for _ in 1...GlobalConstants.API_PageSize {
            if let usr = TNotification.demoObject() {
                arr.append(usr)
            }
        }
        return arr
    }
    #endif

}





public class _TNotificationObject: NSObject {
   public class var entityName: String {
      return "TNotificationObject"
   }

   @objc public var category: String?
   @objc public var date_time: NSDate?
   @objc public var is_read: NSNumber?
   @objc public var notification_body: String?
   @objc public var pk_i_id: NSNumber?
   @objc public var reference_id: NSNumber?
   @objc public var reference_status: String?
   @objc public var reference_status_trans: String?


   static let rKmapping : RKObjectMapping = {
        var TNotificationObjectMapping = RKObjectMapping(for: TNotificationObject.classForCoder())
        TNotificationObjectMapping?.addAttributeMappings(from: [
                "category":"category",
                "date_time":"date_time",
                "is_read":"is_read",
                "notification_body":"notification_body",
                "id":"pk_i_id",
                "reference_id":"reference_id",
                "reference_status":"reference_status",
                "reference_status_trans":"reference_status_trans",

            ])
        return TNotificationObjectMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["category"] = category
        dictionary["date_time"] = date_time
        dictionary["is_read"] = is_read
        dictionary["notification_body"] = notification_body
        dictionary["id"] = pk_i_id
        dictionary["reference_id"] = reference_id
        dictionary["reference_status"] = reference_status
        dictionary["reference_status_trans"] = reference_status_trans


        return dictionary
    }

    public override var description: String{
        var description: String = "<TNotificationObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"category\" : \(category != nil ? "\"\(category?.description ?? "nil")\"" : "\(category?.description ?? "nil")");"
        description += "\n    \"date_time\" : \(date_time != nil ? "\"\(date_time?.description ?? "nil")\"" : "\(date_time?.description ?? "nil")");"
        description += "\n    \"is_read\" : \(is_read?.description ?? "nil");"
        description += "\n    \"notification_body\" : \(notification_body != nil ? "\"\(notification_body?.description ?? "nil")\"" : "\(notification_body?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"reference_id\" : \(reference_id?.description ?? "nil");"
        description += "\n    \"reference_status\" : \(reference_status != nil ? "\"\(reference_status?.description ?? "nil")\"" : "\(reference_status?.description ?? "nil")");"
        description += "\n    \"reference_status_trans\" : \(reference_status_trans != nil ? "\"\(reference_status_trans?.description ?? "nil")\"" : "\(reference_status_trans?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TNotificationObject?) -> Bool {
        return self == object
    }
    static func == (left: _TNotificationObject, right: _TNotificationObject) -> Bool {
        if left.pk_i_id == nil {
            return false
        }
        if left.pk_i_id is NSNumber {
            return (left.pk_i_id as? NSNumber)?.intValue == (right.pk_i_id as? NSNumber)?.intValue
        }else{
           return left.pk_i_id == right.pk_i_id
        }
    }

    #if canImport(SwiftRandom)
    static func demoObject()-> TNotificationObject{
        let obj = TNotificationObject()
        obj.category = Randoms.randomFakeName()
        obj.date_time = Randoms.randomDate() as NSDate
        obj.is_read = NSNumber(value: Randoms.randomBool())
        obj.notification_body = Randoms.randomFakeName()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.reference_id = NSNumber(value: Randoms.randomInt32())
        obj.reference_status = Randoms.randomFakeName()
        obj.reference_status_trans = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TNotificationObject]{
        var arr = [TNotificationObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TNotificationObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}


#elseif canImport(Alamofire)
public class _TNotificationObject: NSObject,NSCoding,NSCopying {
    @objc public var category: String?
    @objc public var date_time: NSDate?
    @objc public var is_read: NSNumber?
    @objc public var notification_body: String?
    @objc public var pk_i_id: NSNumber?
    @objc public var reference_id: NSNumber?
    @objc public var reference_status: String?
    @objc public var reference_status_trans: String?


    init(fromDictionary dictionary: NSDictionary){
        category = dictionary.value(forKeyPath: "category") as? String
        date_time = NSDate.mapperDateFormatter.formats(fromString:dictionary.value(forKeyPath: "date_time")  as? String)
        is_read = dictionary.value(forKeyPath: "is_read") as? NSNumber
        notification_body = dictionary.value(forKeyPath: "notification_body") as? String
        pk_i_id = dictionary.value(forKeyPath: "id") as? NSNumber
        reference_id = dictionary.value(forKeyPath: "reference_id") as? NSNumber
        reference_status = dictionary.value(forKeyPath: "reference_status") as? String
        reference_status_trans = dictionary.value(forKeyPath: "reference_status_trans") as? String

    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["category"] = category
        dictionary["date_time"] = date_time
        dictionary["is_read"] = is_read
        dictionary["notification_body"] = notification_body
        dictionary["id"] = pk_i_id
        dictionary["reference_id"] = reference_id
        dictionary["reference_status"] = reference_status
        dictionary["reference_status_trans"] = reference_status_trans


        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder){
        category = aDecoder.decodeObject(forKey:"category") as? String
        date_time = aDecoder.decodeObject(forKey:"date_time") as? NSDate
        is_read = aDecoder.decodeObject(forKey:"is_read") as? NSNumber
        notification_body = aDecoder.decodeObject(forKey:"notification_body") as? String
        pk_i_id = aDecoder.decodeObject(forKey:"id") as? NSNumber
        reference_id = aDecoder.decodeObject(forKey:"reference_id") as? NSNumber
        reference_status = aDecoder.decodeObject(forKey:"reference_status") as? String
        reference_status_trans = aDecoder.decodeObject(forKey:"reference_status_trans") as? String

    }

    @objc public func encode(with aCoder: NSCoder){
        if category != nil{
            aCoder.encode(category, forKey: "category")
        }
        if date_time != nil{
            aCoder.encode(date_time, forKey: "date_time")
        }
        if is_read != nil{
            aCoder.encode(is_read, forKey: "is_read")
        }
        if notification_body != nil{
            aCoder.encode(notification_body, forKey: "notification_body")
        }
        if pk_i_id != nil{
            aCoder.encode(pk_i_id, forKey: "id")
        }
        if reference_id != nil{
            aCoder.encode(reference_id, forKey: "reference_id")
        }
        if reference_status != nil{
            aCoder.encode(reference_status, forKey: "reference_status")
        }
        if reference_status_trans != nil{
            aCoder.encode(reference_status_trans, forKey: "reference_status_trans")
        }

    }
    public func copy(with zone: NSZone? = nil) -> Any {
        return TNotificationObject(fromDictionary: self.toDictionary() as NSDictionary)
    }
    public override var description: String{
        var description: String = "<TNotificationObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"category\" : \(category != nil ? "\"\(category?.description ?? "nil")\"" : "\(category?.description ?? "nil")");"
        description += "\n    \"date_time\" : \(date_time != nil ? "\"\(date_time?.description ?? "nil")\"" : "\(date_time?.description ?? "nil")");"
        description += "\n    \"is_read\" : \(is_read?.description ?? "nil");"
        description += "\n    \"notification_body\" : \(notification_body != nil ? "\"\(notification_body?.description ?? "nil")\"" : "\(notification_body?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"reference_id\" : \(reference_id?.description ?? "nil");"
        description += "\n    \"reference_status\" : \(reference_status != nil ? "\"\(reference_status?.description ?? "nil")\"" : "\(reference_status?.description ?? "nil")");"
        description += "\n    \"reference_status_trans\" : \(reference_status_trans != nil ? "\"\(reference_status_trans?.description ?? "nil")\"" : "\(reference_status_trans?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TNotificationObject?) -> Bool {
        return self == object
    }
    static func == (left: _TNotificationObject, right: _TNotificationObject) -> Bool {
        if left.pk_i_id == nil {
            return false
        }
        if left.pk_i_id is NSNumber {
            return (left.pk_i_id as? NSNumber)?.intValue == (right.pk_i_id as? NSNumber)?.intValue
        }else{
           return left.pk_i_id == right.pk_i_id
        }
    }

    #if canImport(SwiftRandom)
    static func demoObject()-> TNotificationObject{
        let obj = TNotificationObject(fromDictionary: ["":""])
        obj.category = Randoms.randomFakeName()
        obj.date_time = Randoms.randomDate() as NSDate
        obj.is_read = NSNumber(value: Randoms.randomBool())
        obj.notification_body = Randoms.randomFakeName()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.reference_id = NSNumber(value: Randoms.randomInt32())
        obj.reference_status = Randoms.randomFakeName()
        obj.reference_status_trans = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TNotificationObject]{
        var arr = [TNotificationObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TNotificationObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}

#endif

/************************* Mo’min J.Abusaada *************************/
