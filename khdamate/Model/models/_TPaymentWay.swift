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

public enum TPaymentWayAttributes: String {
   case b_online
   case pk_i_id
   case s_descriptions
   case s_image
   case s_name
   case s_type
}



public class _TPaymentWay: NSManagedObject {
   public class var entityName: String {
      return "TPaymentWay"
   }

   @objc @NSManaged public var b_online: NSNumber?
   @objc @NSManaged public var pk_i_id: NSNumber?
   @objc @NSManaged public var s_descriptions: String?
   @objc @NSManaged public var s_image: String?
   @objc @NSManaged public var s_name: String?
   @objc @NSManaged public var s_type: String?


   static let rKmapping : RKEntityMapping = {
        var TPaymentWayMapping = RKEntityMapping(forEntityForName: NSStringFromClass(TPaymentWay.classForCoder()), in: RKObjectManager.shared().managedObjectStore)
        TPaymentWayMapping?.addAttributeMappings(from: [
                "is_online":"b_online",
                "id":"pk_i_id",
                "descriptions":"s_descriptions",
                "icon_url":"s_image",
                "name":"s_name",
                "type":"s_type",

            ])
        TPaymentWayMapping?.identificationAttributes = ["pk_i_id"]
        return TPaymentWayMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["is_online"] = b_online
        dictionary["id"] = pk_i_id
        dictionary["descriptions"] = s_descriptions
        dictionary["icon_url"] = s_image
        dictionary["name"] = s_name
        dictionary["type"] = s_type


        return dictionary
    }

    func toNonDBObject() -> TPaymentWayObject {
       let obj = TPaymentWayObject()
       obj.b_online = self.b_online
       obj.pk_i_id = self.pk_i_id
       obj.s_descriptions = self.s_descriptions
       obj.s_image = self.s_image
       obj.s_name = self.s_name
       obj.s_type = self.s_type

       return obj
    }
    public override var description: String{
        var description: String = "<TPaymentWay: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"b_online\" : \(b_online?.description ?? "nil");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"s_descriptions\" : \(s_descriptions != nil ? "\"\(s_descriptions?.description ?? "nil")\"" : "\(s_descriptions?.description ?? "nil")");"
        description += "\n    \"s_image\" : \(s_image != nil ? "\"\(s_image?.description ?? "nil")\"" : "\(s_image?.description ?? "nil")");"
        description += "\n    \"s_name\" : \(s_name != nil ? "\"\(s_name?.description ?? "nil")\"" : "\(s_name?.description ?? "nil")");"
        description += "\n    \"s_type\" : \(s_type != nil ? "\"\(s_type?.description ?? "nil")\"" : "\(s_type?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TPaymentWay?) -> Bool {
        return self == object
    }
    static func == (left: _TPaymentWay, right: _TPaymentWay) -> Bool {
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
    static func demoObject()-> TPaymentWay?{
        let obj = TPaymentWay.mr_createEntity()
        obj?.b_online = NSNumber(value: Randoms.randomBool())
        obj?.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj?.s_descriptions = Randoms.randomFakeName()
        obj?.s_image = Randoms.randomFakeName()
        obj?.s_name = Randoms.randomFakeName()
        obj?.s_type = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TPaymentWay]{
        var arr = [TPaymentWay]()
        for _ in 1...GlobalConstants.API_PageSize {
            if let usr = TPaymentWay.demoObject() {
                arr.append(usr)
            }
        }
        return arr
    }
    #endif

}





public class _TPaymentWayObject: NSObject {
   public class var entityName: String {
      return "TPaymentWayObject"
   }

   @objc public var b_online: NSNumber?
   @objc public var pk_i_id: NSNumber?
   @objc public var s_descriptions: String?
   @objc public var s_image: String?
   @objc public var s_name: String?
   @objc public var s_type: String?


   static let rKmapping : RKObjectMapping = {
        var TPaymentWayObjectMapping = RKObjectMapping(for: TPaymentWayObject.classForCoder())
        TPaymentWayObjectMapping?.addAttributeMappings(from: [
                "is_online":"b_online",
                "id":"pk_i_id",
                "descriptions":"s_descriptions",
                "icon_url":"s_image",
                "name":"s_name",
                "type":"s_type",

            ])
        return TPaymentWayObjectMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["is_online"] = b_online
        dictionary["id"] = pk_i_id
        dictionary["descriptions"] = s_descriptions
        dictionary["icon_url"] = s_image
        dictionary["name"] = s_name
        dictionary["type"] = s_type


        return dictionary
    }

    public override var description: String{
        var description: String = "<TPaymentWayObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"b_online\" : \(b_online?.description ?? "nil");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"s_descriptions\" : \(s_descriptions != nil ? "\"\(s_descriptions?.description ?? "nil")\"" : "\(s_descriptions?.description ?? "nil")");"
        description += "\n    \"s_image\" : \(s_image != nil ? "\"\(s_image?.description ?? "nil")\"" : "\(s_image?.description ?? "nil")");"
        description += "\n    \"s_name\" : \(s_name != nil ? "\"\(s_name?.description ?? "nil")\"" : "\(s_name?.description ?? "nil")");"
        description += "\n    \"s_type\" : \(s_type != nil ? "\"\(s_type?.description ?? "nil")\"" : "\(s_type?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TPaymentWayObject?) -> Bool {
        return self == object
    }
    static func == (left: _TPaymentWayObject, right: _TPaymentWayObject) -> Bool {
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
    static func demoObject()-> TPaymentWayObject{
        let obj = TPaymentWayObject()
        obj.b_online = NSNumber(value: Randoms.randomBool())
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.s_descriptions = Randoms.randomFakeName()
        obj.s_image = Randoms.randomFakeName()
        obj.s_name = Randoms.randomFakeName()
        obj.s_type = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TPaymentWayObject]{
        var arr = [TPaymentWayObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TPaymentWayObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}


#elseif canImport(Alamofire)
public class _TPaymentWayObject: NSObject,NSCoding,NSCopying {
    @objc public var b_online: NSNumber?
    @objc public var pk_i_id: NSNumber?
    @objc public var s_descriptions: String?
    @objc public var s_image: String?
    @objc public var s_name: String?
    @objc public var s_type: String?


    init(fromDictionary dictionary: NSDictionary){
        b_online = dictionary.value(forKeyPath: "is_online") as? NSNumber
        pk_i_id = dictionary.value(forKeyPath: "id") as? NSNumber
        s_descriptions = dictionary.value(forKeyPath: "descriptions") as? String
        s_image = dictionary.value(forKeyPath: "icon_url") as? String
        s_name = dictionary.value(forKeyPath: "name") as? String
        s_type = dictionary.value(forKeyPath: "type") as? String

    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["is_online"] = b_online
        dictionary["id"] = pk_i_id
        dictionary["descriptions"] = s_descriptions
        dictionary["icon_url"] = s_image
        dictionary["name"] = s_name
        dictionary["type"] = s_type


        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder){
        b_online = aDecoder.decodeObject(forKey:"is_online") as? NSNumber
        pk_i_id = aDecoder.decodeObject(forKey:"id") as? NSNumber
        s_descriptions = aDecoder.decodeObject(forKey:"descriptions") as? String
        s_image = aDecoder.decodeObject(forKey:"icon_url") as? String
        s_name = aDecoder.decodeObject(forKey:"name") as? String
        s_type = aDecoder.decodeObject(forKey:"type") as? String

    }

    @objc public func encode(with aCoder: NSCoder){
        if b_online != nil{
            aCoder.encode(b_online, forKey: "is_online")
        }
        if pk_i_id != nil{
            aCoder.encode(pk_i_id, forKey: "id")
        }
        if s_descriptions != nil{
            aCoder.encode(s_descriptions, forKey: "descriptions")
        }
        if s_image != nil{
            aCoder.encode(s_image, forKey: "icon_url")
        }
        if s_name != nil{
            aCoder.encode(s_name, forKey: "name")
        }
        if s_type != nil{
            aCoder.encode(s_type, forKey: "type")
        }

    }
    public func copy(with zone: NSZone? = nil) -> Any {
        return TPaymentWayObject(fromDictionary: self.toDictionary() as NSDictionary)
    }
    public override var description: String{
        var description: String = "<TPaymentWayObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"b_online\" : \(b_online?.description ?? "nil");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"s_descriptions\" : \(s_descriptions != nil ? "\"\(s_descriptions?.description ?? "nil")\"" : "\(s_descriptions?.description ?? "nil")");"
        description += "\n    \"s_image\" : \(s_image != nil ? "\"\(s_image?.description ?? "nil")\"" : "\(s_image?.description ?? "nil")");"
        description += "\n    \"s_name\" : \(s_name != nil ? "\"\(s_name?.description ?? "nil")\"" : "\(s_name?.description ?? "nil")");"
        description += "\n    \"s_type\" : \(s_type != nil ? "\"\(s_type?.description ?? "nil")\"" : "\(s_type?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TPaymentWayObject?) -> Bool {
        return self == object
    }
    static func == (left: _TPaymentWayObject, right: _TPaymentWayObject) -> Bool {
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
    static func demoObject()-> TPaymentWayObject{
        let obj = TPaymentWayObject(fromDictionary: ["":""])
        obj.b_online = NSNumber(value: Randoms.randomBool())
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.s_descriptions = Randoms.randomFakeName()
        obj.s_image = Randoms.randomFakeName()
        obj.s_name = Randoms.randomFakeName()
        obj.s_type = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TPaymentWayObject]{
        var arr = [TPaymentWayObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TPaymentWayObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}

#endif

/************************* Mo’min J.Abusaada *************************/
