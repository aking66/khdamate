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

public enum TCalendarAttributes: String {
   case pk_i_id
   case status_name
   case status_name_trans
}

public enum TCalendarRelationships: String {
   case data
}


public class _TCalendar: NSManagedObject {
   public class var entityName: String {
      return "TCalendar"
   }

   @objc @NSManaged public var pk_i_id: NSNumber?
   @objc @NSManaged public var status_name: String?
   @objc @NSManaged public var status_name_trans: String?

   @objc @NSManaged public var data: NSSet

   static let rKmapping : RKEntityMapping = {
        var TCalendarMapping = RKEntityMapping(forEntityForName: NSStringFromClass(TCalendar.classForCoder()), in: RKObjectManager.shared().managedObjectStore)
        TCalendarMapping?.addAttributeMappings(from: [
                "pk_i_id":"pk_i_id",
                "status_name":"status_name",
                "status_name_trans":"status_name_trans",

            ])
        TCalendarMapping?.identificationAttributes = ["pk_i_id"]
        return TCalendarMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
        TCalendar.rKmapping.addPropertyMapping(RKRelationshipMapping(fromKeyPath:"data", toKeyPath: "data" , with: TOrder.rKmapping))
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["pk_i_id"] = pk_i_id
        dictionary["status_name"] = status_name
        dictionary["status_name_trans"] = status_name_trans

        do {
            var dictionaryElements = [[String:Any]]()
            for obj in (data.allObjects as? [TOrder] ?? []) {
                dictionaryElements.append(obj.toDictionary())
            }
            dictionary["data"] = dictionaryElements
        }

        return dictionary
    }

    func toNonDBObject() -> TCalendarObject {
       let obj = TCalendarObject()
       obj.pk_i_id = self.pk_i_id
       obj.status_name = self.status_name
       obj.status_name_trans = self.status_name_trans

       for relObj in self.data.allObjects as? [TOrderObject] ?? []{
          obj.data.append(relObj)
       }
       return obj
    }
    public override var description: String{
        var description: String = "<TCalendar: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"status_name\" : \(status_name != nil ? "\"\(status_name?.description ?? "nil")\"" : "\(status_name?.description ?? "nil")");"
        description += "\n    \"status_name_trans\" : \(status_name_trans != nil ? "\"\(status_name_trans?.description ?? "nil")\"" : "\(status_name_trans?.description ?? "nil")");"
        description += "\n    data = [TOrder].count = \(data.count);"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TCalendar?) -> Bool {
        return self == object
    }
    static func == (left: _TCalendar, right: _TCalendar) -> Bool {
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
    static func demoObject()-> TCalendar?{
        let obj = TCalendar.mr_createEntity()
        obj?.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj?.status_name = Randoms.randomFakeName()
        obj?.status_name_trans = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TCalendar]{
        var arr = [TCalendar]()
        for _ in 1...GlobalConstants.API_PageSize {
            if let usr = TCalendar.demoObject() {
                for _ in 1...GlobalConstants.API_PageSize {
                    usr.data.append(TOrderObject.demoObject())
                }
                arr.append(usr)
            }
        }
        return arr
    }
    #endif

}





public class _TCalendarObject: NSObject {
   public class var entityName: String {
      return "TCalendarObject"
   }

   @objc public var pk_i_id: NSNumber?
   @objc public var status_name: String?
   @objc public var status_name_trans: String?

   @objc public var data = [TOrderObject]()

   static let rKmapping : RKObjectMapping = {
        var TCalendarObjectMapping = RKObjectMapping(for: TCalendarObject.classForCoder())
        TCalendarObjectMapping?.addAttributeMappings(from: [
                "pk_i_id":"pk_i_id",
                "status_name":"status_name",
                "status_name_trans":"status_name_trans",

            ])
        return TCalendarObjectMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
        TCalendarObject.rKmapping.addPropertyMapping(RKRelationshipMapping(fromKeyPath:"data", toKeyPath: "data" , with: TOrderObject.rKmapping))
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["pk_i_id"] = pk_i_id
        dictionary["status_name"] = status_name
        dictionary["status_name_trans"] = status_name_trans

        do {
            var dictionaryElements = [[String:Any]]()
            for obj in data {
                dictionaryElements.append(obj.toDictionary())
            }
            dictionary["data"] = dictionaryElements
        }

        return dictionary
    }

    public override var description: String{
        var description: String = "<TCalendarObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"status_name\" : \(status_name != nil ? "\"\(status_name?.description ?? "nil")\"" : "\(status_name?.description ?? "nil")");"
        description += "\n    \"status_name_trans\" : \(status_name_trans != nil ? "\"\(status_name_trans?.description ?? "nil")\"" : "\(status_name_trans?.description ?? "nil")");"
        description += "\n    data = [TOrderObject].count = \(data.count);"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TCalendarObject?) -> Bool {
        return self == object
    }
    static func == (left: _TCalendarObject, right: _TCalendarObject) -> Bool {
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
    static func demoObject()-> TCalendarObject{
        let obj = TCalendarObject()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.status_name = Randoms.randomFakeName()
        obj.status_name_trans = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TCalendarObject]{
        var arr = [TCalendarObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TCalendarObject.demoObject()
            for _ in 1...GlobalConstants.API_PageSize {
                obj.data.append(TOrderObject.demoObject())
            }
            arr.append(obj)
        }
        return arr
    }
    #endif

}


#elseif canImport(Alamofire)
public class _TCalendarObject: NSObject,NSCoding,NSCopying {
    @objc public var pk_i_id: NSNumber?
    @objc public var status_name: String?
    @objc public var status_name_trans: String?

    @objc public var data = [TOrderObject]()

    init(fromDictionary dictionary: NSDictionary){
        pk_i_id = dictionary.value(forKeyPath: "pk_i_id") as? NSNumber
        status_name = dictionary.value(forKeyPath: "status_name") as? String
        status_name_trans = dictionary.value(forKeyPath: "status_name_trans") as? String

        if let arr = dictionary["data"] as? [NSDictionary]{
            for dic in arr{
                let value = TOrderObject(fromDictionary: dic)
                data.append(value)
            }
        }
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["pk_i_id"] = pk_i_id
        dictionary["status_name"] = status_name
        dictionary["status_name_trans"] = status_name_trans

        do {
            var dictionaryElements = [[String:Any]]()
            for obj in data {
                dictionaryElements.append(obj.toDictionary())
            }
            dictionary["data"] = dictionaryElements
        }

        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder){
        pk_i_id = aDecoder.decodeObject(forKey:"pk_i_id") as? NSNumber
        status_name = aDecoder.decodeObject(forKey:"status_name") as? String
        status_name_trans = aDecoder.decodeObject(forKey:"status_name_trans") as? String

        data = aDecoder.decodeObject(forKey:"data") as? [TOrderObject] ?? [TOrderObject]()
    }

    @objc public func encode(with aCoder: NSCoder){
        if pk_i_id != nil{
            aCoder.encode(pk_i_id, forKey: "pk_i_id")
        }
        if status_name != nil{
            aCoder.encode(status_name, forKey: "status_name")
        }
        if status_name_trans != nil{
            aCoder.encode(status_name_trans, forKey: "status_name_trans")
        }

        if data != nil{
            aCoder.encode(data, forKey: "data")
        }
    }
    public func copy(with zone: NSZone? = nil) -> Any {
        return TCalendarObject(fromDictionary: self.toDictionary() as NSDictionary)
    }
    public override var description: String{
        var description: String = "<TCalendarObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"status_name\" : \(status_name != nil ? "\"\(status_name?.description ?? "nil")\"" : "\(status_name?.description ?? "nil")");"
        description += "\n    \"status_name_trans\" : \(status_name_trans != nil ? "\"\(status_name_trans?.description ?? "nil")\"" : "\(status_name_trans?.description ?? "nil")");"
        description += "\n    data = [TOrderObject].count = \(data.count);"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TCalendarObject?) -> Bool {
        return self == object
    }
    static func == (left: _TCalendarObject, right: _TCalendarObject) -> Bool {
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
    static func demoObject()-> TCalendarObject{
        let obj = TCalendarObject(fromDictionary: ["":""])
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.status_name = Randoms.randomFakeName()
        obj.status_name_trans = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TCalendarObject]{
        var arr = [TCalendarObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TCalendarObject.demoObject()
            for _ in 1...GlobalConstants.API_PageSize {
                obj.data.append(TOrderObject.demoObject())
            }
            arr.append(obj)
        }
        return arr
    }
    #endif

}

#endif

/************************* Mo’min J.Abusaada *************************/
