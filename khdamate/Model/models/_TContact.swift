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

public enum TContactAttributes: String {
   case email
   case facebook
   case phone
   case pk_i_id
   case twitter
}



public class _TContact: NSManagedObject {
   public class var entityName: String {
      return "TContact"
   }

   @objc @NSManaged public var email: String?
   @objc @NSManaged public var facebook: String?
   @objc @NSManaged public var phone: String?
   @objc @NSManaged public var pk_i_id: NSNumber?
   @objc @NSManaged public var twitter: String?


   static let rKmapping : RKEntityMapping = {
        var TContactMapping = RKEntityMapping(forEntityForName: NSStringFromClass(TContact.classForCoder()), in: RKObjectManager.shared().managedObjectStore)
        TContactMapping?.addAttributeMappings(from: [
                "email":"email",
                "facebook":"facebook",
                "phone":"phone",
                "id":"pk_i_id",
                "twitter":"twitter",

            ])
        TContactMapping?.identificationAttributes = ["pk_i_id"]
        return TContactMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["email"] = email
        dictionary["facebook"] = facebook
        dictionary["phone"] = phone
        dictionary["id"] = pk_i_id
        dictionary["twitter"] = twitter


        return dictionary
    }

    func toNonDBObject() -> TContactObject {
       let obj = TContactObject()
       obj.email = self.email
       obj.facebook = self.facebook
       obj.phone = self.phone
       obj.pk_i_id = self.pk_i_id
       obj.twitter = self.twitter

       return obj
    }
    public override var description: String{
        var description: String = "<TContact: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"email\" : \(email != nil ? "\"\(email?.description ?? "nil")\"" : "\(email?.description ?? "nil")");"
        description += "\n    \"facebook\" : \(facebook != nil ? "\"\(facebook?.description ?? "nil")\"" : "\(facebook?.description ?? "nil")");"
        description += "\n    \"phone\" : \(phone != nil ? "\"\(phone?.description ?? "nil")\"" : "\(phone?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"twitter\" : \(twitter != nil ? "\"\(twitter?.description ?? "nil")\"" : "\(twitter?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TContact?) -> Bool {
        return self == object
    }
    static func == (left: _TContact, right: _TContact) -> Bool {
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
    static func demoObject()-> TContact?{
        let obj = TContact.mr_createEntity()
        obj?.email = Randoms.randomFakeName()
        obj?.facebook = Randoms.randomFakeName()
        obj?.phone = Randoms.randomFakeName()
        obj?.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj?.twitter = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TContact]{
        var arr = [TContact]()
        for _ in 1...GlobalConstants.API_PageSize {
            if let usr = TContact.demoObject() {
                arr.append(usr)
            }
        }
        return arr
    }
    #endif

}





public class _TContactObject: NSObject {
   public class var entityName: String {
      return "TContactObject"
   }

   @objc public var email: String?
   @objc public var facebook: String?
   @objc public var phone: String?
   @objc public var pk_i_id: NSNumber?
   @objc public var twitter: String?


   static let rKmapping : RKObjectMapping = {
        var TContactObjectMapping = RKObjectMapping(for: TContactObject.classForCoder())
        TContactObjectMapping?.addAttributeMappings(from: [
                "email":"email",
                "facebook":"facebook",
                "phone":"phone",
                "id":"pk_i_id",
                "twitter":"twitter",

            ])
        return TContactObjectMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["email"] = email
        dictionary["facebook"] = facebook
        dictionary["phone"] = phone
        dictionary["id"] = pk_i_id
        dictionary["twitter"] = twitter


        return dictionary
    }

    public override var description: String{
        var description: String = "<TContactObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"email\" : \(email != nil ? "\"\(email?.description ?? "nil")\"" : "\(email?.description ?? "nil")");"
        description += "\n    \"facebook\" : \(facebook != nil ? "\"\(facebook?.description ?? "nil")\"" : "\(facebook?.description ?? "nil")");"
        description += "\n    \"phone\" : \(phone != nil ? "\"\(phone?.description ?? "nil")\"" : "\(phone?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"twitter\" : \(twitter != nil ? "\"\(twitter?.description ?? "nil")\"" : "\(twitter?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TContactObject?) -> Bool {
        return self == object
    }
    static func == (left: _TContactObject, right: _TContactObject) -> Bool {
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
    static func demoObject()-> TContactObject{
        let obj = TContactObject()
        obj.email = Randoms.randomFakeName()
        obj.facebook = Randoms.randomFakeName()
        obj.phone = Randoms.randomFakeName()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.twitter = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TContactObject]{
        var arr = [TContactObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TContactObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}


#elseif canImport(Alamofire)
public class _TContactObject: NSObject,NSCoding,NSCopying {
    @objc public var email: String?
    @objc public var facebook: String?
    @objc public var phone: String?
    @objc public var pk_i_id: NSNumber?
    @objc public var twitter: String?


    init(fromDictionary dictionary: NSDictionary){
        email = dictionary.value(forKeyPath: "email") as? String
        facebook = dictionary.value(forKeyPath: "facebook") as? String
        phone = dictionary.value(forKeyPath: "phone") as? String
        pk_i_id = dictionary.value(forKeyPath: "id") as? NSNumber
        twitter = dictionary.value(forKeyPath: "twitter") as? String

    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["email"] = email
        dictionary["facebook"] = facebook
        dictionary["phone"] = phone
        dictionary["id"] = pk_i_id
        dictionary["twitter"] = twitter


        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder){
        email = aDecoder.decodeObject(forKey:"email") as? String
        facebook = aDecoder.decodeObject(forKey:"facebook") as? String
        phone = aDecoder.decodeObject(forKey:"phone") as? String
        pk_i_id = aDecoder.decodeObject(forKey:"id") as? NSNumber
        twitter = aDecoder.decodeObject(forKey:"twitter") as? String

    }

    @objc public func encode(with aCoder: NSCoder){
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if facebook != nil{
            aCoder.encode(facebook, forKey: "facebook")
        }
        if phone != nil{
            aCoder.encode(phone, forKey: "phone")
        }
        if pk_i_id != nil{
            aCoder.encode(pk_i_id, forKey: "id")
        }
        if twitter != nil{
            aCoder.encode(twitter, forKey: "twitter")
        }

    }
    public func copy(with zone: NSZone? = nil) -> Any {
        return TContactObject(fromDictionary: self.toDictionary() as NSDictionary)
    }
    public override var description: String{
        var description: String = "<TContactObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"email\" : \(email != nil ? "\"\(email?.description ?? "nil")\"" : "\(email?.description ?? "nil")");"
        description += "\n    \"facebook\" : \(facebook != nil ? "\"\(facebook?.description ?? "nil")\"" : "\(facebook?.description ?? "nil")");"
        description += "\n    \"phone\" : \(phone != nil ? "\"\(phone?.description ?? "nil")\"" : "\(phone?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"twitter\" : \(twitter != nil ? "\"\(twitter?.description ?? "nil")\"" : "\(twitter?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TContactObject?) -> Bool {
        return self == object
    }
    static func == (left: _TContactObject, right: _TContactObject) -> Bool {
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
    static func demoObject()-> TContactObject{
        let obj = TContactObject(fromDictionary: ["":""])
        obj.email = Randoms.randomFakeName()
        obj.facebook = Randoms.randomFakeName()
        obj.phone = Randoms.randomFakeName()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.twitter = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TContactObject]{
        var arr = [TContactObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TContactObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}

#endif

/************************* Mo’min J.Abusaada *************************/
