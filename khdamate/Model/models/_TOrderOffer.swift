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

public enum TOrderOfferAttributes: String {
   case i_order_id
   case i_order_no
   case pk_i_id
}

public enum TOrderOfferRelationships: String {
   case offers
}


public class _TOrderOffer: NSManagedObject {
   public class var entityName: String {
      return "TOrderOffer"
   }

   @objc @NSManaged public var i_order_id: NSNumber?
   @objc @NSManaged public var i_order_no: NSNumber?
   @objc @NSManaged public var pk_i_id: NSNumber?

   @objc @NSManaged public var offers: NSSet

   static let rKmapping : RKEntityMapping = {
        var TOrderOfferMapping = RKEntityMapping(forEntityForName: NSStringFromClass(TOrderOffer.classForCoder()), in: RKObjectManager.shared().managedObjectStore)
        TOrderOfferMapping?.addAttributeMappings(from: [
                "order_id":"i_order_id",
                "order_no":"i_order_no",
                "id":"pk_i_id",

            ])
        TOrderOfferMapping?.identificationAttributes = ["pk_i_id"]
        return TOrderOfferMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
        TOrderOffer.rKmapping.addPropertyMapping(RKRelationshipMapping(fromKeyPath:"offers", toKeyPath: "offers" , with: TOffer.rKmapping))
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["order_id"] = i_order_id
        dictionary["order_no"] = i_order_no
        dictionary["id"] = pk_i_id

        do {
            var dictionaryElements = [[String:Any]]()
            for obj in (offers.allObjects as? [TOffer] ?? []) {
                dictionaryElements.append(obj.toDictionary())
            }
            dictionary["offers"] = dictionaryElements
        }

        return dictionary
    }

    func toNonDBObject() -> TOrderOfferObject {
       let obj = TOrderOfferObject()
       obj.i_order_id = self.i_order_id
       obj.i_order_no = self.i_order_no
       obj.pk_i_id = self.pk_i_id

       for relObj in self.offers.allObjects as? [TOfferObject] ?? []{
          obj.offers.append(relObj)
       }
       return obj
    }
    public override var description: String{
        var description: String = "<TOrderOffer: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"i_order_id\" : \(i_order_id?.description ?? "nil");"
        description += "\n    \"i_order_no\" : \(i_order_no?.description ?? "nil");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    offers = [TOffer].count = \(offers.count);"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TOrderOffer?) -> Bool {
        return self == object
    }
    static func == (left: _TOrderOffer, right: _TOrderOffer) -> Bool {
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
    static func demoObject()-> TOrderOffer?{
        let obj = TOrderOffer.mr_createEntity()
        obj?.i_order_id = NSNumber(value: Randoms.randomInt32())
        obj?.i_order_no = NSNumber(value: Randoms.randomInt32())
        obj?.pk_i_id = NSNumber(value: Randoms.randomInt32())
        return obj
    }
    static func demoArray()-> [TOrderOffer]{
        var arr = [TOrderOffer]()
        for _ in 1...GlobalConstants.API_PageSize {
            if let usr = TOrderOffer.demoObject() {
                for _ in 1...GlobalConstants.API_PageSize {
                    usr.offers.append(TOfferObject.demoObject())
                }
                arr.append(usr)
            }
        }
        return arr
    }
    #endif

}





public class _TOrderOfferObject: NSObject {
   public class var entityName: String {
      return "TOrderOfferObject"
   }

   @objc public var i_order_id: NSNumber?
   @objc public var i_order_no: NSNumber?
   @objc public var pk_i_id: NSNumber?

   @objc public var offers = [TOfferObject]()

   static let rKmapping : RKObjectMapping = {
        var TOrderOfferObjectMapping = RKObjectMapping(for: TOrderOfferObject.classForCoder())
        TOrderOfferObjectMapping?.addAttributeMappings(from: [
                "order_id":"i_order_id",
                "order_no":"i_order_no",
                "id":"pk_i_id",

            ])
        return TOrderOfferObjectMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
        TOrderOfferObject.rKmapping.addPropertyMapping(RKRelationshipMapping(fromKeyPath:"offers", toKeyPath: "offers" , with: TOfferObject.rKmapping))
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["order_id"] = i_order_id
        dictionary["order_no"] = i_order_no
        dictionary["id"] = pk_i_id

        do {
            var dictionaryElements = [[String:Any]]()
            for obj in offers {
                dictionaryElements.append(obj.toDictionary())
            }
            dictionary["offers"] = dictionaryElements
        }

        return dictionary
    }

    public override var description: String{
        var description: String = "<TOrderOfferObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"i_order_id\" : \(i_order_id?.description ?? "nil");"
        description += "\n    \"i_order_no\" : \(i_order_no?.description ?? "nil");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    offers = [TOfferObject].count = \(offers.count);"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TOrderOfferObject?) -> Bool {
        return self == object
    }
    static func == (left: _TOrderOfferObject, right: _TOrderOfferObject) -> Bool {
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
    static func demoObject()-> TOrderOfferObject{
        let obj = TOrderOfferObject()
        obj.i_order_id = NSNumber(value: Randoms.randomInt32())
        obj.i_order_no = NSNumber(value: Randoms.randomInt32())
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        return obj
    }
    static func demoArray()-> [TOrderOfferObject]{
        var arr = [TOrderOfferObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TOrderOfferObject.demoObject()
            for _ in 1...GlobalConstants.API_PageSize {
                obj.offers.append(TOfferObject.demoObject())
            }
            arr.append(obj)
        }
        return arr
    }
    #endif

}


#elseif canImport(Alamofire)
public class _TOrderOfferObject: NSObject,NSCoding,NSCopying {
    @objc public var i_order_id: NSNumber?
    @objc public var i_order_no: NSNumber?
    @objc public var pk_i_id: NSNumber?

    @objc public var offers = [TOfferObject]()

    init(fromDictionary dictionary: NSDictionary){
        i_order_id = dictionary.value(forKeyPath: "order_id") as? NSNumber
        i_order_no = dictionary.value(forKeyPath: "order_no") as? NSNumber
        pk_i_id = dictionary.value(forKeyPath: "id") as? NSNumber

        if let arr = dictionary["offers"] as? [NSDictionary]{
            for dic in arr{
                let value = TOfferObject(fromDictionary: dic)
                offers.append(value)
            }
        }
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["order_id"] = i_order_id
        dictionary["order_no"] = i_order_no
        dictionary["id"] = pk_i_id

        do {
            var dictionaryElements = [[String:Any]]()
            for obj in offers {
                dictionaryElements.append(obj.toDictionary())
            }
            dictionary["offers"] = dictionaryElements
        }

        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder){
        i_order_id = aDecoder.decodeObject(forKey:"order_id") as? NSNumber
        i_order_no = aDecoder.decodeObject(forKey:"order_no") as? NSNumber
        pk_i_id = aDecoder.decodeObject(forKey:"id") as? NSNumber

        offers = aDecoder.decodeObject(forKey:"offers") as? [TOfferObject] ?? [TOfferObject]()
    }

    @objc public func encode(with aCoder: NSCoder){
        if i_order_id != nil{
            aCoder.encode(i_order_id, forKey: "order_id")
        }
        if i_order_no != nil{
            aCoder.encode(i_order_no, forKey: "order_no")
        }
        if pk_i_id != nil{
            aCoder.encode(pk_i_id, forKey: "id")
        }

        if offers != nil{
            aCoder.encode(offers, forKey: "offers")
        }
    }
    public func copy(with zone: NSZone? = nil) -> Any {
        return TOrderOfferObject(fromDictionary: self.toDictionary() as NSDictionary)
    }
    public override var description: String{
        var description: String = "<TOrderOfferObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"i_order_id\" : \(i_order_id?.description ?? "nil");"
        description += "\n    \"i_order_no\" : \(i_order_no?.description ?? "nil");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    offers = [TOfferObject].count = \(offers.count);"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TOrderOfferObject?) -> Bool {
        return self == object
    }
    static func == (left: _TOrderOfferObject, right: _TOrderOfferObject) -> Bool {
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
    static func demoObject()-> TOrderOfferObject{
        let obj = TOrderOfferObject(fromDictionary: ["":""])
        obj.i_order_id = NSNumber(value: Randoms.randomInt32())
        obj.i_order_no = NSNumber(value: Randoms.randomInt32())
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        return obj
    }
    static func demoArray()-> [TOrderOfferObject]{
        var arr = [TOrderOfferObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TOrderOfferObject.demoObject()
            for _ in 1...GlobalConstants.API_PageSize {
                obj.offers.append(TOfferObject.demoObject())
            }
            arr.append(obj)
        }
        return arr
    }
    #endif

}

#endif

/************************* Mo’min J.Abusaada *************************/
