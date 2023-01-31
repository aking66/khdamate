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

public enum TBaseModelAttributes: String {
   case pk_i_id
}



public class _TBaseModel: NSManagedObject {
   public class var entityName: String {
      return "TBaseModel"
   }

   @objc @NSManaged public var pk_i_id: NSNumber?


   static let rKmapping : RKEntityMapping = {
        var TBaseModelMapping = RKEntityMapping(forEntityForName: NSStringFromClass(TBaseModel.classForCoder()), in: RKObjectManager.shared().managedObjectStore)
        TBaseModelMapping?.addAttributeMappings(from: [
                "pk_i_id":"pk_i_id",

            ])
        TBaseModelMapping?.identificationAttributes = ["pk_i_id"]
        return TBaseModelMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["pk_i_id"] = pk_i_id


        return dictionary
    }

    func toNonDBObject() -> TBaseModelObject {
       let obj = TBaseModelObject()
       obj.pk_i_id = self.pk_i_id

       return obj
    }
    public override var description: String{
        var description: String = "<TBaseModel: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TBaseModel?) -> Bool {
        return self == object
    }
    static func == (left: _TBaseModel, right: _TBaseModel) -> Bool {
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
    static func demoObject()-> TBaseModel?{
        let obj = TBaseModel.mr_createEntity()
        obj?.pk_i_id = NSNumber(value: Randoms.randomInt32())
        return obj
    }
    static func demoArray()-> [TBaseModel]{
        var arr = [TBaseModel]()
        for _ in 1...GlobalConstants.API_PageSize {
            if let usr = TBaseModel.demoObject() {
                arr.append(usr)
            }
        }
        return arr
    }
    #endif

}





public class _TBaseModelObject: NSObject {
   public class var entityName: String {
      return "TBaseModelObject"
   }

   @objc public var pk_i_id: NSNumber?


   static let rKmapping : RKObjectMapping = {
        var TBaseModelObjectMapping = RKObjectMapping(for: TBaseModelObject.classForCoder())
        TBaseModelObjectMapping?.addAttributeMappings(from: [
                "pk_i_id":"pk_i_id",

            ])
        return TBaseModelObjectMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["pk_i_id"] = pk_i_id


        return dictionary
    }

    public override var description: String{
        var description: String = "<TBaseModelObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TBaseModelObject?) -> Bool {
        return self == object
    }
    static func == (left: _TBaseModelObject, right: _TBaseModelObject) -> Bool {
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
    static func demoObject()-> TBaseModelObject{
        let obj = TBaseModelObject()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        return obj
    }
    static func demoArray()-> [TBaseModelObject]{
        var arr = [TBaseModelObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TBaseModelObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}


#elseif canImport(Alamofire)
public class _TBaseModelObject: NSObject,NSCoding,NSCopying {
    @objc public var pk_i_id: NSNumber?


    init(fromDictionary dictionary: NSDictionary){
        pk_i_id = dictionary.value(forKeyPath: "pk_i_id") as? NSNumber

    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["pk_i_id"] = pk_i_id


        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder){
        pk_i_id = aDecoder.decodeObject(forKey:"pk_i_id") as? NSNumber

    }

    @objc public func encode(with aCoder: NSCoder){
        if pk_i_id != nil{
            aCoder.encode(pk_i_id, forKey: "pk_i_id")
        }

    }
    public func copy(with zone: NSZone? = nil) -> Any {
        return TBaseModelObject(fromDictionary: self.toDictionary() as NSDictionary)
    }
    public override var description: String{
        var description: String = "<TBaseModelObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TBaseModelObject?) -> Bool {
        return self == object
    }
    static func == (left: _TBaseModelObject, right: _TBaseModelObject) -> Bool {
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
    static func demoObject()-> TBaseModelObject{
        let obj = TBaseModelObject(fromDictionary: ["":""])
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        return obj
    }
    static func demoArray()-> [TBaseModelObject]{
        var arr = [TBaseModelObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TBaseModelObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}

#endif

/************************* Mo’min J.Abusaada *************************/
