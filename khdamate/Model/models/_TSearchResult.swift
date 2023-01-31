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

public enum TSearchResultAttributes: String {
   case name
   case pk_i_id
}

public enum TSearchResultRelationships: String {
   case service_details
}


public class _TSearchResult: NSManagedObject {
   public class var entityName: String {
      return "TSearchResult"
   }

   @objc @NSManaged public var name: String?
   @objc @NSManaged public var pk_i_id: NSNumber?

   @objc @NSManaged public var service_details: NSSet

   static let rKmapping : RKEntityMapping = {
        var TSearchResultMapping = RKEntityMapping(forEntityForName: NSStringFromClass(TSearchResult.classForCoder()), in: RKObjectManager.shared().managedObjectStore)
        TSearchResultMapping?.addAttributeMappings(from: [
                "name":"name",
                "id":"pk_i_id",

            ])
        TSearchResultMapping?.identificationAttributes = ["pk_i_id"]
        return TSearchResultMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
        TSearchResult.rKmapping.addPropertyMapping(RKRelationshipMapping(fromKeyPath:"service_details", toKeyPath: "service_details" , with: TService.rKmapping))
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["name"] = name
        dictionary["id"] = pk_i_id

        do {
            var dictionaryElements = [[String:Any]]()
            for obj in (service_details.allObjects as? [TService] ?? []) {
                dictionaryElements.append(obj.toDictionary())
            }
            dictionary["service_details"] = dictionaryElements
        }

        return dictionary
    }

    func toNonDBObject() -> TSearchResultObject {
       let obj = TSearchResultObject()
       obj.name = self.name
       obj.pk_i_id = self.pk_i_id

       for relObj in self.service_details.allObjects as? [TServiceObject] ?? []{
          obj.service_details.append(relObj)
       }
       return obj
    }
    public override var description: String{
        var description: String = "<TSearchResult: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"name\" : \(name != nil ? "\"\(name?.description ?? "nil")\"" : "\(name?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    service_details = [TService].count = \(service_details.count);"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TSearchResult?) -> Bool {
        return self == object
    }
    static func == (left: _TSearchResult, right: _TSearchResult) -> Bool {
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
    static func demoObject()-> TSearchResult?{
        let obj = TSearchResult.mr_createEntity()
        obj?.name = Randoms.randomFakeName()
        obj?.pk_i_id = NSNumber(value: Randoms.randomInt32())
        return obj
    }
    static func demoArray()-> [TSearchResult]{
        var arr = [TSearchResult]()
        for _ in 1...GlobalConstants.API_PageSize {
            if let usr = TSearchResult.demoObject() {
                for _ in 1...GlobalConstants.API_PageSize {
                    usr.service_details.append(TServiceObject.demoObject())
                }
                arr.append(usr)
            }
        }
        return arr
    }
    #endif

}





public class _TSearchResultObject: NSObject {
   public class var entityName: String {
      return "TSearchResultObject"
   }

   @objc public var name: String?
   @objc public var pk_i_id: NSNumber?

   @objc public var service_details = [TServiceObject]()

   static let rKmapping : RKObjectMapping = {
        var TSearchResultObjectMapping = RKObjectMapping(for: TSearchResultObject.classForCoder())
        TSearchResultObjectMapping?.addAttributeMappings(from: [
                "name":"name",
                "id":"pk_i_id",

            ])
        return TSearchResultObjectMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
        TSearchResultObject.rKmapping.addPropertyMapping(RKRelationshipMapping(fromKeyPath:"service_details", toKeyPath: "service_details" , with: TServiceObject.rKmapping))
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["name"] = name
        dictionary["id"] = pk_i_id

        do {
            var dictionaryElements = [[String:Any]]()
            for obj in service_details {
                dictionaryElements.append(obj.toDictionary())
            }
            dictionary["service_details"] = dictionaryElements
        }

        return dictionary
    }

    public override var description: String{
        var description: String = "<TSearchResultObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"name\" : \(name != nil ? "\"\(name?.description ?? "nil")\"" : "\(name?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    service_details = [TServiceObject].count = \(service_details.count);"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TSearchResultObject?) -> Bool {
        return self == object
    }
    static func == (left: _TSearchResultObject, right: _TSearchResultObject) -> Bool {
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
    static func demoObject()-> TSearchResultObject{
        let obj = TSearchResultObject()
        obj.name = Randoms.randomFakeName()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        return obj
    }
    static func demoArray()-> [TSearchResultObject]{
        var arr = [TSearchResultObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TSearchResultObject.demoObject()
            for _ in 1...GlobalConstants.API_PageSize {
                obj.service_details.append(TServiceObject.demoObject())
            }
            arr.append(obj)
        }
        return arr
    }
    #endif

}


#elseif canImport(Alamofire)
public class _TSearchResultObject: NSObject,NSCoding,NSCopying {
    @objc public var name: String?
    @objc public var pk_i_id: NSNumber?

    @objc public var service_details = [TServiceObject]()

    init(fromDictionary dictionary: NSDictionary){
        name = dictionary.value(forKeyPath: "name") as? String
        pk_i_id = dictionary.value(forKeyPath: "id") as? NSNumber

        if let arr = dictionary["service_details"] as? [NSDictionary]{
            for dic in arr{
                let value = TServiceObject(fromDictionary: dic)
                service_details.append(value)
            }
        }
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["name"] = name
        dictionary["id"] = pk_i_id

        do {
            var dictionaryElements = [[String:Any]]()
            for obj in service_details {
                dictionaryElements.append(obj.toDictionary())
            }
            dictionary["service_details"] = dictionaryElements
        }

        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder){
        name = aDecoder.decodeObject(forKey:"name") as? String
        pk_i_id = aDecoder.decodeObject(forKey:"id") as? NSNumber

        service_details = aDecoder.decodeObject(forKey:"service_details") as? [TServiceObject] ?? [TServiceObject]()
    }

    @objc public func encode(with aCoder: NSCoder){
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if pk_i_id != nil{
            aCoder.encode(pk_i_id, forKey: "id")
        }

        if service_details != nil{
            aCoder.encode(service_details, forKey: "service_details")
        }
    }
    public func copy(with zone: NSZone? = nil) -> Any {
        return TSearchResultObject(fromDictionary: self.toDictionary() as NSDictionary)
    }
    public override var description: String{
        var description: String = "<TSearchResultObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"name\" : \(name != nil ? "\"\(name?.description ?? "nil")\"" : "\(name?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    service_details = [TServiceObject].count = \(service_details.count);"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TSearchResultObject?) -> Bool {
        return self == object
    }
    static func == (left: _TSearchResultObject, right: _TSearchResultObject) -> Bool {
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
    static func demoObject()-> TSearchResultObject{
        let obj = TSearchResultObject(fromDictionary: ["":""])
        obj.name = Randoms.randomFakeName()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        return obj
    }
    static func demoArray()-> [TSearchResultObject]{
        var arr = [TSearchResultObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TSearchResultObject.demoObject()
            for _ in 1...GlobalConstants.API_PageSize {
                obj.service_details.append(TServiceObject.demoObject())
            }
            arr.append(obj)
        }
        return arr
    }
    #endif

}

#endif

/************************* Mo’min J.Abusaada *************************/
