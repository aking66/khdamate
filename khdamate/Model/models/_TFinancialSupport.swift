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

public enum TFinancialSupportAttributes: String {
   case d_amount
   case dt_created
   case i_order_no
   case pk_i_id
   case s_currency
   case s_face_photo
   case s_idno
   case s_mobile
}



public class _TFinancialSupport: NSManagedObject {
   public class var entityName: String {
      return "TFinancialSupport"
   }

   @objc @NSManaged public var d_amount: NSNumber?
   @objc @NSManaged public var dt_created: NSDate?
   @objc @NSManaged public var i_order_no: NSNumber?
   @objc @NSManaged public var pk_i_id: NSNumber?
   @objc @NSManaged public var s_currency: String?
   @objc @NSManaged public var s_face_photo: String?
   @objc @NSManaged public var s_idno: String?
   @objc @NSManaged public var s_mobile: String?


   static let rKmapping : RKEntityMapping = {
        var TFinancialSupportMapping = RKEntityMapping(forEntityForName: NSStringFromClass(TFinancialSupport.classForCoder()), in: RKObjectManager.shared().managedObjectStore)
        TFinancialSupportMapping?.addAttributeMappings(from: [
                "amount":"d_amount",
                "created_at":"dt_created",
                "order_no":"i_order_no",
                "order_id":"pk_i_id",
                "currency":"s_currency",
                "face_photo":"s_face_photo",
                "idno":"s_idno",
                "mobile":"s_mobile",

            ])
        TFinancialSupportMapping?.identificationAttributes = ["pk_i_id"]
        return TFinancialSupportMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["amount"] = d_amount
        dictionary["created_at"] = dt_created
        dictionary["order_no"] = i_order_no
        dictionary["order_id"] = pk_i_id
        dictionary["currency"] = s_currency
        dictionary["face_photo"] = s_face_photo
        dictionary["idno"] = s_idno
        dictionary["mobile"] = s_mobile


        return dictionary
    }

    func toNonDBObject() -> TFinancialSupportObject {
       let obj = TFinancialSupportObject()
       obj.d_amount = self.d_amount
       obj.dt_created = self.dt_created
       obj.i_order_no = self.i_order_no
       obj.pk_i_id = self.pk_i_id
       obj.s_currency = self.s_currency
       obj.s_face_photo = self.s_face_photo
       obj.s_idno = self.s_idno
       obj.s_mobile = self.s_mobile

       return obj
    }
    public override var description: String{
        var description: String = "<TFinancialSupport: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"d_amount\" : \(d_amount?.description ?? "nil");"
        description += "\n    \"dt_created\" : \(dt_created != nil ? "\"\(dt_created?.description ?? "nil")\"" : "\(dt_created?.description ?? "nil")");"
        description += "\n    \"i_order_no\" : \(i_order_no?.description ?? "nil");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"s_currency\" : \(s_currency != nil ? "\"\(s_currency?.description ?? "nil")\"" : "\(s_currency?.description ?? "nil")");"
        description += "\n    \"s_face_photo\" : \(s_face_photo != nil ? "\"\(s_face_photo?.description ?? "nil")\"" : "\(s_face_photo?.description ?? "nil")");"
        description += "\n    \"s_idno\" : \(s_idno != nil ? "\"\(s_idno?.description ?? "nil")\"" : "\(s_idno?.description ?? "nil")");"
        description += "\n    \"s_mobile\" : \(s_mobile != nil ? "\"\(s_mobile?.description ?? "nil")\"" : "\(s_mobile?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TFinancialSupport?) -> Bool {
        return self == object
    }
    static func == (left: _TFinancialSupport, right: _TFinancialSupport) -> Bool {
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
    static func demoObject()-> TFinancialSupport?{
        let obj = TFinancialSupport.mr_createEntity()
        obj?.d_amount = NSNumber(value: Randoms.randomDouble())
        obj?.dt_created = Randoms.randomDate() as NSDate
        obj?.i_order_no = NSNumber(value: Randoms.randomInt32())
        obj?.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj?.s_currency = Randoms.randomFakeName()
        obj?.s_face_photo = Randoms.randomFakeName()
        obj?.s_idno = Randoms.randomFakeName()
        obj?.s_mobile = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TFinancialSupport]{
        var arr = [TFinancialSupport]()
        for _ in 1...GlobalConstants.API_PageSize {
            if let usr = TFinancialSupport.demoObject() {
                arr.append(usr)
            }
        }
        return arr
    }
    #endif

}





public class _TFinancialSupportObject: NSObject {
   public class var entityName: String {
      return "TFinancialSupportObject"
   }

   @objc public var d_amount: NSNumber?
   @objc public var dt_created: NSDate?
   @objc public var i_order_no: NSNumber?
   @objc public var pk_i_id: NSNumber?
   @objc public var s_currency: String?
   @objc public var s_face_photo: String?
   @objc public var s_idno: String?
   @objc public var s_mobile: String?


   static let rKmapping : RKObjectMapping = {
        var TFinancialSupportObjectMapping = RKObjectMapping(for: TFinancialSupportObject.classForCoder())
        TFinancialSupportObjectMapping?.addAttributeMappings(from: [
                "amount":"d_amount",
                "created_at":"dt_created",
                "order_no":"i_order_no",
                "order_id":"pk_i_id",
                "currency":"s_currency",
                "face_photo":"s_face_photo",
                "idno":"s_idno",
                "mobile":"s_mobile",

            ])
        return TFinancialSupportObjectMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["amount"] = d_amount
        dictionary["created_at"] = dt_created
        dictionary["order_no"] = i_order_no
        dictionary["order_id"] = pk_i_id
        dictionary["currency"] = s_currency
        dictionary["face_photo"] = s_face_photo
        dictionary["idno"] = s_idno
        dictionary["mobile"] = s_mobile


        return dictionary
    }

    public override var description: String{
        var description: String = "<TFinancialSupportObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"d_amount\" : \(d_amount?.description ?? "nil");"
        description += "\n    \"dt_created\" : \(dt_created != nil ? "\"\(dt_created?.description ?? "nil")\"" : "\(dt_created?.description ?? "nil")");"
        description += "\n    \"i_order_no\" : \(i_order_no?.description ?? "nil");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"s_currency\" : \(s_currency != nil ? "\"\(s_currency?.description ?? "nil")\"" : "\(s_currency?.description ?? "nil")");"
        description += "\n    \"s_face_photo\" : \(s_face_photo != nil ? "\"\(s_face_photo?.description ?? "nil")\"" : "\(s_face_photo?.description ?? "nil")");"
        description += "\n    \"s_idno\" : \(s_idno != nil ? "\"\(s_idno?.description ?? "nil")\"" : "\(s_idno?.description ?? "nil")");"
        description += "\n    \"s_mobile\" : \(s_mobile != nil ? "\"\(s_mobile?.description ?? "nil")\"" : "\(s_mobile?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TFinancialSupportObject?) -> Bool {
        return self == object
    }
    static func == (left: _TFinancialSupportObject, right: _TFinancialSupportObject) -> Bool {
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
    static func demoObject()-> TFinancialSupportObject{
        let obj = TFinancialSupportObject()
        obj.d_amount = NSNumber(value: Randoms.randomDouble())
        obj.dt_created = Randoms.randomDate() as NSDate
        obj.i_order_no = NSNumber(value: Randoms.randomInt32())
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.s_currency = Randoms.randomFakeName()
        obj.s_face_photo = Randoms.randomFakeName()
        obj.s_idno = Randoms.randomFakeName()
        obj.s_mobile = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TFinancialSupportObject]{
        var arr = [TFinancialSupportObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TFinancialSupportObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}


#elseif canImport(Alamofire)
public class _TFinancialSupportObject: NSObject,NSCoding,NSCopying {
    @objc public var d_amount: NSNumber?
    @objc public var dt_created: NSDate?
    @objc public var i_order_no: NSNumber?
    @objc public var pk_i_id: NSNumber?
    @objc public var s_currency: String?
    @objc public var s_face_photo: String?
    @objc public var s_idno: String?
    @objc public var s_mobile: String?


    init(fromDictionary dictionary: NSDictionary){
        d_amount = dictionary.value(forKeyPath: "amount") as? NSNumber
        dt_created = NSDate.mapperDateFormatter.formats(fromString:dictionary.value(forKeyPath: "created_at")  as? String)
        i_order_no = dictionary.value(forKeyPath: "order_no") as? NSNumber
        pk_i_id = dictionary.value(forKeyPath: "order_id") as? NSNumber
        s_currency = dictionary.value(forKeyPath: "currency") as? String
        s_face_photo = dictionary.value(forKeyPath: "face_photo") as? String
        s_idno = dictionary.value(forKeyPath: "idno") as? String
        s_mobile = dictionary.value(forKeyPath: "mobile") as? String

    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["amount"] = d_amount
        dictionary["created_at"] = dt_created
        dictionary["order_no"] = i_order_no
        dictionary["order_id"] = pk_i_id
        dictionary["currency"] = s_currency
        dictionary["face_photo"] = s_face_photo
        dictionary["idno"] = s_idno
        dictionary["mobile"] = s_mobile


        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder){
        d_amount = aDecoder.decodeObject(forKey:"amount") as? NSNumber
        dt_created = aDecoder.decodeObject(forKey:"created_at") as? NSDate
        i_order_no = aDecoder.decodeObject(forKey:"order_no") as? NSNumber
        pk_i_id = aDecoder.decodeObject(forKey:"order_id") as? NSNumber
        s_currency = aDecoder.decodeObject(forKey:"currency") as? String
        s_face_photo = aDecoder.decodeObject(forKey:"face_photo") as? String
        s_idno = aDecoder.decodeObject(forKey:"idno") as? String
        s_mobile = aDecoder.decodeObject(forKey:"mobile") as? String

    }

    @objc public func encode(with aCoder: NSCoder){
        if d_amount != nil{
            aCoder.encode(d_amount, forKey: "amount")
        }
        if dt_created != nil{
            aCoder.encode(dt_created, forKey: "created_at")
        }
        if i_order_no != nil{
            aCoder.encode(i_order_no, forKey: "order_no")
        }
        if pk_i_id != nil{
            aCoder.encode(pk_i_id, forKey: "order_id")
        }
        if s_currency != nil{
            aCoder.encode(s_currency, forKey: "currency")
        }
        if s_face_photo != nil{
            aCoder.encode(s_face_photo, forKey: "face_photo")
        }
        if s_idno != nil{
            aCoder.encode(s_idno, forKey: "idno")
        }
        if s_mobile != nil{
            aCoder.encode(s_mobile, forKey: "mobile")
        }

    }
    public func copy(with zone: NSZone? = nil) -> Any {
        return TFinancialSupportObject(fromDictionary: self.toDictionary() as NSDictionary)
    }
    public override var description: String{
        var description: String = "<TFinancialSupportObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"d_amount\" : \(d_amount?.description ?? "nil");"
        description += "\n    \"dt_created\" : \(dt_created != nil ? "\"\(dt_created?.description ?? "nil")\"" : "\(dt_created?.description ?? "nil")");"
        description += "\n    \"i_order_no\" : \(i_order_no?.description ?? "nil");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"s_currency\" : \(s_currency != nil ? "\"\(s_currency?.description ?? "nil")\"" : "\(s_currency?.description ?? "nil")");"
        description += "\n    \"s_face_photo\" : \(s_face_photo != nil ? "\"\(s_face_photo?.description ?? "nil")\"" : "\(s_face_photo?.description ?? "nil")");"
        description += "\n    \"s_idno\" : \(s_idno != nil ? "\"\(s_idno?.description ?? "nil")\"" : "\(s_idno?.description ?? "nil")");"
        description += "\n    \"s_mobile\" : \(s_mobile != nil ? "\"\(s_mobile?.description ?? "nil")\"" : "\(s_mobile?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TFinancialSupportObject?) -> Bool {
        return self == object
    }
    static func == (left: _TFinancialSupportObject, right: _TFinancialSupportObject) -> Bool {
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
    static func demoObject()-> TFinancialSupportObject{
        let obj = TFinancialSupportObject(fromDictionary: ["":""])
        obj.d_amount = NSNumber(value: Randoms.randomDouble())
        obj.dt_created = Randoms.randomDate() as NSDate
        obj.i_order_no = NSNumber(value: Randoms.randomInt32())
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.s_currency = Randoms.randomFakeName()
        obj.s_face_photo = Randoms.randomFakeName()
        obj.s_idno = Randoms.randomFakeName()
        obj.s_mobile = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TFinancialSupportObject]{
        var arr = [TFinancialSupportObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TFinancialSupportObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}

#endif

/************************* Mo’min J.Abusaada *************************/
