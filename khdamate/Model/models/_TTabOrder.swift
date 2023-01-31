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

public enum TTabOrderAttributes: String {
   case date
   case pk_i_id
}

public enum TTabOrderRelationships: String {
   case items
}


public class _TTabOrder: NSManagedObject {
   public class var entityName: String {
      return "TTabOrder"
   }

   @objc @NSManaged public var date: String?
   @objc @NSManaged public var pk_i_id: NSNumber?

   @objc @NSManaged public var items: NSSet

   static let rKmapping : RKEntityMapping = {
        var TTabOrderMapping = RKEntityMapping(forEntityForName: NSStringFromClass(TTabOrder.classForCoder()), in: RKObjectManager.shared().managedObjectStore)
        TTabOrderMapping?.addAttributeMappings(from: [
                "date":"date",
                "pk_i_id":"pk_i_id",

            ])
        TTabOrderMapping?.identificationAttributes = ["pk_i_id"]
        return TTabOrderMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
        TTabOrder.rKmapping.addPropertyMapping(RKRelationshipMapping(fromKeyPath:"items", toKeyPath: "items" , with: TOrder.rKmapping))
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["date"] = date
        dictionary["pk_i_id"] = pk_i_id

        do {
            var dictionaryElements = [[String:Any]]()
            for obj in (items.allObjects as? [TOrder] ?? []) {
                dictionaryElements.append(obj.toDictionary())
            }
            dictionary["items"] = dictionaryElements
        }

        return dictionary
    }

    func toNonDBObject() -> TTabOrderObject {
       let obj = TTabOrderObject()
       obj.date = self.date
       obj.pk_i_id = self.pk_i_id

       for relObj in self.items.allObjects as? [TOrderObject] ?? []{
          obj.items.append(relObj)
       }
       return obj
    }
    public override var description: String{
        var description: String = "<TTabOrder: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"date\" : \(date != nil ? "\"\(date?.description ?? "nil")\"" : "\(date?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    items = [TOrder].count = \(items.count);"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TTabOrder?) -> Bool {
        return self == object
    }
    static func == (left: _TTabOrder, right: _TTabOrder) -> Bool {
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
    static func demoObject()-> TTabOrder?{
        let obj = TTabOrder.mr_createEntity()
        obj?.date = Randoms.randomFakeName()
        obj?.pk_i_id = NSNumber(value: Randoms.randomInt32())
        return obj
    }
    static func demoArray()-> [TTabOrder]{
        var arr = [TTabOrder]()
        for _ in 1...GlobalConstants.API_PageSize {
            if let usr = TTabOrder.demoObject() {
                for _ in 1...GlobalConstants.API_PageSize {
                    usr.items.append(TOrderObject.demoObject())
                }
                arr.append(usr)
            }
        }
        return arr
    }
    #endif

}





public class _TTabOrderObject: NSObject {
   public class var entityName: String {
      return "TTabOrderObject"
   }

   @objc public var date: String?
   @objc public var pk_i_id: NSNumber?

   @objc public var items = [TOrderObject]()

   static let rKmapping : RKObjectMapping = {
        var TTabOrderObjectMapping = RKObjectMapping(for: TTabOrderObject.classForCoder())
        TTabOrderObjectMapping?.addAttributeMappings(from: [
                "date":"date",
                "pk_i_id":"pk_i_id",

            ])
        return TTabOrderObjectMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
        TTabOrderObject.rKmapping.addPropertyMapping(RKRelationshipMapping(fromKeyPath:"items", toKeyPath: "items" , with: TOrderObject.rKmapping))
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["date"] = date
        dictionary["pk_i_id"] = pk_i_id

        do {
            var dictionaryElements = [[String:Any]]()
            for obj in items {
                dictionaryElements.append(obj.toDictionary())
            }
            dictionary["items"] = dictionaryElements
        }

        return dictionary
    }

    public override var description: String{
        var description: String = "<TTabOrderObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"date\" : \(date != nil ? "\"\(date?.description ?? "nil")\"" : "\(date?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    items = [TOrderObject].count = \(items.count);"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TTabOrderObject?) -> Bool {
        return self == object
    }
    static func == (left: _TTabOrderObject, right: _TTabOrderObject) -> Bool {
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
    static func demoObject()-> TTabOrderObject{
        let obj = TTabOrderObject()
        obj.date = Randoms.randomFakeName()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        return obj
    }
    static func demoArray()-> [TTabOrderObject]{
        var arr = [TTabOrderObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TTabOrderObject.demoObject()
            for _ in 1...GlobalConstants.API_PageSize {
                obj.items.append(TOrderObject.demoObject())
            }
            arr.append(obj)
        }
        return arr
    }
    #endif

}


#elseif canImport(Alamofire)
public class _TTabOrderObject: NSObject,NSCoding,NSCopying {
    @objc public var date: String?
    @objc public var pk_i_id: NSNumber?

    @objc public var items = [TOrderObject]()

    init(fromDictionary dictionary: NSDictionary){
        date = dictionary.value(forKeyPath: "date") as? String
        pk_i_id = dictionary.value(forKeyPath: "pk_i_id") as? NSNumber

        if let arr = dictionary["items"] as? [NSDictionary]{
            for dic in arr{
                let value = TOrderObject(fromDictionary: dic)
                items.append(value)
            }
        }
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["date"] = date
        dictionary["pk_i_id"] = pk_i_id

        do {
            var dictionaryElements = [[String:Any]]()
            for obj in items {
                dictionaryElements.append(obj.toDictionary())
            }
            dictionary["items"] = dictionaryElements
        }

        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder){
        date = aDecoder.decodeObject(forKey:"date") as? String
        pk_i_id = aDecoder.decodeObject(forKey:"pk_i_id") as? NSNumber

        items = aDecoder.decodeObject(forKey:"items") as? [TOrderObject] ?? [TOrderObject]()
    }

    @objc public func encode(with aCoder: NSCoder){
        if date != nil{
            aCoder.encode(date, forKey: "date")
        }
        if pk_i_id != nil{
            aCoder.encode(pk_i_id, forKey: "pk_i_id")
        }

        if items != nil{
            aCoder.encode(items, forKey: "items")
        }
    }
    public func copy(with zone: NSZone? = nil) -> Any {
        return TTabOrderObject(fromDictionary: self.toDictionary() as NSDictionary)
    }
    public override var description: String{
        var description: String = "<TTabOrderObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"date\" : \(date != nil ? "\"\(date?.description ?? "nil")\"" : "\(date?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    items = [TOrderObject].count = \(items.count);"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TTabOrderObject?) -> Bool {
        return self == object
    }
    static func == (left: _TTabOrderObject, right: _TTabOrderObject) -> Bool {
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
    static func demoObject()-> TTabOrderObject{
        let obj = TTabOrderObject(fromDictionary: ["":""])
        obj.date = Randoms.randomFakeName()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        return obj
    }
    static func demoArray()-> [TTabOrderObject]{
        var arr = [TTabOrderObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TTabOrderObject.demoObject()
            for _ in 1...GlobalConstants.API_PageSize {
                obj.items.append(TOrderObject.demoObject())
            }
            arr.append(obj)
        }
        return arr
    }
    #endif

}

#endif

/************************* Mo’min J.Abusaada *************************/
