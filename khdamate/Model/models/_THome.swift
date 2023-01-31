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

public enum THomeAttributes: String {
   case new_notifications_count
   case pk_i_id
   case service_price
}



public class _THome: NSManagedObject {
   public class var entityName: String {
      return "THome"
   }

   @objc @NSManaged public var new_notifications_count: NSNumber?
   @objc @NSManaged public var pk_i_id: NSNumber?
   @objc @NSManaged public var service_price: String?


   static let rKmapping : RKEntityMapping = {
        var THomeMapping = RKEntityMapping(forEntityForName: NSStringFromClass(THome.classForCoder()), in: RKObjectManager.shared().managedObjectStore)
        THomeMapping?.addAttributeMappings(from: [
                "new_notifications_count":"new_notifications_count",
                "id":"pk_i_id",
                "service_price":"service_price",

            ])
        THomeMapping?.identificationAttributes = ["pk_i_id"]
        return THomeMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["new_notifications_count"] = new_notifications_count
        dictionary["id"] = pk_i_id
        dictionary["service_price"] = service_price


        return dictionary
    }

    func toNonDBObject() -> THomeObject {
       let obj = THomeObject()
       obj.new_notifications_count = self.new_notifications_count
       obj.pk_i_id = self.pk_i_id
       obj.service_price = self.service_price

       return obj
    }
    public override var description: String{
        var description: String = "<THome: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"new_notifications_count\" : \(new_notifications_count?.description ?? "nil");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"service_price\" : \(service_price != nil ? "\"\(service_price?.description ?? "nil")\"" : "\(service_price?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _THome?) -> Bool {
        return self == object
    }
    static func == (left: _THome, right: _THome) -> Bool {
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
    static func demoObject()-> THome?{
        let obj = THome.mr_createEntity()
        obj?.new_notifications_count = NSNumber(value: Randoms.randomInt32())
        obj?.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj?.service_price = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [THome]{
        var arr = [THome]()
        for _ in 1...GlobalConstants.API_PageSize {
            if let usr = THome.demoObject() {
                arr.append(usr)
            }
        }
        return arr
    }
    #endif

}





public class _THomeObject: NSObject {
   public class var entityName: String {
      return "THomeObject"
   }

   @objc public var new_notifications_count: NSNumber?
   @objc public var pk_i_id: NSNumber?
   @objc public var service_price: String?


   static let rKmapping : RKObjectMapping = {
        var THomeObjectMapping = RKObjectMapping(for: THomeObject.classForCoder())
        THomeObjectMapping?.addAttributeMappings(from: [
                "new_notifications_count":"new_notifications_count",
                "id":"pk_i_id",
                "service_price":"service_price",

            ])
        return THomeObjectMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["new_notifications_count"] = new_notifications_count
        dictionary["id"] = pk_i_id
        dictionary["service_price"] = service_price


        return dictionary
    }

    public override var description: String{
        var description: String = "<THomeObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"new_notifications_count\" : \(new_notifications_count?.description ?? "nil");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"service_price\" : \(service_price != nil ? "\"\(service_price?.description ?? "nil")\"" : "\(service_price?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _THomeObject?) -> Bool {
        return self == object
    }
    static func == (left: _THomeObject, right: _THomeObject) -> Bool {
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
    static func demoObject()-> THomeObject{
        let obj = THomeObject()
        obj.new_notifications_count = NSNumber(value: Randoms.randomInt32())
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.service_price = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [THomeObject]{
        var arr = [THomeObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = THomeObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}


#elseif canImport(Alamofire)
public class _THomeObject: NSObject,NSCoding,NSCopying {
    @objc public var new_notifications_count: NSNumber?
    @objc public var pk_i_id: NSNumber?
    @objc public var service_price: String?


    init(fromDictionary dictionary: NSDictionary){
        new_notifications_count = dictionary.value(forKeyPath: "new_notifications_count") as? NSNumber
        pk_i_id = dictionary.value(forKeyPath: "id") as? NSNumber
        service_price = dictionary.value(forKeyPath: "service_price") as? String

    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["new_notifications_count"] = new_notifications_count
        dictionary["id"] = pk_i_id
        dictionary["service_price"] = service_price


        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder){
        new_notifications_count = aDecoder.decodeObject(forKey:"new_notifications_count") as? NSNumber
        pk_i_id = aDecoder.decodeObject(forKey:"id") as? NSNumber
        service_price = aDecoder.decodeObject(forKey:"service_price") as? String

    }

    @objc public func encode(with aCoder: NSCoder){
        if new_notifications_count != nil{
            aCoder.encode(new_notifications_count, forKey: "new_notifications_count")
        }
        if pk_i_id != nil{
            aCoder.encode(pk_i_id, forKey: "id")
        }
        if service_price != nil{
            aCoder.encode(service_price, forKey: "service_price")
        }

    }
    public func copy(with zone: NSZone? = nil) -> Any {
        return THomeObject(fromDictionary: self.toDictionary() as NSDictionary)
    }
    public override var description: String{
        var description: String = "<THomeObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"new_notifications_count\" : \(new_notifications_count?.description ?? "nil");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"service_price\" : \(service_price != nil ? "\"\(service_price?.description ?? "nil")\"" : "\(service_price?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _THomeObject?) -> Bool {
        return self == object
    }
    static func == (left: _THomeObject, right: _THomeObject) -> Bool {
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
    static func demoObject()-> THomeObject{
        let obj = THomeObject(fromDictionary: ["":""])
        obj.new_notifications_count = NSNumber(value: Randoms.randomInt32())
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.service_price = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [THomeObject]{
        var arr = [THomeObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = THomeObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}

#endif

/************************* Mo’min J.Abusaada *************************/
