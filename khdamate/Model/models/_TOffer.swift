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

public enum TOfferAttributes: String {
   case created_at
   case notes
   case offer_price
   case pk_i_id
   case rate
   case rate_count
   case service_price
   case service_provider_name
}



public class _TOffer: NSManagedObject {
   public class var entityName: String {
      return "TOffer"
   }

   @objc @NSManaged public var created_at: String?
   @objc @NSManaged public var notes: String?
   @objc @NSManaged public var offer_price: NSNumber?
   @objc @NSManaged public var pk_i_id: NSNumber?
   @objc @NSManaged public var rate: NSNumber?
   @objc @NSManaged public var rate_count: NSNumber?
   @objc @NSManaged public var service_price: NSNumber?
   @objc @NSManaged public var service_provider_name: String?


   static let rKmapping : RKEntityMapping = {
        var TOfferMapping = RKEntityMapping(forEntityForName: NSStringFromClass(TOffer.classForCoder()), in: RKObjectManager.shared().managedObjectStore)
        TOfferMapping?.addAttributeMappings(from: [
                "created_at":"created_at",
                "notes":"notes",
                "offer_price":"offer_price",
                "id":"pk_i_id",
                "rate":"rate",
                "rate_count":"rate_count",
                "service_price":"service_price",
                "service_provider_name":"service_provider_name",

            ])
        TOfferMapping?.identificationAttributes = ["pk_i_id"]
        return TOfferMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["created_at"] = created_at
        dictionary["notes"] = notes
        dictionary["offer_price"] = offer_price
        dictionary["id"] = pk_i_id
        dictionary["rate"] = rate
        dictionary["rate_count"] = rate_count
        dictionary["service_price"] = service_price
        dictionary["service_provider_name"] = service_provider_name


        return dictionary
    }

    func toNonDBObject() -> TOfferObject {
       let obj = TOfferObject()
       obj.created_at = self.created_at
       obj.notes = self.notes
       obj.offer_price = self.offer_price
       obj.pk_i_id = self.pk_i_id
       obj.rate = self.rate
       obj.rate_count = self.rate_count
       obj.service_price = self.service_price
       obj.service_provider_name = self.service_provider_name

       return obj
    }
    public override var description: String{
        var description: String = "<TOffer: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"created_at\" : \(created_at != nil ? "\"\(created_at?.description ?? "nil")\"" : "\(created_at?.description ?? "nil")");"
        description += "\n    \"notes\" : \(notes != nil ? "\"\(notes?.description ?? "nil")\"" : "\(notes?.description ?? "nil")");"
        description += "\n    \"offer_price\" : \(offer_price?.description ?? "nil");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"rate\" : \(rate?.description ?? "nil");"
        description += "\n    \"rate_count\" : \(rate_count?.description ?? "nil");"
        description += "\n    \"service_price\" : \(service_price?.description ?? "nil");"
        description += "\n    \"service_provider_name\" : \(service_provider_name != nil ? "\"\(service_provider_name?.description ?? "nil")\"" : "\(service_provider_name?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TOffer?) -> Bool {
        return self == object
    }
    static func == (left: _TOffer, right: _TOffer) -> Bool {
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
    static func demoObject()-> TOffer?{
        let obj = TOffer.mr_createEntity()
        obj?.created_at = Randoms.randomFakeName()
        obj?.notes = Randoms.randomFakeName()
        obj?.offer_price = NSNumber(value: Randoms.randomInt32())
        obj?.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj?.rate = NSNumber(value: Randoms.randomInt32())
        obj?.rate_count = NSNumber(value: Randoms.randomInt32())
        obj?.service_price = NSNumber(value: Randoms.randomInt32())
        obj?.service_provider_name = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TOffer]{
        var arr = [TOffer]()
        for _ in 1...GlobalConstants.API_PageSize {
            if let usr = TOffer.demoObject() {
                arr.append(usr)
            }
        }
        return arr
    }
    #endif

}





public class _TOfferObject: NSObject {
   public class var entityName: String {
      return "TOfferObject"
   }

   @objc public var created_at: String?
   @objc public var notes: String?
   @objc public var offer_price: NSNumber?
   @objc public var pk_i_id: NSNumber?
   @objc public var rate: NSNumber?
   @objc public var rate_count: NSNumber?
   @objc public var service_price: NSNumber?
   @objc public var service_provider_name: String?


   static let rKmapping : RKObjectMapping = {
        var TOfferObjectMapping = RKObjectMapping(for: TOfferObject.classForCoder())
        TOfferObjectMapping?.addAttributeMappings(from: [
                "created_at":"created_at",
                "notes":"notes",
                "offer_price":"offer_price",
                "id":"pk_i_id",
                "rate":"rate",
                "rate_count":"rate_count",
                "service_price":"service_price",
                "service_provider_name":"service_provider_name",

            ])
        return TOfferObjectMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["created_at"] = created_at
        dictionary["notes"] = notes
        dictionary["offer_price"] = offer_price
        dictionary["id"] = pk_i_id
        dictionary["rate"] = rate
        dictionary["rate_count"] = rate_count
        dictionary["service_price"] = service_price
        dictionary["service_provider_name"] = service_provider_name


        return dictionary
    }

    public override var description: String{
        var description: String = "<TOfferObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"created_at\" : \(created_at != nil ? "\"\(created_at?.description ?? "nil")\"" : "\(created_at?.description ?? "nil")");"
        description += "\n    \"notes\" : \(notes != nil ? "\"\(notes?.description ?? "nil")\"" : "\(notes?.description ?? "nil")");"
        description += "\n    \"offer_price\" : \(offer_price?.description ?? "nil");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"rate\" : \(rate?.description ?? "nil");"
        description += "\n    \"rate_count\" : \(rate_count?.description ?? "nil");"
        description += "\n    \"service_price\" : \(service_price?.description ?? "nil");"
        description += "\n    \"service_provider_name\" : \(service_provider_name != nil ? "\"\(service_provider_name?.description ?? "nil")\"" : "\(service_provider_name?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TOfferObject?) -> Bool {
        return self == object
    }
    static func == (left: _TOfferObject, right: _TOfferObject) -> Bool {
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
    static func demoObject()-> TOfferObject{
        let obj = TOfferObject()
        obj.created_at = Randoms.randomFakeName()
        obj.notes = Randoms.randomFakeName()
        obj.offer_price = NSNumber(value: Randoms.randomInt32())
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.rate = NSNumber(value: Randoms.randomInt32())
        obj.rate_count = NSNumber(value: Randoms.randomInt32())
        obj.service_price = NSNumber(value: Randoms.randomInt32())
        obj.service_provider_name = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TOfferObject]{
        var arr = [TOfferObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TOfferObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}


#elseif canImport(Alamofire)
public class _TOfferObject: NSObject,NSCoding,NSCopying {
    @objc public var created_at: String?
    @objc public var notes: String?
    @objc public var offer_price: NSNumber?
    @objc public var pk_i_id: NSNumber?
    @objc public var rate: NSNumber?
    @objc public var rate_count: NSNumber?
    @objc public var service_price: NSNumber?
    @objc public var service_provider_name: String?


    init(fromDictionary dictionary: NSDictionary){
        created_at = dictionary.value(forKeyPath: "created_at") as? String
        notes = dictionary.value(forKeyPath: "notes") as? String
        offer_price = dictionary.value(forKeyPath: "offer_price") as? NSNumber
        pk_i_id = dictionary.value(forKeyPath: "id") as? NSNumber
        rate = dictionary.value(forKeyPath: "rate") as? NSNumber
        rate_count = dictionary.value(forKeyPath: "rate_count") as? NSNumber
        service_price = dictionary.value(forKeyPath: "service_price") as? NSNumber
        service_provider_name = dictionary.value(forKeyPath: "service_provider_name") as? String

    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["created_at"] = created_at
        dictionary["notes"] = notes
        dictionary["offer_price"] = offer_price
        dictionary["id"] = pk_i_id
        dictionary["rate"] = rate
        dictionary["rate_count"] = rate_count
        dictionary["service_price"] = service_price
        dictionary["service_provider_name"] = service_provider_name


        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder){
        created_at = aDecoder.decodeObject(forKey:"created_at") as? String
        notes = aDecoder.decodeObject(forKey:"notes") as? String
        offer_price = aDecoder.decodeObject(forKey:"offer_price") as? NSNumber
        pk_i_id = aDecoder.decodeObject(forKey:"id") as? NSNumber
        rate = aDecoder.decodeObject(forKey:"rate") as? NSNumber
        rate_count = aDecoder.decodeObject(forKey:"rate_count") as? NSNumber
        service_price = aDecoder.decodeObject(forKey:"service_price") as? NSNumber
        service_provider_name = aDecoder.decodeObject(forKey:"service_provider_name") as? String

    }

    @objc public func encode(with aCoder: NSCoder){
        if created_at != nil{
            aCoder.encode(created_at, forKey: "created_at")
        }
        if notes != nil{
            aCoder.encode(notes, forKey: "notes")
        }
        if offer_price != nil{
            aCoder.encode(offer_price, forKey: "offer_price")
        }
        if pk_i_id != nil{
            aCoder.encode(pk_i_id, forKey: "id")
        }
        if rate != nil{
            aCoder.encode(rate, forKey: "rate")
        }
        if rate_count != nil{
            aCoder.encode(rate_count, forKey: "rate_count")
        }
        if service_price != nil{
            aCoder.encode(service_price, forKey: "service_price")
        }
        if service_provider_name != nil{
            aCoder.encode(service_provider_name, forKey: "service_provider_name")
        }

    }
    public func copy(with zone: NSZone? = nil) -> Any {
        return TOfferObject(fromDictionary: self.toDictionary() as NSDictionary)
    }
    public override var description: String{
        var description: String = "<TOfferObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"created_at\" : \(created_at != nil ? "\"\(created_at?.description ?? "nil")\"" : "\(created_at?.description ?? "nil")");"
        description += "\n    \"notes\" : \(notes != nil ? "\"\(notes?.description ?? "nil")\"" : "\(notes?.description ?? "nil")");"
        description += "\n    \"offer_price\" : \(offer_price?.description ?? "nil");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"rate\" : \(rate?.description ?? "nil");"
        description += "\n    \"rate_count\" : \(rate_count?.description ?? "nil");"
        description += "\n    \"service_price\" : \(service_price?.description ?? "nil");"
        description += "\n    \"service_provider_name\" : \(service_provider_name != nil ? "\"\(service_provider_name?.description ?? "nil")\"" : "\(service_provider_name?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TOfferObject?) -> Bool {
        return self == object
    }
    static func == (left: _TOfferObject, right: _TOfferObject) -> Bool {
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
    static func demoObject()-> TOfferObject{
        let obj = TOfferObject(fromDictionary: ["":""])
        obj.created_at = Randoms.randomFakeName()
        obj.notes = Randoms.randomFakeName()
        obj.offer_price = NSNumber(value: Randoms.randomInt32())
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.rate = NSNumber(value: Randoms.randomInt32())
        obj.rate_count = NSNumber(value: Randoms.randomInt32())
        obj.service_price = NSNumber(value: Randoms.randomInt32())
        obj.service_provider_name = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TOfferObject]{
        var arr = [TOfferObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TOfferObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}

#endif

/************************* Mo’min J.Abusaada *************************/
