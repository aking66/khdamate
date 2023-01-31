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

public enum TAdvertisementAttributes: String {
   case adv_picture_url
   case adv_url
   case pk_i_id
   case service_detail_id
   case type
}

public enum TAdvertisementRelationships: String {
   case service_detail
}


public class _TAdvertisement: NSManagedObject {
   public class var entityName: String {
      return "TAdvertisement"
   }

   @objc @NSManaged public var adv_picture_url: String?
   @objc @NSManaged public var adv_url: String?
   @objc @NSManaged public var pk_i_id: NSNumber?
   @objc @NSManaged public var service_detail_id: NSNumber?
   @objc @NSManaged public var type: String?

   @objc @NSManaged public var service_detail: TService?

   static let rKmapping : RKEntityMapping = {
        var TAdvertisementMapping = RKEntityMapping(forEntityForName: NSStringFromClass(TAdvertisement.classForCoder()), in: RKObjectManager.shared().managedObjectStore)
        TAdvertisementMapping?.addAttributeMappings(from: [
                "adv_picture_url":"adv_picture_url",
                "adv_url":"adv_url",
                "id":"pk_i_id",
                "service_detail_id":"service_detail_id",
                "type":"type",

            ])
        TAdvertisementMapping?.identificationAttributes = ["pk_i_id"]
        return TAdvertisementMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////
        TAdvertisement.rKmapping.addPropertyMapping(RKRelationshipMapping(fromKeyPath:"service_detail", toKeyPath: "service_detail" , with: TService.rKmapping))

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["adv_picture_url"] = adv_picture_url
        dictionary["adv_url"] = adv_url
        dictionary["id"] = pk_i_id
        dictionary["service_detail_id"] = service_detail_id
        dictionary["type"] = type

        dictionary["service_detail"] =  service_detail?.toDictionary()

        return dictionary
    }

    func toNonDBObject() -> TAdvertisementObject {
       let obj = TAdvertisementObject()
       obj.adv_picture_url = self.adv_picture_url
       obj.adv_url = self.adv_url
       obj.pk_i_id = self.pk_i_id
       obj.service_detail_id = self.service_detail_id
       obj.type = self.type

       obj.service_detail = self.service_detail?.toNonDBObject()
       return obj
    }
    public override var description: String{
        var description: String = "<TAdvertisement: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"adv_picture_url\" : \(adv_picture_url != nil ? "\"\(adv_picture_url?.description ?? "nil")\"" : "\(adv_picture_url?.description ?? "nil")");"
        description += "\n    \"adv_url\" : \(adv_url != nil ? "\"\(adv_url?.description ?? "nil")\"" : "\(adv_url?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"service_detail_id\" : \(service_detail_id?.description ?? "nil");"
        description += "\n    \"type\" : \(type != nil ? "\"\(type?.description ?? "nil")\"" : "\(type?.description ?? "nil")");"
        description += "\n    service_detail = \(service_detail != nil ? "<TService: \(Unmanaged.passUnretained(service_detail!).toOpaque())>" : "nil");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TAdvertisement?) -> Bool {
        return self == object
    }
    static func == (left: _TAdvertisement, right: _TAdvertisement) -> Bool {
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
    static func demoObject()-> TAdvertisement?{
        let obj = TAdvertisement.mr_createEntity()
        obj?.adv_picture_url = Randoms.randomFakeName()
        obj?.adv_url = Randoms.randomFakeName()
        obj?.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj?.service_detail_id = NSNumber(value: Randoms.randomInt32())
        obj?.type = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TAdvertisement]{
        var arr = [TAdvertisement]()
        for _ in 1...GlobalConstants.API_PageSize {
            if let usr = TAdvertisement.demoObject() {
                arr.append(usr)
            }
        }
        return arr
    }
    #endif

}





public class _TAdvertisementObject: NSObject {
   public class var entityName: String {
      return "TAdvertisementObject"
   }

   @objc public var adv_picture_url: String?
   @objc public var adv_url: String?
   @objc public var pk_i_id: NSNumber?
   @objc public var service_detail_id: NSNumber?
   @objc public var type: String?

   @objc public var service_detail: TServiceObject?

   static let rKmapping : RKObjectMapping = {
        var TAdvertisementObjectMapping = RKObjectMapping(for: TAdvertisementObject.classForCoder())
        TAdvertisementObjectMapping?.addAttributeMappings(from: [
                "adv_picture_url":"adv_picture_url",
                "adv_url":"adv_url",
                "id":"pk_i_id",
                "service_detail_id":"service_detail_id",
                "type":"type",

            ])
        return TAdvertisementObjectMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////
        TAdvertisementObject.rKmapping.addPropertyMapping(RKRelationshipMapping(fromKeyPath:"service_detail", toKeyPath: "service_detail" , with: TServiceObject.rKmapping))

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["adv_picture_url"] = adv_picture_url
        dictionary["adv_url"] = adv_url
        dictionary["id"] = pk_i_id
        dictionary["service_detail_id"] = service_detail_id
        dictionary["type"] = type

        dictionary["service_detail"] =  service_detail?.toDictionary()

        return dictionary
    }

    public override var description: String{
        var description: String = "<TAdvertisementObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"adv_picture_url\" : \(adv_picture_url != nil ? "\"\(adv_picture_url?.description ?? "nil")\"" : "\(adv_picture_url?.description ?? "nil")");"
        description += "\n    \"adv_url\" : \(adv_url != nil ? "\"\(adv_url?.description ?? "nil")\"" : "\(adv_url?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"service_detail_id\" : \(service_detail_id?.description ?? "nil");"
        description += "\n    \"type\" : \(type != nil ? "\"\(type?.description ?? "nil")\"" : "\(type?.description ?? "nil")");"
        description += "\n    service_detail = \(service_detail != nil ? "<TServiceObject: \(Unmanaged.passUnretained(service_detail!).toOpaque())>" : "nil");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TAdvertisementObject?) -> Bool {
        return self == object
    }
    static func == (left: _TAdvertisementObject, right: _TAdvertisementObject) -> Bool {
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
    static func demoObject()-> TAdvertisementObject{
        let obj = TAdvertisementObject()
        obj.adv_picture_url = Randoms.randomFakeName()
        obj.adv_url = Randoms.randomFakeName()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.service_detail_id = NSNumber(value: Randoms.randomInt32())
        obj.type = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TAdvertisementObject]{
        var arr = [TAdvertisementObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TAdvertisementObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}


#elseif canImport(Alamofire)
public class _TAdvertisementObject: NSObject,NSCoding,NSCopying {
    @objc public var adv_picture_url: String?
    @objc public var adv_url: String?
    @objc public var pk_i_id: NSNumber?
    @objc public var service_detail_id: NSNumber?
    @objc public var type: String?

    @objc public var service_detail: TServiceObject?

    init(fromDictionary dictionary: NSDictionary){
        adv_picture_url = dictionary.value(forKeyPath: "adv_picture_url") as? String
        adv_url = dictionary.value(forKeyPath: "adv_url") as? String
        pk_i_id = dictionary.value(forKeyPath: "id") as? NSNumber
        service_detail_id = dictionary.value(forKeyPath: "service_detail_id") as? NSNumber
        type = dictionary.value(forKeyPath: "type") as? String

        if let data = dictionary["service_detail"] as? NSDictionary{
            service_detail = TServiceObject(fromDictionary: data)
        }
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["adv_picture_url"] = adv_picture_url
        dictionary["adv_url"] = adv_url
        dictionary["id"] = pk_i_id
        dictionary["service_detail_id"] = service_detail_id
        dictionary["type"] = type

        dictionary["service_detail"] =  service_detail?.toDictionary()

        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder){
        adv_picture_url = aDecoder.decodeObject(forKey:"adv_picture_url") as? String
        adv_url = aDecoder.decodeObject(forKey:"adv_url") as? String
        pk_i_id = aDecoder.decodeObject(forKey:"id") as? NSNumber
        service_detail_id = aDecoder.decodeObject(forKey:"service_detail_id") as? NSNumber
        type = aDecoder.decodeObject(forKey:"type") as? String

        service_detail = aDecoder.decodeObject(forKey:"service_detail") as? TServiceObject
    }

    @objc public func encode(with aCoder: NSCoder){
        if adv_picture_url != nil{
            aCoder.encode(adv_picture_url, forKey: "adv_picture_url")
        }
        if adv_url != nil{
            aCoder.encode(adv_url, forKey: "adv_url")
        }
        if pk_i_id != nil{
            aCoder.encode(pk_i_id, forKey: "id")
        }
        if service_detail_id != nil{
            aCoder.encode(service_detail_id, forKey: "service_detail_id")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }

        if service_detail != nil{
            aCoder.encode(service_detail, forKey: "service_detail")
        }
    }
    public func copy(with zone: NSZone? = nil) -> Any {
        return TAdvertisementObject(fromDictionary: self.toDictionary() as NSDictionary)
    }
    public override var description: String{
        var description: String = "<TAdvertisementObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"adv_picture_url\" : \(adv_picture_url != nil ? "\"\(adv_picture_url?.description ?? "nil")\"" : "\(adv_picture_url?.description ?? "nil")");"
        description += "\n    \"adv_url\" : \(adv_url != nil ? "\"\(adv_url?.description ?? "nil")\"" : "\(adv_url?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"service_detail_id\" : \(service_detail_id?.description ?? "nil");"
        description += "\n    \"type\" : \(type != nil ? "\"\(type?.description ?? "nil")\"" : "\(type?.description ?? "nil")");"
        description += "\n    service_detail = \(service_detail != nil ? "<TServiceObject: \(Unmanaged.passUnretained(service_detail!).toOpaque())>" : "nil");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TAdvertisementObject?) -> Bool {
        return self == object
    }
    static func == (left: _TAdvertisementObject, right: _TAdvertisementObject) -> Bool {
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
    static func demoObject()-> TAdvertisementObject{
        let obj = TAdvertisementObject(fromDictionary: ["":""])
        obj.adv_picture_url = Randoms.randomFakeName()
        obj.adv_url = Randoms.randomFakeName()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.service_detail_id = NSNumber(value: Randoms.randomInt32())
        obj.type = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TAdvertisementObject]{
        var arr = [TAdvertisementObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TAdvertisementObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}

#endif

/************************* Mo’min J.Abusaada *************************/
