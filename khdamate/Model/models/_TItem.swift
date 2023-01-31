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

public enum TItemAttributes: String {
   case b_assgined_to_driver
   case i_order_no
   case pk_i_id
   case s_created_at
   case s_order_status
   case s_order_type
   case s_service_provider_image
   case s_service_provider_name
   case s_status
}



public class _TItem: NSManagedObject {
   public class var entityName: String {
      return "TItem"
   }

   @objc @NSManaged public var b_assgined_to_driver: NSNumber?
   @objc @NSManaged public var i_order_no: NSNumber?
   @objc @NSManaged public var pk_i_id: NSNumber?
   @objc @NSManaged public var s_created_at: String?
   @objc @NSManaged public var s_order_status: String?
   @objc @NSManaged public var s_order_type: String?
   @objc @NSManaged public var s_service_provider_image: String?
   @objc @NSManaged public var s_service_provider_name: String?
   @objc @NSManaged public var s_status: String?


   static let rKmapping : RKEntityMapping = {
        var TItemMapping = RKEntityMapping(forEntityForName: NSStringFromClass(TItem.classForCoder()), in: RKObjectManager.shared().managedObjectStore)
        TItemMapping?.addAttributeMappings(from: [
                "assgined_to_driver":"b_assgined_to_driver",
                "order_no":"i_order_no",
                "id":"pk_i_id",
                "created_at":"s_created_at",
                "order_status":"s_order_status",
                "order_type":"s_order_type",
                "picture_url":"s_service_provider_image",
                "service_provider_name":"s_service_provider_name",
                "status":"s_status",

            ])
        TItemMapping?.identificationAttributes = ["pk_i_id"]
        return TItemMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["assgined_to_driver"] = b_assgined_to_driver
        dictionary["order_no"] = i_order_no
        dictionary["id"] = pk_i_id
        dictionary["created_at"] = s_created_at
        dictionary["order_status"] = s_order_status
        dictionary["order_type"] = s_order_type
        dictionary["picture_url"] = s_service_provider_image
        dictionary["service_provider_name"] = s_service_provider_name
        dictionary["status"] = s_status


        return dictionary
    }

    func toNonDBObject() -> TItemObject {
       let obj = TItemObject()
       obj.b_assgined_to_driver = self.b_assgined_to_driver
       obj.i_order_no = self.i_order_no
       obj.pk_i_id = self.pk_i_id
       obj.s_created_at = self.s_created_at
       obj.s_order_status = self.s_order_status
       obj.s_order_type = self.s_order_type
       obj.s_service_provider_image = self.s_service_provider_image
       obj.s_service_provider_name = self.s_service_provider_name
       obj.s_status = self.s_status

       return obj
    }
    public override var description: String{
        var description: String = "<TItem: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"b_assgined_to_driver\" : \(b_assgined_to_driver?.description ?? "nil");"
        description += "\n    \"i_order_no\" : \(i_order_no?.description ?? "nil");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"s_created_at\" : \(s_created_at != nil ? "\"\(s_created_at?.description ?? "nil")\"" : "\(s_created_at?.description ?? "nil")");"
        description += "\n    \"s_order_status\" : \(s_order_status != nil ? "\"\(s_order_status?.description ?? "nil")\"" : "\(s_order_status?.description ?? "nil")");"
        description += "\n    \"s_order_type\" : \(s_order_type != nil ? "\"\(s_order_type?.description ?? "nil")\"" : "\(s_order_type?.description ?? "nil")");"
        description += "\n    \"s_service_provider_image\" : \(s_service_provider_image != nil ? "\"\(s_service_provider_image?.description ?? "nil")\"" : "\(s_service_provider_image?.description ?? "nil")");"
        description += "\n    \"s_service_provider_name\" : \(s_service_provider_name != nil ? "\"\(s_service_provider_name?.description ?? "nil")\"" : "\(s_service_provider_name?.description ?? "nil")");"
        description += "\n    \"s_status\" : \(s_status != nil ? "\"\(s_status?.description ?? "nil")\"" : "\(s_status?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TItem?) -> Bool {
        return self == object
    }
    static func == (left: _TItem, right: _TItem) -> Bool {
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
    static func demoObject()-> TItem?{
        let obj = TItem.mr_createEntity()
        obj?.b_assgined_to_driver = NSNumber(value: Randoms.randomBool())
        obj?.i_order_no = NSNumber(value: Randoms.randomInt32())
        obj?.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj?.s_created_at = Randoms.randomFakeName()
        obj?.s_order_status = Randoms.randomFakeName()
        obj?.s_order_type = Randoms.randomFakeName()
        obj?.s_service_provider_image = Randoms.randomFakeName()
        obj?.s_service_provider_name = Randoms.randomFakeName()
        obj?.s_status = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TItem]{
        var arr = [TItem]()
        for _ in 1...GlobalConstants.API_PageSize {
            if let usr = TItem.demoObject() {
                arr.append(usr)
            }
        }
        return arr
    }
    #endif

}





public class _TItemObject: NSObject {
   public class var entityName: String {
      return "TItemObject"
   }

   @objc public var b_assgined_to_driver: NSNumber?
   @objc public var i_order_no: NSNumber?
   @objc public var pk_i_id: NSNumber?
   @objc public var s_created_at: String?
   @objc public var s_order_status: String?
   @objc public var s_order_type: String?
   @objc public var s_service_provider_image: String?
   @objc public var s_service_provider_name: String?
   @objc public var s_status: String?


   static let rKmapping : RKObjectMapping = {
        var TItemObjectMapping = RKObjectMapping(for: TItemObject.classForCoder())
        TItemObjectMapping?.addAttributeMappings(from: [
                "assgined_to_driver":"b_assgined_to_driver",
                "order_no":"i_order_no",
                "id":"pk_i_id",
                "created_at":"s_created_at",
                "order_status":"s_order_status",
                "order_type":"s_order_type",
                "picture_url":"s_service_provider_image",
                "service_provider_name":"s_service_provider_name",
                "status":"s_status",

            ])
        return TItemObjectMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["assgined_to_driver"] = b_assgined_to_driver
        dictionary["order_no"] = i_order_no
        dictionary["id"] = pk_i_id
        dictionary["created_at"] = s_created_at
        dictionary["order_status"] = s_order_status
        dictionary["order_type"] = s_order_type
        dictionary["picture_url"] = s_service_provider_image
        dictionary["service_provider_name"] = s_service_provider_name
        dictionary["status"] = s_status


        return dictionary
    }

    public override var description: String{
        var description: String = "<TItemObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"b_assgined_to_driver\" : \(b_assgined_to_driver?.description ?? "nil");"
        description += "\n    \"i_order_no\" : \(i_order_no?.description ?? "nil");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"s_created_at\" : \(s_created_at != nil ? "\"\(s_created_at?.description ?? "nil")\"" : "\(s_created_at?.description ?? "nil")");"
        description += "\n    \"s_order_status\" : \(s_order_status != nil ? "\"\(s_order_status?.description ?? "nil")\"" : "\(s_order_status?.description ?? "nil")");"
        description += "\n    \"s_order_type\" : \(s_order_type != nil ? "\"\(s_order_type?.description ?? "nil")\"" : "\(s_order_type?.description ?? "nil")");"
        description += "\n    \"s_service_provider_image\" : \(s_service_provider_image != nil ? "\"\(s_service_provider_image?.description ?? "nil")\"" : "\(s_service_provider_image?.description ?? "nil")");"
        description += "\n    \"s_service_provider_name\" : \(s_service_provider_name != nil ? "\"\(s_service_provider_name?.description ?? "nil")\"" : "\(s_service_provider_name?.description ?? "nil")");"
        description += "\n    \"s_status\" : \(s_status != nil ? "\"\(s_status?.description ?? "nil")\"" : "\(s_status?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TItemObject?) -> Bool {
        return self == object
    }
    static func == (left: _TItemObject, right: _TItemObject) -> Bool {
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
    static func demoObject()-> TItemObject{
        let obj = TItemObject()
        obj.b_assgined_to_driver = NSNumber(value: Randoms.randomBool())
        obj.i_order_no = NSNumber(value: Randoms.randomInt32())
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.s_created_at = Randoms.randomFakeName()
        obj.s_order_status = Randoms.randomFakeName()
        obj.s_order_type = Randoms.randomFakeName()
        obj.s_service_provider_image = Randoms.randomFakeName()
        obj.s_service_provider_name = Randoms.randomFakeName()
        obj.s_status = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TItemObject]{
        var arr = [TItemObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TItemObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}


#elseif canImport(Alamofire)
public class _TItemObject: NSObject,NSCoding,NSCopying {
    @objc public var b_assgined_to_driver: NSNumber?
    @objc public var i_order_no: NSNumber?
    @objc public var pk_i_id: NSNumber?
    @objc public var s_created_at: String?
    @objc public var s_order_status: String?
    @objc public var s_order_type: String?
    @objc public var s_service_provider_image: String?
    @objc public var s_service_provider_name: String?
    @objc public var s_status: String?


    init(fromDictionary dictionary: NSDictionary){
        b_assgined_to_driver = dictionary.value(forKeyPath: "assgined_to_driver") as? NSNumber
        i_order_no = dictionary.value(forKeyPath: "order_no") as? NSNumber
        pk_i_id = dictionary.value(forKeyPath: "id") as? NSNumber
        s_created_at = dictionary.value(forKeyPath: "created_at") as? String
        s_order_status = dictionary.value(forKeyPath: "order_status") as? String
        s_order_type = dictionary.value(forKeyPath: "order_type") as? String
        s_service_provider_image = dictionary.value(forKeyPath: "picture_url") as? String
        s_service_provider_name = dictionary.value(forKeyPath: "service_provider_name") as? String
        s_status = dictionary.value(forKeyPath: "status") as? String

    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["assgined_to_driver"] = b_assgined_to_driver
        dictionary["order_no"] = i_order_no
        dictionary["id"] = pk_i_id
        dictionary["created_at"] = s_created_at
        dictionary["order_status"] = s_order_status
        dictionary["order_type"] = s_order_type
        dictionary["picture_url"] = s_service_provider_image
        dictionary["service_provider_name"] = s_service_provider_name
        dictionary["status"] = s_status


        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder){
        b_assgined_to_driver = aDecoder.decodeObject(forKey:"assgined_to_driver") as? NSNumber
        i_order_no = aDecoder.decodeObject(forKey:"order_no") as? NSNumber
        pk_i_id = aDecoder.decodeObject(forKey:"id") as? NSNumber
        s_created_at = aDecoder.decodeObject(forKey:"created_at") as? String
        s_order_status = aDecoder.decodeObject(forKey:"order_status") as? String
        s_order_type = aDecoder.decodeObject(forKey:"order_type") as? String
        s_service_provider_image = aDecoder.decodeObject(forKey:"picture_url") as? String
        s_service_provider_name = aDecoder.decodeObject(forKey:"service_provider_name") as? String
        s_status = aDecoder.decodeObject(forKey:"status") as? String

    }

    @objc public func encode(with aCoder: NSCoder){
        if b_assgined_to_driver != nil{
            aCoder.encode(b_assgined_to_driver, forKey: "assgined_to_driver")
        }
        if i_order_no != nil{
            aCoder.encode(i_order_no, forKey: "order_no")
        }
        if pk_i_id != nil{
            aCoder.encode(pk_i_id, forKey: "id")
        }
        if s_created_at != nil{
            aCoder.encode(s_created_at, forKey: "created_at")
        }
        if s_order_status != nil{
            aCoder.encode(s_order_status, forKey: "order_status")
        }
        if s_order_type != nil{
            aCoder.encode(s_order_type, forKey: "order_type")
        }
        if s_service_provider_image != nil{
            aCoder.encode(s_service_provider_image, forKey: "picture_url")
        }
        if s_service_provider_name != nil{
            aCoder.encode(s_service_provider_name, forKey: "service_provider_name")
        }
        if s_status != nil{
            aCoder.encode(s_status, forKey: "status")
        }

    }
    public func copy(with zone: NSZone? = nil) -> Any {
        return TItemObject(fromDictionary: self.toDictionary() as NSDictionary)
    }
    public override var description: String{
        var description: String = "<TItemObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"b_assgined_to_driver\" : \(b_assgined_to_driver?.description ?? "nil");"
        description += "\n    \"i_order_no\" : \(i_order_no?.description ?? "nil");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"s_created_at\" : \(s_created_at != nil ? "\"\(s_created_at?.description ?? "nil")\"" : "\(s_created_at?.description ?? "nil")");"
        description += "\n    \"s_order_status\" : \(s_order_status != nil ? "\"\(s_order_status?.description ?? "nil")\"" : "\(s_order_status?.description ?? "nil")");"
        description += "\n    \"s_order_type\" : \(s_order_type != nil ? "\"\(s_order_type?.description ?? "nil")\"" : "\(s_order_type?.description ?? "nil")");"
        description += "\n    \"s_service_provider_image\" : \(s_service_provider_image != nil ? "\"\(s_service_provider_image?.description ?? "nil")\"" : "\(s_service_provider_image?.description ?? "nil")");"
        description += "\n    \"s_service_provider_name\" : \(s_service_provider_name != nil ? "\"\(s_service_provider_name?.description ?? "nil")\"" : "\(s_service_provider_name?.description ?? "nil")");"
        description += "\n    \"s_status\" : \(s_status != nil ? "\"\(s_status?.description ?? "nil")\"" : "\(s_status?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TItemObject?) -> Bool {
        return self == object
    }
    static func == (left: _TItemObject, right: _TItemObject) -> Bool {
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
    static func demoObject()-> TItemObject{
        let obj = TItemObject(fromDictionary: ["":""])
        obj.b_assgined_to_driver = NSNumber(value: Randoms.randomBool())
        obj.i_order_no = NSNumber(value: Randoms.randomInt32())
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.s_created_at = Randoms.randomFakeName()
        obj.s_order_status = Randoms.randomFakeName()
        obj.s_order_type = Randoms.randomFakeName()
        obj.s_service_provider_image = Randoms.randomFakeName()
        obj.s_service_provider_name = Randoms.randomFakeName()
        obj.s_status = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TItemObject]{
        var arr = [TItemObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TItemObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}

#endif

/************************* Mo’min J.Abusaada *************************/
