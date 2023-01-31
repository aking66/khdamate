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

public enum TOrderActionsAttributes: String {
   case b_driver_arrived_customer
   case b_driver_arrived_provider
   case b_enable_financial_support
   case b_financial_support_accepted
   case b_financial_support_completed
   case b_financial_support_requested
   case b_invoice_accepted
   case b_invoice_added
   case b_on_the_way_to_delivery
   case b_purchase_done
   case pk_i_id
}



public class _TOrderActions: NSManagedObject {
   public class var entityName: String {
      return "TOrderActions"
   }

   @objc @NSManaged public var b_driver_arrived_customer: NSNumber?
   @objc @NSManaged public var b_driver_arrived_provider: NSNumber?
   @objc @NSManaged public var b_enable_financial_support: NSNumber?
   @objc @NSManaged public var b_financial_support_accepted: NSNumber?
   @objc @NSManaged public var b_financial_support_completed: NSNumber?
   @objc @NSManaged public var b_financial_support_requested: NSNumber?
   @objc @NSManaged public var b_invoice_accepted: NSNumber?
   @objc @NSManaged public var b_invoice_added: NSNumber?
   @objc @NSManaged public var b_on_the_way_to_delivery: NSNumber?
   @objc @NSManaged public var b_purchase_done: NSNumber?
   @objc @NSManaged public var pk_i_id: NSNumber?


   static let rKmapping : RKEntityMapping = {
        var TOrderActionsMapping = RKEntityMapping(forEntityForName: NSStringFromClass(TOrderActions.classForCoder()), in: RKObjectManager.shared().managedObjectStore)
        TOrderActionsMapping?.addAttributeMappings(from: [
                "driver_arrived_customer":"b_driver_arrived_customer",
                "driver_arrived_provider":"b_driver_arrived_provider",
                "enable_financial_support":"b_enable_financial_support",
                "financial_support_accepted":"b_financial_support_accepted",
                "financial_support_completed":"b_financial_support_completed",
                "financial_support_requested":"b_financial_support_requested",
                "invoice_accepted":"b_invoice_accepted",
                "invoice_added":"b_invoice_added",
                "on_the_way_to_delivery":"b_on_the_way_to_delivery",
                "purchase_done":"b_purchase_done",
                "pk_i_id":"pk_i_id",

            ])
        TOrderActionsMapping?.identificationAttributes = ["pk_i_id"]
        return TOrderActionsMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["driver_arrived_customer"] = b_driver_arrived_customer
        dictionary["driver_arrived_provider"] = b_driver_arrived_provider
        dictionary["enable_financial_support"] = b_enable_financial_support
        dictionary["financial_support_accepted"] = b_financial_support_accepted
        dictionary["financial_support_completed"] = b_financial_support_completed
        dictionary["financial_support_requested"] = b_financial_support_requested
        dictionary["invoice_accepted"] = b_invoice_accepted
        dictionary["invoice_added"] = b_invoice_added
        dictionary["on_the_way_to_delivery"] = b_on_the_way_to_delivery
        dictionary["purchase_done"] = b_purchase_done
        dictionary["pk_i_id"] = pk_i_id


        return dictionary
    }

    func toNonDBObject() -> TOrderActionsObject {
       let obj = TOrderActionsObject()
       obj.b_driver_arrived_customer = self.b_driver_arrived_customer
       obj.b_driver_arrived_provider = self.b_driver_arrived_provider
       obj.b_enable_financial_support = self.b_enable_financial_support
       obj.b_financial_support_accepted = self.b_financial_support_accepted
       obj.b_financial_support_completed = self.b_financial_support_completed
       obj.b_financial_support_requested = self.b_financial_support_requested
       obj.b_invoice_accepted = self.b_invoice_accepted
       obj.b_invoice_added = self.b_invoice_added
       obj.b_on_the_way_to_delivery = self.b_on_the_way_to_delivery
       obj.b_purchase_done = self.b_purchase_done
       obj.pk_i_id = self.pk_i_id

       return obj
    }
    public override var description: String{
        var description: String = "<TOrderActions: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"b_driver_arrived_customer\" : \(b_driver_arrived_customer?.description ?? "nil");"
        description += "\n    \"b_driver_arrived_provider\" : \(b_driver_arrived_provider?.description ?? "nil");"
        description += "\n    \"b_enable_financial_support\" : \(b_enable_financial_support?.description ?? "nil");"
        description += "\n    \"b_financial_support_accepted\" : \(b_financial_support_accepted?.description ?? "nil");"
        description += "\n    \"b_financial_support_completed\" : \(b_financial_support_completed?.description ?? "nil");"
        description += "\n    \"b_financial_support_requested\" : \(b_financial_support_requested?.description ?? "nil");"
        description += "\n    \"b_invoice_accepted\" : \(b_invoice_accepted?.description ?? "nil");"
        description += "\n    \"b_invoice_added\" : \(b_invoice_added?.description ?? "nil");"
        description += "\n    \"b_on_the_way_to_delivery\" : \(b_on_the_way_to_delivery?.description ?? "nil");"
        description += "\n    \"b_purchase_done\" : \(b_purchase_done?.description ?? "nil");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TOrderActions?) -> Bool {
        return self == object
    }
    static func == (left: _TOrderActions, right: _TOrderActions) -> Bool {
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
    static func demoObject()-> TOrderActions?{
        let obj = TOrderActions.mr_createEntity()
        obj?.b_driver_arrived_customer = NSNumber(value: Randoms.randomBool())
        obj?.b_driver_arrived_provider = NSNumber(value: Randoms.randomBool())
        obj?.b_enable_financial_support = NSNumber(value: Randoms.randomBool())
        obj?.b_financial_support_accepted = NSNumber(value: Randoms.randomBool())
        obj?.b_financial_support_completed = NSNumber(value: Randoms.randomBool())
        obj?.b_financial_support_requested = NSNumber(value: Randoms.randomBool())
        obj?.b_invoice_accepted = NSNumber(value: Randoms.randomBool())
        obj?.b_invoice_added = NSNumber(value: Randoms.randomBool())
        obj?.b_on_the_way_to_delivery = NSNumber(value: Randoms.randomBool())
        obj?.b_purchase_done = NSNumber(value: Randoms.randomBool())
        obj?.pk_i_id = NSNumber(value: Randoms.randomInt32())
        return obj
    }
    static func demoArray()-> [TOrderActions]{
        var arr = [TOrderActions]()
        for _ in 1...GlobalConstants.API_PageSize {
            if let usr = TOrderActions.demoObject() {
                arr.append(usr)
            }
        }
        return arr
    }
    #endif

}





public class _TOrderActionsObject: NSObject {
   public class var entityName: String {
      return "TOrderActionsObject"
   }

   @objc public var b_driver_arrived_customer: NSNumber?
   @objc public var b_driver_arrived_provider: NSNumber?
   @objc public var b_enable_financial_support: NSNumber?
   @objc public var b_financial_support_accepted: NSNumber?
   @objc public var b_financial_support_completed: NSNumber?
   @objc public var b_financial_support_requested: NSNumber?
   @objc public var b_invoice_accepted: NSNumber?
   @objc public var b_invoice_added: NSNumber?
   @objc public var b_on_the_way_to_delivery: NSNumber?
   @objc public var b_purchase_done: NSNumber?
   @objc public var pk_i_id: NSNumber?


   static let rKmapping : RKObjectMapping = {
        var TOrderActionsObjectMapping = RKObjectMapping(for: TOrderActionsObject.classForCoder())
        TOrderActionsObjectMapping?.addAttributeMappings(from: [
                "driver_arrived_customer":"b_driver_arrived_customer",
                "driver_arrived_provider":"b_driver_arrived_provider",
                "enable_financial_support":"b_enable_financial_support",
                "financial_support_accepted":"b_financial_support_accepted",
                "financial_support_completed":"b_financial_support_completed",
                "financial_support_requested":"b_financial_support_requested",
                "invoice_accepted":"b_invoice_accepted",
                "invoice_added":"b_invoice_added",
                "on_the_way_to_delivery":"b_on_the_way_to_delivery",
                "purchase_done":"b_purchase_done",
                "pk_i_id":"pk_i_id",

            ])
        return TOrderActionsObjectMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["driver_arrived_customer"] = b_driver_arrived_customer
        dictionary["driver_arrived_provider"] = b_driver_arrived_provider
        dictionary["enable_financial_support"] = b_enable_financial_support
        dictionary["financial_support_accepted"] = b_financial_support_accepted
        dictionary["financial_support_completed"] = b_financial_support_completed
        dictionary["financial_support_requested"] = b_financial_support_requested
        dictionary["invoice_accepted"] = b_invoice_accepted
        dictionary["invoice_added"] = b_invoice_added
        dictionary["on_the_way_to_delivery"] = b_on_the_way_to_delivery
        dictionary["purchase_done"] = b_purchase_done
        dictionary["pk_i_id"] = pk_i_id


        return dictionary
    }

    public override var description: String{
        var description: String = "<TOrderActionsObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"b_driver_arrived_customer\" : \(b_driver_arrived_customer?.description ?? "nil");"
        description += "\n    \"b_driver_arrived_provider\" : \(b_driver_arrived_provider?.description ?? "nil");"
        description += "\n    \"b_enable_financial_support\" : \(b_enable_financial_support?.description ?? "nil");"
        description += "\n    \"b_financial_support_accepted\" : \(b_financial_support_accepted?.description ?? "nil");"
        description += "\n    \"b_financial_support_completed\" : \(b_financial_support_completed?.description ?? "nil");"
        description += "\n    \"b_financial_support_requested\" : \(b_financial_support_requested?.description ?? "nil");"
        description += "\n    \"b_invoice_accepted\" : \(b_invoice_accepted?.description ?? "nil");"
        description += "\n    \"b_invoice_added\" : \(b_invoice_added?.description ?? "nil");"
        description += "\n    \"b_on_the_way_to_delivery\" : \(b_on_the_way_to_delivery?.description ?? "nil");"
        description += "\n    \"b_purchase_done\" : \(b_purchase_done?.description ?? "nil");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TOrderActionsObject?) -> Bool {
        return self == object
    }
    static func == (left: _TOrderActionsObject, right: _TOrderActionsObject) -> Bool {
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
    static func demoObject()-> TOrderActionsObject{
        let obj = TOrderActionsObject()
        obj.b_driver_arrived_customer = NSNumber(value: Randoms.randomBool())
        obj.b_driver_arrived_provider = NSNumber(value: Randoms.randomBool())
        obj.b_enable_financial_support = NSNumber(value: Randoms.randomBool())
        obj.b_financial_support_accepted = NSNumber(value: Randoms.randomBool())
        obj.b_financial_support_completed = NSNumber(value: Randoms.randomBool())
        obj.b_financial_support_requested = NSNumber(value: Randoms.randomBool())
        obj.b_invoice_accepted = NSNumber(value: Randoms.randomBool())
        obj.b_invoice_added = NSNumber(value: Randoms.randomBool())
        obj.b_on_the_way_to_delivery = NSNumber(value: Randoms.randomBool())
        obj.b_purchase_done = NSNumber(value: Randoms.randomBool())
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        return obj
    }
    static func demoArray()-> [TOrderActionsObject]{
        var arr = [TOrderActionsObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TOrderActionsObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}


#elseif canImport(Alamofire)
public class _TOrderActionsObject: NSObject,NSCoding,NSCopying {
    @objc public var b_driver_arrived_customer: NSNumber?
    @objc public var b_driver_arrived_provider: NSNumber?
    @objc public var b_enable_financial_support: NSNumber?
    @objc public var b_financial_support_accepted: NSNumber?
    @objc public var b_financial_support_completed: NSNumber?
    @objc public var b_financial_support_requested: NSNumber?
    @objc public var b_invoice_accepted: NSNumber?
    @objc public var b_invoice_added: NSNumber?
    @objc public var b_on_the_way_to_delivery: NSNumber?
    @objc public var b_purchase_done: NSNumber?
    @objc public var pk_i_id: NSNumber?


    init(fromDictionary dictionary: NSDictionary){
        b_driver_arrived_customer = dictionary.value(forKeyPath: "driver_arrived_customer") as? NSNumber
        b_driver_arrived_provider = dictionary.value(forKeyPath: "driver_arrived_provider") as? NSNumber
        b_enable_financial_support = dictionary.value(forKeyPath: "enable_financial_support") as? NSNumber
        b_financial_support_accepted = dictionary.value(forKeyPath: "financial_support_accepted") as? NSNumber
        b_financial_support_completed = dictionary.value(forKeyPath: "financial_support_completed") as? NSNumber
        b_financial_support_requested = dictionary.value(forKeyPath: "financial_support_requested") as? NSNumber
        b_invoice_accepted = dictionary.value(forKeyPath: "invoice_accepted") as? NSNumber
        b_invoice_added = dictionary.value(forKeyPath: "invoice_added") as? NSNumber
        b_on_the_way_to_delivery = dictionary.value(forKeyPath: "on_the_way_to_delivery") as? NSNumber
        b_purchase_done = dictionary.value(forKeyPath: "purchase_done") as? NSNumber
        pk_i_id = dictionary.value(forKeyPath: "pk_i_id") as? NSNumber

    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["driver_arrived_customer"] = b_driver_arrived_customer
        dictionary["driver_arrived_provider"] = b_driver_arrived_provider
        dictionary["enable_financial_support"] = b_enable_financial_support
        dictionary["financial_support_accepted"] = b_financial_support_accepted
        dictionary["financial_support_completed"] = b_financial_support_completed
        dictionary["financial_support_requested"] = b_financial_support_requested
        dictionary["invoice_accepted"] = b_invoice_accepted
        dictionary["invoice_added"] = b_invoice_added
        dictionary["on_the_way_to_delivery"] = b_on_the_way_to_delivery
        dictionary["purchase_done"] = b_purchase_done
        dictionary["pk_i_id"] = pk_i_id


        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder){
        b_driver_arrived_customer = aDecoder.decodeObject(forKey:"driver_arrived_customer") as? NSNumber
        b_driver_arrived_provider = aDecoder.decodeObject(forKey:"driver_arrived_provider") as? NSNumber
        b_enable_financial_support = aDecoder.decodeObject(forKey:"enable_financial_support") as? NSNumber
        b_financial_support_accepted = aDecoder.decodeObject(forKey:"financial_support_accepted") as? NSNumber
        b_financial_support_completed = aDecoder.decodeObject(forKey:"financial_support_completed") as? NSNumber
        b_financial_support_requested = aDecoder.decodeObject(forKey:"financial_support_requested") as? NSNumber
        b_invoice_accepted = aDecoder.decodeObject(forKey:"invoice_accepted") as? NSNumber
        b_invoice_added = aDecoder.decodeObject(forKey:"invoice_added") as? NSNumber
        b_on_the_way_to_delivery = aDecoder.decodeObject(forKey:"on_the_way_to_delivery") as? NSNumber
        b_purchase_done = aDecoder.decodeObject(forKey:"purchase_done") as? NSNumber
        pk_i_id = aDecoder.decodeObject(forKey:"pk_i_id") as? NSNumber

    }

    @objc public func encode(with aCoder: NSCoder){
        if b_driver_arrived_customer != nil{
            aCoder.encode(b_driver_arrived_customer, forKey: "driver_arrived_customer")
        }
        if b_driver_arrived_provider != nil{
            aCoder.encode(b_driver_arrived_provider, forKey: "driver_arrived_provider")
        }
        if b_enable_financial_support != nil{
            aCoder.encode(b_enable_financial_support, forKey: "enable_financial_support")
        }
        if b_financial_support_accepted != nil{
            aCoder.encode(b_financial_support_accepted, forKey: "financial_support_accepted")
        }
        if b_financial_support_completed != nil{
            aCoder.encode(b_financial_support_completed, forKey: "financial_support_completed")
        }
        if b_financial_support_requested != nil{
            aCoder.encode(b_financial_support_requested, forKey: "financial_support_requested")
        }
        if b_invoice_accepted != nil{
            aCoder.encode(b_invoice_accepted, forKey: "invoice_accepted")
        }
        if b_invoice_added != nil{
            aCoder.encode(b_invoice_added, forKey: "invoice_added")
        }
        if b_on_the_way_to_delivery != nil{
            aCoder.encode(b_on_the_way_to_delivery, forKey: "on_the_way_to_delivery")
        }
        if b_purchase_done != nil{
            aCoder.encode(b_purchase_done, forKey: "purchase_done")
        }
        if pk_i_id != nil{
            aCoder.encode(pk_i_id, forKey: "pk_i_id")
        }

    }
    public func copy(with zone: NSZone? = nil) -> Any {
        return TOrderActionsObject(fromDictionary: self.toDictionary() as NSDictionary)
    }
    public override var description: String{
        var description: String = "<TOrderActionsObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"b_driver_arrived_customer\" : \(b_driver_arrived_customer?.description ?? "nil");"
        description += "\n    \"b_driver_arrived_provider\" : \(b_driver_arrived_provider?.description ?? "nil");"
        description += "\n    \"b_enable_financial_support\" : \(b_enable_financial_support?.description ?? "nil");"
        description += "\n    \"b_financial_support_accepted\" : \(b_financial_support_accepted?.description ?? "nil");"
        description += "\n    \"b_financial_support_completed\" : \(b_financial_support_completed?.description ?? "nil");"
        description += "\n    \"b_financial_support_requested\" : \(b_financial_support_requested?.description ?? "nil");"
        description += "\n    \"b_invoice_accepted\" : \(b_invoice_accepted?.description ?? "nil");"
        description += "\n    \"b_invoice_added\" : \(b_invoice_added?.description ?? "nil");"
        description += "\n    \"b_on_the_way_to_delivery\" : \(b_on_the_way_to_delivery?.description ?? "nil");"
        description += "\n    \"b_purchase_done\" : \(b_purchase_done?.description ?? "nil");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TOrderActionsObject?) -> Bool {
        return self == object
    }
    static func == (left: _TOrderActionsObject, right: _TOrderActionsObject) -> Bool {
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
    static func demoObject()-> TOrderActionsObject{
        let obj = TOrderActionsObject(fromDictionary: ["":""])
        obj.b_driver_arrived_customer = NSNumber(value: Randoms.randomBool())
        obj.b_driver_arrived_provider = NSNumber(value: Randoms.randomBool())
        obj.b_enable_financial_support = NSNumber(value: Randoms.randomBool())
        obj.b_financial_support_accepted = NSNumber(value: Randoms.randomBool())
        obj.b_financial_support_completed = NSNumber(value: Randoms.randomBool())
        obj.b_financial_support_requested = NSNumber(value: Randoms.randomBool())
        obj.b_invoice_accepted = NSNumber(value: Randoms.randomBool())
        obj.b_invoice_added = NSNumber(value: Randoms.randomBool())
        obj.b_on_the_way_to_delivery = NSNumber(value: Randoms.randomBool())
        obj.b_purchase_done = NSNumber(value: Randoms.randomBool())
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        return obj
    }
    static func demoArray()-> [TOrderActionsObject]{
        var arr = [TOrderActionsObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TOrderActionsObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}

#endif

/************************* Mo’min J.Abusaada *************************/
