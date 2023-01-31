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

public enum TChatAttributes: String {
   case category
   case coupon_code
   case created_at
   case final_price
   case i_offer_id
   case is_accepted
   case my_messsage
   case pk_i_id
   case s_answered
   case s_photo
   case s_text
   case s_total_price
   case types
   case value
}



public class _TChat: NSManagedObject {
   public class var entityName: String {
      return "TChat"
   }

   @objc @NSManaged public var category: String?
   @objc @NSManaged public var coupon_code: String?
   @objc @NSManaged public var created_at: NSDate?
   @objc @NSManaged public var final_price: String?
   @objc @NSManaged public var i_offer_id: String?
   @objc @NSManaged public var is_accepted: NSNumber?
   @objc @NSManaged public var my_messsage: NSNumber?
   @objc @NSManaged public var pk_i_id: String?
   @objc @NSManaged public var s_answered: NSNumber?
   @objc @NSManaged public var s_photo: String?
   @objc @NSManaged public var s_text: String?
   @objc @NSManaged public var s_total_price: String?
   @objc @NSManaged public var types: String?
   @objc @NSManaged public var value: String?


   static let rKmapping : RKEntityMapping = {
        var TChatMapping = RKEntityMapping(forEntityForName: NSStringFromClass(TChat.classForCoder()), in: RKObjectManager.shared().managedObjectStore)
        TChatMapping?.addAttributeMappings(from: [
                "category":"category",
                "coupon_code":"coupon_code",
                "created_at":"created_at",
                "final_price":"final_price",
                "offer_id":"i_offer_id",
                "is_accepted":"is_accepted",
                "my_messsage":"my_messsage",
                "created_at":"pk_i_id",
                "is_answered":"s_answered",
                "photo":"s_photo",
                "text":"s_text",
                "total_price":"s_total_price",
                "type":"types",
                "value":"value",

            ])
        TChatMapping?.identificationAttributes = ["pk_i_id"]
        return TChatMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["category"] = category
        dictionary["coupon_code"] = coupon_code
        dictionary["created_at"] = created_at
        dictionary["final_price"] = final_price
        dictionary["offer_id"] = i_offer_id
        dictionary["is_accepted"] = is_accepted
        dictionary["my_messsage"] = my_messsage
        dictionary["created_at"] = pk_i_id
        dictionary["is_answered"] = s_answered
        dictionary["photo"] = s_photo
        dictionary["text"] = s_text
        dictionary["total_price"] = s_total_price
        dictionary["type"] = types
        dictionary["value"] = value


        return dictionary
    }

    func toNonDBObject() -> TChatObject {
       let obj = TChatObject()
       obj.category = self.category
       obj.coupon_code = self.coupon_code
       obj.created_at = self.created_at
       obj.final_price = self.final_price
       obj.i_offer_id = self.i_offer_id
       obj.is_accepted = self.is_accepted
       obj.my_messsage = self.my_messsage
       obj.pk_i_id = self.pk_i_id
       obj.s_answered = self.s_answered
       obj.s_photo = self.s_photo
       obj.s_text = self.s_text
       obj.s_total_price = self.s_total_price
       obj.types = self.types
       obj.value = self.value

       return obj
    }
    public override var description: String{
        var description: String = "<TChat: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"category\" : \(category != nil ? "\"\(category?.description ?? "nil")\"" : "\(category?.description ?? "nil")");"
        description += "\n    \"coupon_code\" : \(coupon_code != nil ? "\"\(coupon_code?.description ?? "nil")\"" : "\(coupon_code?.description ?? "nil")");"
        description += "\n    \"created_at\" : \(created_at != nil ? "\"\(created_at?.description ?? "nil")\"" : "\(created_at?.description ?? "nil")");"
        description += "\n    \"final_price\" : \(final_price != nil ? "\"\(final_price?.description ?? "nil")\"" : "\(final_price?.description ?? "nil")");"
        description += "\n    \"i_offer_id\" : \(i_offer_id != nil ? "\"\(i_offer_id?.description ?? "nil")\"" : "\(i_offer_id?.description ?? "nil")");"
        description += "\n    \"is_accepted\" : \(is_accepted?.description ?? "nil");"
        description += "\n    \"my_messsage\" : \(my_messsage?.description ?? "nil");"
        description += "\n    \"pk_i_id\" : \(pk_i_id != nil ? "\"\(pk_i_id?.description ?? "nil")\"" : "\(pk_i_id?.description ?? "nil")");"
        description += "\n    \"s_answered\" : \(s_answered?.description ?? "nil");"
        description += "\n    \"s_photo\" : \(s_photo != nil ? "\"\(s_photo?.description ?? "nil")\"" : "\(s_photo?.description ?? "nil")");"
        description += "\n    \"s_text\" : \(s_text != nil ? "\"\(s_text?.description ?? "nil")\"" : "\(s_text?.description ?? "nil")");"
        description += "\n    \"s_total_price\" : \(s_total_price != nil ? "\"\(s_total_price?.description ?? "nil")\"" : "\(s_total_price?.description ?? "nil")");"
        description += "\n    \"types\" : \(types != nil ? "\"\(types?.description ?? "nil")\"" : "\(types?.description ?? "nil")");"
        description += "\n    \"value\" : \(value != nil ? "\"\(value?.description ?? "nil")\"" : "\(value?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TChat?) -> Bool {
        return self == object
    }
    static func == (left: _TChat, right: _TChat) -> Bool {
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
    static func demoObject()-> TChat?{
        let obj = TChat.mr_createEntity()
        obj?.category = Randoms.randomFakeName()
        obj?.coupon_code = Randoms.randomFakeName()
        obj?.created_at = Randoms.randomDate() as NSDate
        obj?.final_price = Randoms.randomFakeName()
        obj?.i_offer_id = Randoms.randomFakeName()
        obj?.is_accepted = NSNumber(value: Randoms.randomBool())
        obj?.my_messsage = NSNumber(value: Randoms.randomBool())
        obj?.pk_i_id = Randoms.randomFakeName()
        obj?.s_answered = NSNumber(value: Randoms.randomBool())
        obj?.s_photo = Randoms.randomFakeName()
        obj?.s_text = Randoms.randomFakeName()
        obj?.s_total_price = Randoms.randomFakeName()
        obj?.types = Randoms.randomFakeName()
        obj?.value = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TChat]{
        var arr = [TChat]()
        for _ in 1...GlobalConstants.API_PageSize {
            if let usr = TChat.demoObject() {
                arr.append(usr)
            }
        }
        return arr
    }
    #endif

}





public class _TChatObject: NSObject {
   public class var entityName: String {
      return "TChatObject"
   }

   @objc public var category: String?
   @objc public var coupon_code: String?
   @objc public var created_at: NSDate?
   @objc public var final_price: String?
   @objc public var i_offer_id: String?
   @objc public var is_accepted: NSNumber?
   @objc public var my_messsage: NSNumber?
   @objc public var pk_i_id: String?
   @objc public var s_answered: NSNumber?
   @objc public var s_photo: String?
   @objc public var s_text: String?
   @objc public var s_total_price: String?
   @objc public var types: String?
   @objc public var value: String?


   static let rKmapping : RKObjectMapping = {
        var TChatObjectMapping = RKObjectMapping(for: TChatObject.classForCoder())
        TChatObjectMapping?.addAttributeMappings(from: [
                "category":"category",
                "coupon_code":"coupon_code",
                "created_at":"created_at",
                "final_price":"final_price",
                "offer_id":"i_offer_id",
                "is_accepted":"is_accepted",
                "my_messsage":"my_messsage",
                "created_at":"pk_i_id",
                "is_answered":"s_answered",
                "photo":"s_photo",
                "text":"s_text",
                "total_price":"s_total_price",
                "type":"types",
                "value":"value",

            ])
        return TChatObjectMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["category"] = category
        dictionary["coupon_code"] = coupon_code
        dictionary["created_at"] = created_at
        dictionary["final_price"] = final_price
        dictionary["offer_id"] = i_offer_id
        dictionary["is_accepted"] = is_accepted
        dictionary["my_messsage"] = my_messsage
        dictionary["created_at"] = pk_i_id
        dictionary["is_answered"] = s_answered
        dictionary["photo"] = s_photo
        dictionary["text"] = s_text
        dictionary["total_price"] = s_total_price
        dictionary["type"] = types
        dictionary["value"] = value


        return dictionary
    }

    public override var description: String{
        var description: String = "<TChatObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"category\" : \(category != nil ? "\"\(category?.description ?? "nil")\"" : "\(category?.description ?? "nil")");"
        description += "\n    \"coupon_code\" : \(coupon_code != nil ? "\"\(coupon_code?.description ?? "nil")\"" : "\(coupon_code?.description ?? "nil")");"
        description += "\n    \"created_at\" : \(created_at != nil ? "\"\(created_at?.description ?? "nil")\"" : "\(created_at?.description ?? "nil")");"
        description += "\n    \"final_price\" : \(final_price != nil ? "\"\(final_price?.description ?? "nil")\"" : "\(final_price?.description ?? "nil")");"
        description += "\n    \"i_offer_id\" : \(i_offer_id != nil ? "\"\(i_offer_id?.description ?? "nil")\"" : "\(i_offer_id?.description ?? "nil")");"
        description += "\n    \"is_accepted\" : \(is_accepted?.description ?? "nil");"
        description += "\n    \"my_messsage\" : \(my_messsage?.description ?? "nil");"
        description += "\n    \"pk_i_id\" : \(pk_i_id != nil ? "\"\(pk_i_id?.description ?? "nil")\"" : "\(pk_i_id?.description ?? "nil")");"
        description += "\n    \"s_answered\" : \(s_answered?.description ?? "nil");"
        description += "\n    \"s_photo\" : \(s_photo != nil ? "\"\(s_photo?.description ?? "nil")\"" : "\(s_photo?.description ?? "nil")");"
        description += "\n    \"s_text\" : \(s_text != nil ? "\"\(s_text?.description ?? "nil")\"" : "\(s_text?.description ?? "nil")");"
        description += "\n    \"s_total_price\" : \(s_total_price != nil ? "\"\(s_total_price?.description ?? "nil")\"" : "\(s_total_price?.description ?? "nil")");"
        description += "\n    \"types\" : \(types != nil ? "\"\(types?.description ?? "nil")\"" : "\(types?.description ?? "nil")");"
        description += "\n    \"value\" : \(value != nil ? "\"\(value?.description ?? "nil")\"" : "\(value?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TChatObject?) -> Bool {
        return self == object
    }
    static func == (left: _TChatObject, right: _TChatObject) -> Bool {
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
    static func demoObject()-> TChatObject{
        let obj = TChatObject()
        obj.category = Randoms.randomFakeName()
        obj.coupon_code = Randoms.randomFakeName()
        obj.created_at = Randoms.randomDate() as NSDate
        obj.final_price = Randoms.randomFakeName()
        obj.i_offer_id = Randoms.randomFakeName()
        obj.is_accepted = NSNumber(value: Randoms.randomBool())
        obj.my_messsage = NSNumber(value: Randoms.randomBool())
        obj.pk_i_id = Randoms.randomFakeName()
        obj.s_answered = NSNumber(value: Randoms.randomBool())
        obj.s_photo = Randoms.randomFakeName()
        obj.s_text = Randoms.randomFakeName()
        obj.s_total_price = Randoms.randomFakeName()
        obj.types = Randoms.randomFakeName()
        obj.value = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TChatObject]{
        var arr = [TChatObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TChatObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}


#elseif canImport(Alamofire)
public class _TChatObject: NSObject,NSCoding,NSCopying {
    @objc public var category: String?
    @objc public var coupon_code: String?
    @objc public var created_at: NSDate?
    @objc public var final_price: String?
    @objc public var i_offer_id: String?
    @objc public var is_accepted: NSNumber?
    @objc public var my_messsage: NSNumber?
    @objc public var pk_i_id: String?
    @objc public var s_answered: NSNumber?
    @objc public var s_photo: String?
    @objc public var s_text: String?
    @objc public var s_total_price: String?
    @objc public var types: String?
    @objc public var value: String?
    @objc public var working_date: String?
    @objc public var working_time: String?


    init(fromDictionary dictionary: NSDictionary){
        category = dictionary.value(forKeyPath: "category") as? String
        working_date = dictionary.value(forKeyPath: "working_date") as? String
        working_time = dictionary.value(forKeyPath: "working_time") as? String
        coupon_code = dictionary.value(forKeyPath: "coupon_code") as? String
        created_at = NSDate.mapperDateFormatter.formats(fromString:dictionary.value(forKeyPath: "created_at")  as? String)
        final_price = dictionary.value(forKeyPath: "final_price") as? String
        i_offer_id = dictionary.value(forKeyPath: "offer_id") as? String
        is_accepted = dictionary.value(forKeyPath: "is_accepted") as? NSNumber
        my_messsage = dictionary.value(forKeyPath: "my_messsage") as? NSNumber
        pk_i_id = dictionary.value(forKeyPath: "created_at") as? String
        s_answered = dictionary.value(forKeyPath: "is_answered") as? NSNumber
        s_photo = dictionary.value(forKeyPath: "photo") as? String
        s_text = dictionary.value(forKeyPath: "text") as? String
        s_total_price = dictionary.value(forKeyPath: "total_price") as? String
        types = dictionary.value(forKeyPath: "type") as? String
        value = dictionary.value(forKeyPath: "value") as? String

    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["category"] = category
        dictionary["coupon_code"] = coupon_code
        dictionary["created_at"] = created_at
        dictionary["final_price"] = final_price
        dictionary["offer_id"] = i_offer_id
        dictionary["is_accepted"] = is_accepted
        dictionary["my_messsage"] = my_messsage
        dictionary["created_at"] = pk_i_id
        dictionary["is_answered"] = s_answered
        dictionary["photo"] = s_photo
        dictionary["text"] = s_text
        dictionary["total_price"] = s_total_price
        dictionary["type"] = types
        dictionary["value"] = value


        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder){
        category = aDecoder.decodeObject(forKey:"category") as? String
        coupon_code = aDecoder.decodeObject(forKey:"coupon_code") as? String
        created_at = aDecoder.decodeObject(forKey:"created_at") as? NSDate
        final_price = aDecoder.decodeObject(forKey:"final_price") as? String
        i_offer_id = aDecoder.decodeObject(forKey:"offer_id") as? String
        is_accepted = aDecoder.decodeObject(forKey:"is_accepted") as? NSNumber
        my_messsage = aDecoder.decodeObject(forKey:"my_messsage") as? NSNumber
        pk_i_id = aDecoder.decodeObject(forKey:"created_at") as? String
        s_answered = aDecoder.decodeObject(forKey:"is_answered") as? NSNumber
        s_photo = aDecoder.decodeObject(forKey:"photo") as? String
        s_text = aDecoder.decodeObject(forKey:"text") as? String
        s_total_price = aDecoder.decodeObject(forKey:"total_price") as? String
        types = aDecoder.decodeObject(forKey:"type") as? String
        value = aDecoder.decodeObject(forKey:"value") as? String

    }

    @objc public func encode(with aCoder: NSCoder){
        if category != nil{
            aCoder.encode(category, forKey: "category")
        }
        if coupon_code != nil{
            aCoder.encode(coupon_code, forKey: "coupon_code")
        }
        if created_at != nil{
            aCoder.encode(created_at, forKey: "created_at")
        }
        if final_price != nil{
            aCoder.encode(final_price, forKey: "final_price")
        }
        if i_offer_id != nil{
            aCoder.encode(i_offer_id, forKey: "offer_id")
        }
        if is_accepted != nil{
            aCoder.encode(is_accepted, forKey: "is_accepted")
        }
        if my_messsage != nil{
            aCoder.encode(my_messsage, forKey: "my_messsage")
        }
        if pk_i_id != nil{
            aCoder.encode(pk_i_id, forKey: "created_at")
        }
        if s_answered != nil{
            aCoder.encode(s_answered, forKey: "is_answered")
        }
        if s_photo != nil{
            aCoder.encode(s_photo, forKey: "photo")
        }
        if s_text != nil{
            aCoder.encode(s_text, forKey: "text")
        }
        if s_total_price != nil{
            aCoder.encode(s_total_price, forKey: "total_price")
        }
        if types != nil{
            aCoder.encode(types, forKey: "type")
        }
        if value != nil{
            aCoder.encode(value, forKey: "value")
        }

    }
    public func copy(with zone: NSZone? = nil) -> Any {
        return TChatObject(fromDictionary: self.toDictionary() as NSDictionary)
    }
    public override var description: String{
        var description: String = "<TChatObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"category\" : \(category != nil ? "\"\(category?.description ?? "nil")\"" : "\(category?.description ?? "nil")");"
        description += "\n    \"coupon_code\" : \(coupon_code != nil ? "\"\(coupon_code?.description ?? "nil")\"" : "\(coupon_code?.description ?? "nil")");"
        description += "\n    \"created_at\" : \(created_at != nil ? "\"\(created_at?.description ?? "nil")\"" : "\(created_at?.description ?? "nil")");"
        description += "\n    \"final_price\" : \(final_price != nil ? "\"\(final_price?.description ?? "nil")\"" : "\(final_price?.description ?? "nil")");"
        description += "\n    \"i_offer_id\" : \(i_offer_id != nil ? "\"\(i_offer_id?.description ?? "nil")\"" : "\(i_offer_id?.description ?? "nil")");"
        description += "\n    \"is_accepted\" : \(is_accepted?.description ?? "nil");"
        description += "\n    \"my_messsage\" : \(my_messsage?.description ?? "nil");"
        description += "\n    \"pk_i_id\" : \(pk_i_id != nil ? "\"\(pk_i_id?.description ?? "nil")\"" : "\(pk_i_id?.description ?? "nil")");"
        description += "\n    \"s_answered\" : \(s_answered?.description ?? "nil");"
        description += "\n    \"s_photo\" : \(s_photo != nil ? "\"\(s_photo?.description ?? "nil")\"" : "\(s_photo?.description ?? "nil")");"
        description += "\n    \"s_text\" : \(s_text != nil ? "\"\(s_text?.description ?? "nil")\"" : "\(s_text?.description ?? "nil")");"
        description += "\n    \"s_total_price\" : \(s_total_price != nil ? "\"\(s_total_price?.description ?? "nil")\"" : "\(s_total_price?.description ?? "nil")");"
        description += "\n    \"types\" : \(types != nil ? "\"\(types?.description ?? "nil")\"" : "\(types?.description ?? "nil")");"
        description += "\n    \"value\" : \(value != nil ? "\"\(value?.description ?? "nil")\"" : "\(value?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TChatObject?) -> Bool {
        return self == object
    }
    static func == (left: _TChatObject, right: _TChatObject) -> Bool {
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
    static func demoObject()-> TChatObject{
        let obj = TChatObject(fromDictionary: ["":""])
        obj.category = Randoms.randomFakeName()
        obj.coupon_code = Randoms.randomFakeName()
        obj.created_at = Randoms.randomDate() as NSDate
        obj.final_price = Randoms.randomFakeName()
        obj.i_offer_id = Randoms.randomFakeName()
        obj.is_accepted = NSNumber(value: Randoms.randomBool())
        obj.my_messsage = NSNumber(value: Randoms.randomBool())
        obj.pk_i_id = Randoms.randomFakeName()
        obj.s_answered = NSNumber(value: Randoms.randomBool())
        obj.s_photo = Randoms.randomFakeName()
        obj.s_text = Randoms.randomFakeName()
        obj.s_total_price = Randoms.randomFakeName()
        obj.types = Randoms.randomFakeName()
        obj.value = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TChatObject]{
        var arr = [TChatObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TChatObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}

#endif

/************************* Mo’min J.Abusaada *************************/
