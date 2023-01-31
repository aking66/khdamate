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

public enum TConstantAttributes: String {
   case is_default
   case name
   case pk_i_id
}



public class _TConstant: NSManagedObject {
   public class var entityName: String {
      return "TConstant"
   }

   @objc @NSManaged public var is_default: NSNumber?
   @objc @NSManaged public var name: String?
   @objc @NSManaged public var pk_i_id: NSNumber?


   static let rKmapping : RKEntityMapping = {
        var TConstantMapping = RKEntityMapping(forEntityForName: NSStringFromClass(TConstant.classForCoder()), in: RKObjectManager.shared().managedObjectStore)
        TConstantMapping?.addAttributeMappings(from: [
                "is_default":"is_default",
                "name":"name",
                "id":"pk_i_id",

            ])
        TConstantMapping?.identificationAttributes = ["pk_i_id"]
        return TConstantMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["is_default"] = is_default
        dictionary["name"] = name
        dictionary["id"] = pk_i_id


        return dictionary
    }

    func toNonDBObject() -> TConstantObject {
       let obj = TConstantObject()
       obj.is_default = self.is_default
       obj.name = self.name
       obj.pk_i_id = self.pk_i_id

       return obj
    }
    public override var description: String{
        var description: String = "<TConstant: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"is_default\" : \(is_default?.description ?? "nil");"
        description += "\n    \"name\" : \(name != nil ? "\"\(name?.description ?? "nil")\"" : "\(name?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TConstant?) -> Bool {
        return self == object
    }
    static func == (left: _TConstant, right: _TConstant) -> Bool {
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
    static func demoObject()-> TConstant?{
        let obj = TConstant.mr_createEntity()
        obj?.is_default = NSNumber(value: Randoms.randomBool())
        obj?.name = Randoms.randomFakeName()
        obj?.pk_i_id = NSNumber(value: Randoms.randomInt32())
        return obj
    }
    static func demoArray()-> [TConstant]{
        var arr = [TConstant]()
        for _ in 1...GlobalConstants.API_PageSize {
            if let usr = TConstant.demoObject() {
                arr.append(usr)
            }
        }
        return arr
    }
    #endif

}





public class _TConstantObject: NSObject {
   public class var entityName: String {
      return "TConstantObject"
   }

   @objc public var is_default: NSNumber?
   @objc public var name: String?
   @objc public var pk_i_id: NSNumber?


   static let rKmapping : RKObjectMapping = {
        var TConstantObjectMapping = RKObjectMapping(for: TConstantObject.classForCoder())
        TConstantObjectMapping?.addAttributeMappings(from: [
                "is_default":"is_default",
                "name":"name",
                "id":"pk_i_id",

            ])
        return TConstantObjectMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["is_default"] = is_default
        dictionary["name"] = name
        dictionary["id"] = pk_i_id


        return dictionary
    }

    public override var description: String{
        var description: String = "<TConstantObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"is_default\" : \(is_default?.description ?? "nil");"
        description += "\n    \"name\" : \(name != nil ? "\"\(name?.description ?? "nil")\"" : "\(name?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TConstantObject?) -> Bool {
        return self == object
    }
    static func == (left: _TConstantObject, right: _TConstantObject) -> Bool {
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
    static func demoObject()-> TConstantObject{
        let obj = TConstantObject()
        obj.is_default = NSNumber(value: Randoms.randomBool())
        obj.name = Randoms.randomFakeName()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        return obj
    }
    static func demoArray()-> [TConstantObject]{
        var arr = [TConstantObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TConstantObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}


#elseif canImport(Alamofire)
public class _TConstantObject: NSObject,NSCoding,NSCopying {
    @objc public var is_default: NSNumber?
    @objc public var name: String?
    @objc public var pk_i_id: NSNumber?
    @objc public var service_price: String?


    init(fromDictionary dictionary: NSDictionary){
        is_default = dictionary.value(forKeyPath: "is_default") as? NSNumber
        name = dictionary.value(forKeyPath: "name") as? String
        pk_i_id = dictionary.value(forKeyPath: "id") as? NSNumber
        service_price = dictionary.value(forKeyPath: "service_price") as? String

    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["is_default"] = is_default
        dictionary["name"] = name
        dictionary["id"] = pk_i_id
        dictionary["service_price"] = service_price

        
        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder){
        is_default = aDecoder.decodeObject(forKey:"is_default") as? NSNumber
        name = aDecoder.decodeObject(forKey:"name") as? String
        pk_i_id = aDecoder.decodeObject(forKey:"id") as? NSNumber

    }

    @objc public func encode(with aCoder: NSCoder){
        if is_default != nil{
            aCoder.encode(is_default, forKey: "is_default")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if pk_i_id != nil{
            aCoder.encode(pk_i_id, forKey: "id")
        }

    }
    public func copy(with zone: NSZone? = nil) -> Any {
        return TConstantObject(fromDictionary: self.toDictionary() as NSDictionary)
    }
    public override var description: String{
        var description: String = "<TConstantObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"is_default\" : \(is_default?.description ?? "nil");"
        description += "\n    \"name\" : \(name != nil ? "\"\(name?.description ?? "nil")\"" : "\(name?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TConstantObject?) -> Bool {
        return self == object
    }
    static func == (left: _TConstantObject, right: _TConstantObject) -> Bool {
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
    static func demoObject()-> TConstantObject{
        let obj = TConstantObject(fromDictionary: ["":""])
        obj.is_default = NSNumber(value: Randoms.randomBool())
        obj.name = Randoms.randomFakeName()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        return obj
    }
    static func demoArray()-> [TConstantObject]{
        var arr = [TConstantObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TConstantObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}

#endif

/************************* Mo’min J.Abusaada *************************/
