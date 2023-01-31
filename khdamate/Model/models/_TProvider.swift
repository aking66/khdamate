
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

public enum TProviderAttributes: String {
   case pk_i_id
   case image_url
   case rate
   case name
}



public class _TProvider: NSManagedObject {
   public class var entityName: String {
      return "TProvider"
   }

   @objc @NSManaged public var name: String?
   @objc @NSManaged public var image_url: String?
   @objc @NSManaged public var rate: NSNumber?
   @objc @NSManaged public var pk_i_id: NSNumber?


   static let rKmapping : RKEntityMapping = {
        var TProviderMapping = RKEntityMapping(forEntityForName: NSStringFromClass(TProvider.classForCoder()), in: RKObjectManager.shared().managedObjectStore)
        TProviderMapping?.addAttributeMappings(from: [
                "name":"name",
                "image_url":"image_url",
                "rate":"rate",
                "id":"pk_i_id",

            ])
        TProviderMapping?.identificationAttributes = ["pk_i_id"]
        return TProviderMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["name"] = name
        dictionary["image_url"] = image_url
        dictionary["rate"] = rate
        dictionary["id"] = pk_i_id


        return dictionary
    }

    func toNonDBObject() -> TProviderObject {
       let obj = TProviderObject()
       obj.name = self.name
       obj.image_url = self.image_url
       obj.rate = self.rate
       obj.pk_i_id = self.pk_i_id

       return obj
    }
    public override var description: String{
        var description: String = "<TProvider: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

//        description += "\n    \"email\" : \(name != nil ? "\"\(name?.description ?? "nil")\"" : "\(email?.description ?? "nil")");"
//        description += "\n    \"facebook\" : \(facebook != nil ? "\"\(facebook?.description ?? "nil")\"" : "\(facebook?.description ?? "nil")");"
//        description += "\n    \"phone\" : \(phone != nil ? "\"\(phone?.description ?? "nil")\"" : "\(phone?.description ?? "nil")");"
//        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
//        description += "\n  }"

        return description
    }

    func isEqual(object: _TProvider?) -> Bool {
        return self == object
    }
    static func == (left: _TProvider, right: _TProvider) -> Bool {
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
    static func demoObject()-> TProvider?{
        let obj = TProvider.mr_createEntity()
        obj.name = Randoms.randomFakeName()
        obj.image_url = Randoms.randomFakeName()
        obj.rate = NSNumber(value: Randoms.randomBool())
        obj.pk_i_id = NSNumber(value: Randoms.randomBool())

        return obj
    }
    static func demoArray()-> [TProvider]{
        var arr = [TProvider]()
        for _ in 1...GlobalConstants.API_PageSize {
            if let usr = TProvider.demoObject() {
                arr.append(usr)
            }
        }
        return arr
    }
    #endif

}





public class _TProviderObject: NSObject {
   public class var entityName: String {
      return "TProviderObject"
   }

   @objc public var name: String?
   @objc public var image_url: String?
   @objc public var rate: NSNumber?
   @objc public var pk_i_id: NSNumber?


   static let rKmapping : RKObjectMapping = {
        var TProviderObjectMapping = RKObjectMapping(for: TProviderObject.classForCoder())
        TProviderObjectMapping?.addAttributeMappings(from: [
                "email":"email",
                "facebook":"facebook",
                "phone":"phone",
                "id":"pk_i_id",
                "twitter":"twitter",

            ])
        return TProviderObjectMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["name"] = name
        dictionary["image_url"] = image_url
        dictionary["rate"] = rate
        dictionary["id"] = pk_i_id


        return dictionary
    }

    public override var description: String{
        var description: String = "<TProviderObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"email\" : \(name != nil ? "\"\(name?.description ?? "nil")\"" : "\(email?.description ?? "nil")");"
        description += "\n    \"facebook\" : \(facebook != nil ? "\"\(facebook?.description ?? "nil")\"" : "\(facebook?.description ?? "nil")");"
        description += "\n    \"phone\" : \(phone != nil ? "\"\(phone?.description ?? "nil")\"" : "\(phone?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"twitter\" : \(twitter != nil ? "\"\(twitter?.description ?? "nil")\"" : "\(twitter?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TProviderObject?) -> Bool {
        return self == object
    }
    static func == (left: _TProviderObject, right: _TProviderObject) -> Bool {
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
    static func demoObject()-> TProviderObject{
        let obj = TProviderObject()
        obj.name = Randoms.randomFakeName()
        obj.image_url = Randoms.randomFakeName()
        obj.rate = Randoms.randomInt32()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        return obj
    }
    static func demoArray()-> [TProviderObject]{
        var arr = [TProviderObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TProviderObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}


#elseif canImport(Alamofire)
public class _TProviderObject: NSObject,NSCoding,NSCopying {
    @objc public var name: String?
    @objc public var image_url: String?
    @objc public var rate: NSNumber?
    @objc public var pk_i_id: NSNumber?
    @objc public var mobile: String?

    @objc public var services = [TServiceObject]()


    init(fromDictionary dictionary: NSDictionary){
        name = dictionary.value(forKeyPath: "name") as? String
        image_url = dictionary.value(forKeyPath: "image_url") as? String
        rate = dictionary.value(forKeyPath: "rate") as? NSNumber
        pk_i_id = dictionary.value(forKeyPath: "id") as? NSNumber
        mobile = dictionary.value(forKeyPath: "mobile") as? String
        services = [TServiceObject]()
        if let arr = dictionary["services"] as? [[String:Any]]{
                   for dic in arr{
                       let value = TServiceObject(fromDictionary: dic as NSDictionary)
                       services.append(value)
                   }
               }
    
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["name"] = name
        dictionary["image_url"] = image_url
        dictionary["rate"] = rate
        dictionary["id"] = pk_i_id
            do {
                      var dictionaryElements = [[String:Any]]()
                      for obj in services {
                          dictionaryElements.append(obj.toDictionary())
                      }
                      dictionary["services"] = dictionaryElements
                  }

        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder){
        image_url = aDecoder.decodeObject(forKey:"image_url") as? String
        rate = aDecoder.decodeObject(forKey:"rate") as? NSNumber
        name = aDecoder.decodeObject(forKey:"name") as? String
        pk_i_id = aDecoder.decodeObject(forKey:"id") as? NSNumber
        services = aDecoder.decodeObject(forKey:"services") as? [TServiceObject] ?? [TServiceObject]()

    }

    @objc public func encode(with aCoder: NSCoder){
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if rate != nil{
            aCoder.encode(rate, forKey: "rate")
        }
        if image_url != nil{
            aCoder.encode(image_url, forKey: "phone")
        }
        if pk_i_id != nil{
            aCoder.encode(pk_i_id, forKey: "id")
        }
     
    }
    public func copy(with zone: NSZone? = nil) -> Any {
        return TProviderObject(fromDictionary: self.toDictionary() as NSDictionary)
    }
    public override var description: String{
        var description: String = "<TProviderObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"
//        description += "\n    \"email\" : \(name != nil ? "\"\(name?.description ?? "nil")\"" : "\(email?.description ?? "nil")");"
//        description += "\n    \"facebook\" : \(facebook != nil ? "\"\(facebook?.description ?? "nil")\"" : "\(facebook?.description ?? "nil")");"
//        description += "\n    \"phone\" : \(phone != nil ? "\"\(phone?.description ?? "nil")\"" : "\(phone?.description ?? "nil")");"
//        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
//        description += "\n    \"twitter\" : \(twitter != nil ? "\"\(twitter?.description ?? "nil")\"" : "\(twitter?.description ?? "nil")");"
//        description += "\n  }"

        return description
    }

    func isEqual(object: _TProviderObject?) -> Bool {
        return self == object
    }
    static func == (left: _TProviderObject, right: _TProviderObject) -> Bool {
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
    static func demoObject()-> TProviderObject{
        let obj = TProviderObject(fromDictionary: ["":""])
        obj.name = Randoms.randomFakeName()
        obj.image_url = Randoms.randomFakeName()
        obj.rate = Randoms.randomInt32()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        return obj
    }
    static func demoArray()-> [TProviderObject]{
        var arr = [TProviderObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TProviderObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}

#endif

/************************* Mo’min J.Abusaada *************************/
