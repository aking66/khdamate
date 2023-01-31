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

public enum TServiceAttributes: String {
   case added_to_fav
   case descriptions
   case main_service_id
   case main_service_name
   case name
   case orders_count
   case photo
   case pk_i_id
}



public class _TService: NSManagedObject {
   public class var entityName: String {
      return "TService"
   }

   @objc @NSManaged public var added_to_fav: NSNumber?
   @objc @NSManaged public var descriptions: String?
   @objc @NSManaged public var main_service_id: NSNumber?
   @objc @NSManaged public var main_service_name: String?
   @objc @NSManaged public var name: String?
   @objc @NSManaged public var orders_count: NSNumber?
   @objc @NSManaged public var photo: String?
   @objc @NSManaged public var pk_i_id: NSNumber?
   @objc public var service_price: String?

   static let rKmapping : RKEntityMapping = {
        var TServiceMapping = RKEntityMapping(forEntityForName: NSStringFromClass(TService.classForCoder()), in: RKObjectManager.shared().managedObjectStore)
        TServiceMapping?.addAttributeMappings(from: [
                "added_to_fav":"added_to_fav",
                "description":"descriptions",
                "main_service_id":"main_service_id",
                "main_service_name":"main_service_name",
                "name":"name",
                "orders_count":"orders_count",
                "photo":"photo",
                "id":"pk_i_id",
                "id":"service_price",

            ])
        TServiceMapping?.identificationAttributes = ["pk_i_id"]
        return TServiceMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["added_to_fav"] = added_to_fav
        dictionary["description"] = descriptions
        dictionary["main_service_id"] = main_service_id
        dictionary["main_service_name"] = main_service_name
        dictionary["name"] = name
        dictionary["orders_count"] = orders_count
        dictionary["photo"] = photo
        dictionary["id"] = pk_i_id
        
        dictionary["service_price"] = service_price

        return dictionary
    }

    func toNonDBObject() -> TServiceObject {
       let obj = TServiceObject()
       obj.added_to_fav = self.added_to_fav
       obj.descriptions = self.descriptions
       obj.main_service_id = self.main_service_id
       obj.main_service_name = self.main_service_name
       obj.name = self.name
       obj.orders_count = self.orders_count
       obj.photo = self.photo
       obj.pk_i_id = self.pk_i_id
        obj.service_price = self.service_price

       return obj
    }
    public override var description: String{
        var description: String = "<TService: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"added_to_fav\" : \(added_to_fav?.description ?? "nil");"
        description += "\n    \"descriptions\" : \(descriptions != nil ? "\"\(descriptions?.description ?? "nil")\"" : "\(descriptions?.description ?? "nil")");"
        description += "\n    \"main_service_id\" : \(main_service_id?.description ?? "nil");"
        description += "\n    \"main_service_name\" : \(main_service_name != nil ? "\"\(main_service_name?.description ?? "nil")\"" : "\(main_service_name?.description ?? "nil")");"
        description += "\n    \"name\" : \(name != nil ? "\"\(name?.description ?? "nil")\"" : "\(name?.description ?? "nil")");"
        description += "\n    \"orders_count\" : \(orders_count?.description ?? "nil");"
        description += "\n    \"photo\" : \(photo != nil ? "\"\(photo?.description ?? "nil")\"" : "\(photo?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TService?) -> Bool {
        return self == object
    }
    static func == (left: _TService, right: _TService) -> Bool {
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
    static func demoObject()-> TService?{
        let obj = TService.mr_createEntity()
        obj?.added_to_fav = NSNumber(value: Randoms.randomBool())
        obj?.descriptions = Randoms.randomFakeName()
        obj?.main_service_id = NSNumber(value: Randoms.randomInt32())
        obj?.main_service_name = Randoms.randomFakeName()
        obj?.name = Randoms.randomFakeName()
        obj?.orders_count = NSNumber(value: Randoms.randomInt32())
        obj?.photo = Randoms.randomFakeName()
        obj?.pk_i_id = NSNumber(value: Randoms.randomInt32())
        return obj
    }
    static func demoArray()-> [TService]{
        var arr = [TService]()
        for _ in 1...GlobalConstants.API_PageSize {
            if let usr = TService.demoObject() {
                arr.append(usr)
            }
        }
        return arr
    }
    #endif

}





public class _TServiceObject: NSObject {
   public class var entityName: String {
      return "TServiceObject"
   }

   @objc public var added_to_fav: NSNumber?
   @objc public var descriptions: String?
   @objc public var main_service_id: NSNumber?
   @objc public var main_service_name: String?
   @objc public var name: String?
   @objc public var orders_count: NSNumber?
   @objc public var photo: String?
    @objc public var pk_i_id: NSNumber?
    @objc public var service_price: String?

   static let rKmapping : RKObjectMapping = {
        var TServiceObjectMapping = RKObjectMapping(for: TServiceObject.classForCoder())
        TServiceObjectMapping?.addAttributeMappings(from: [
                "added_to_fav":"added_to_fav",
                "description":"descriptions",
                "main_service_id":"main_service_id",
                "main_service_name":"main_service_name",
                "name":"name",
                "orders_count":"orders_count",
                "photo":"photo",
                "service_price":"service_price",
                "id":"pk_i_id",

            ])
        return TServiceObjectMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["added_to_fav"] = added_to_fav
        dictionary["description"] = descriptions
        dictionary["main_service_id"] = main_service_id
        dictionary["main_service_name"] = main_service_name
        dictionary["name"] = name
        dictionary["orders_count"] = orders_count
        dictionary["photo"] = photo
        dictionary["id"] = pk_i_id
        dictionary["service_price"] = service_price


        return dictionary
    }

    public override var description: String{
        var description: String = "<TServiceObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"added_to_fav\" : \(added_to_fav?.description ?? "nil");"
        description += "\n    \"descriptions\" : \(descriptions != nil ? "\"\(descriptions?.description ?? "nil")\"" : "\(descriptions?.description ?? "nil")");"
        description += "\n    \"main_service_id\" : \(main_service_id?.description ?? "nil");"
        description += "\n    \"main_service_name\" : \(main_service_name != nil ? "\"\(main_service_name?.description ?? "nil")\"" : "\(main_service_name?.description ?? "nil")");"
        description += "\n    \"name\" : \(name != nil ? "\"\(name?.description ?? "nil")\"" : "\(name?.description ?? "nil")");"
        description += "\n    \"orders_count\" : \(orders_count?.description ?? "nil");"
        description += "\n    \"photo\" : \(photo != nil ? "\"\(photo?.description ?? "nil")\"" : "\(photo?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TServiceObject?) -> Bool {
        return self == object
    }
    static func == (left: _TServiceObject, right: _TServiceObject) -> Bool {
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
    static func demoObject()-> TServiceObject{
        let obj = TServiceObject()
        obj.added_to_fav = NSNumber(value: Randoms.randomBool())
        obj.descriptions = Randoms.randomFakeName()
        obj.main_service_id = NSNumber(value: Randoms.randomInt32())
        obj.main_service_name = Randoms.randomFakeName()
        obj.name = Randoms.randomFakeName()
        obj.orders_count = NSNumber(value: Randoms.randomInt32())
        obj.photo = Randoms.randomFakeName()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        return obj
    }
    static func demoArray()-> [TServiceObject]{
        var arr = [TServiceObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TServiceObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}


#elseif canImport(Alamofire)
public class _TServiceObject: NSObject,NSCoding,NSCopying {
    @objc public var added_to_fav: NSNumber?
    @objc public var descriptions: String?
    @objc public var main_service_id: NSNumber?
    @objc public var main_service_name: String?
    @objc public var name: String?
    @objc public var orders_count: NSNumber?
    @objc public var photo: String?
    @objc public var pk_i_id: NSNumber?
    @objc public var service_price: String?

    
    init(fromDictionary dictionary: NSDictionary){
        added_to_fav = dictionary.value(forKeyPath: "added_to_fav") as? NSNumber
        descriptions = dictionary.value(forKeyPath: "description") as? String
        main_service_id = dictionary.value(forKeyPath: "main_service_id") as? NSNumber
        main_service_name = dictionary.value(forKeyPath: "main_service_name") as? String
        service_price = dictionary.value(forKeyPath: "service_price") as? String
        name = dictionary.value(forKeyPath: "name") as? String
        orders_count = dictionary.value(forKeyPath: "orders_count") as? NSNumber
        photo = dictionary.value(forKeyPath: "photo") as? String
        pk_i_id = dictionary.value(forKeyPath: "id") as? NSNumber

    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["added_to_fav"] = added_to_fav
        dictionary["description"] = descriptions
        dictionary["main_service_id"] = main_service_id
        dictionary["main_service_name"] = main_service_name
        dictionary["name"] = name
        dictionary["orders_count"] = orders_count
        dictionary["photo"] = photo
        dictionary["id"] = pk_i_id
        dictionary["service_price"] = service_price


        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder){
        added_to_fav = aDecoder.decodeObject(forKey:"added_to_fav") as? NSNumber
        descriptions = aDecoder.decodeObject(forKey:"description") as? String
        main_service_id = aDecoder.decodeObject(forKey:"main_service_id") as? NSNumber
        main_service_name = aDecoder.decodeObject(forKey:"main_service_name") as? String
        name = aDecoder.decodeObject(forKey:"name") as? String
        orders_count = aDecoder.decodeObject(forKey:"orders_count") as? NSNumber
        photo = aDecoder.decodeObject(forKey:"photo") as? String
        pk_i_id = aDecoder.decodeObject(forKey:"id") as? NSNumber
        service_price = aDecoder.decodeObject(forKey:"service_price") as? String

    }

    @objc public func encode(with aCoder: NSCoder){
        if added_to_fav != nil{
            aCoder.encode(added_to_fav, forKey: "added_to_fav")
        }
        if descriptions != nil{
            aCoder.encode(descriptions, forKey: "description")
        }
        if main_service_id != nil{
            aCoder.encode(main_service_id, forKey: "main_service_id")
        }
        if main_service_name != nil{
            aCoder.encode(main_service_name, forKey: "main_service_name")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if orders_count != nil{
            aCoder.encode(orders_count, forKey: "orders_count")
        }
        if photo != nil{
            aCoder.encode(photo, forKey: "photo")
        }
        if pk_i_id != nil{
            aCoder.encode(pk_i_id, forKey: "id")
        }
        if service_price != nil{
            aCoder.encode(service_price, forKey: "service_price")
        }

        

    }
    public func copy(with zone: NSZone? = nil) -> Any {
        return TServiceObject(fromDictionary: self.toDictionary() as NSDictionary)
    }
    public override var description: String{
        var description: String = "<TServiceObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"added_to_fav\" : \(added_to_fav?.description ?? "nil");"
        description += "\n    \"descriptions\" : \(descriptions != nil ? "\"\(descriptions?.description ?? "nil")\"" : "\(descriptions?.description ?? "nil")");"
        description += "\n    \"main_service_id\" : \(main_service_id?.description ?? "nil");"
        description += "\n    \"main_service_name\" : \(main_service_name != nil ? "\"\(main_service_name?.description ?? "nil")\"" : "\(main_service_name?.description ?? "nil")");"
        description += "\n    \"name\" : \(name != nil ? "\"\(name?.description ?? "nil")\"" : "\(name?.description ?? "nil")");"
        description += "\n    \"orders_count\" : \(orders_count?.description ?? "nil");"
        description += "\n    \"photo\" : \(photo != nil ? "\"\(photo?.description ?? "nil")\"" : "\(photo?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TServiceObject?) -> Bool {
        return self == object
    }
    static func == (left: _TServiceObject, right: _TServiceObject) -> Bool {
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
    static func demoObject()-> TServiceObject{
        let obj = TServiceObject(fromDictionary: ["":""])
        obj.added_to_fav = NSNumber(value: Randoms.randomBool())
        obj.descriptions = Randoms.randomFakeName()
        obj.main_service_id = NSNumber(value: Randoms.randomInt32())
        obj.main_service_name = Randoms.randomFakeName()
        obj.name = Randoms.randomFakeName()
        obj.orders_count = NSNumber(value: Randoms.randomInt32())
        obj.photo = Randoms.randomFakeName()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        return obj
    }
    static func demoArray()-> [TServiceObject]{
        var arr = [TServiceObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TServiceObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}

#endif

/************************* Mo’min J.Abusaada *************************/
