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

public enum TUserAttributes: String {
   case address
   case email
   case idno
   case is_online
   case isNew
   case license_photo
   case mobile
   case mobile_intro
   case photo
   case pk_i_id
   case rate
   case rate_count
   case s_image
   case s_name
   case s_profileImageUrl
   case s_token
   case service_ids
   case service_names
   case status
   case total_completed_order
   case type
}



public class _TUser: NSManagedObject {
   public class var entityName: String {
      return "TUser"
   }

   @objc @NSManaged public var address: String?
   @objc @NSManaged public var email: String?
   @objc @NSManaged public var idno: String?
   @objc @NSManaged public var is_online: NSNumber?
   @objc @NSManaged public var isNew: NSNumber?
   @objc @NSManaged public var license_photo: String?
   @objc @NSManaged public var mobile: String?
   @objc @NSManaged public var mobile_intro: String?
   @objc @NSManaged public var photo: String?
   @objc @NSManaged public var pk_i_id: NSNumber?
   @objc @NSManaged public var rate: NSNumber?
   @objc @NSManaged public var rate_count: NSNumber?
   @objc @NSManaged public var s_image: String?
   @objc @NSManaged public var s_name: String?
   @objc @NSManaged public var s_profileImageUrl: String?
   @objc @NSManaged public var s_token: String?
   @objc @NSManaged public var service_ids: NSObject?
   @objc @NSManaged public var service_names: NSObject?
   @objc @NSManaged public var status: NSNumber?
   @objc @NSManaged public var total_completed_order: NSNumber?
   @objc @NSManaged public var type: String?


   static let rKmapping : RKEntityMapping = {
        var TUserMapping = RKEntityMapping(forEntityForName: NSStringFromClass(TUser.classForCoder()), in: RKObjectManager.shared().managedObjectStore)
        TUserMapping?.addAttributeMappings(from: [
                "address":"address",
                "email":"email",
                "idno":"idno",
                "is_online":"is_online",
                "isNew":"isNew",
                "license_photo":"license_photo",
                "mobile":"mobile",
                "mobile_intro":"mobile_intro",
                "photo":"photo",
                "id":"pk_i_id",
                "rate":"rate",
                "rate_count":"rate_count",
                "image":"s_image",
                "name":"s_name",
                "profileImageUrl":"s_profileImageUrl",
                "token":"s_token",
                "service_ids":"service_ids",
                "service_names":"service_names",
                "status":"status",
                "total_completed_order":"total_completed_order",
                "type":"type",

            ])
        TUserMapping?.identificationAttributes = ["pk_i_id"]
        return TUserMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["address"] = address
        dictionary["email"] = email
        dictionary["idno"] = idno
        dictionary["is_online"] = is_online
        dictionary["isNew"] = isNew
        dictionary["license_photo"] = license_photo
        dictionary["mobile"] = mobile
        dictionary["mobile_intro"] = mobile_intro
        dictionary["photo"] = photo
        dictionary["id"] = pk_i_id
        dictionary["rate"] = rate
        dictionary["rate_count"] = rate_count
        dictionary["image"] = s_image
        dictionary["name"] = s_name
        dictionary["profileImageUrl"] = s_profileImageUrl
        dictionary["token"] = s_token
        dictionary["service_ids"] = service_ids
        dictionary["service_names"] = service_names
        dictionary["status"] = status
        dictionary["total_completed_order"] = total_completed_order
        dictionary["type"] = type


        return dictionary
    }

    func toNonDBObject() -> TUserObject {
       let obj = TUserObject()
       obj.address = self.address
       obj.email = self.email
       obj.idno = self.idno
       obj.is_online = self.is_online
       obj.isNew = self.isNew
       obj.license_photo = self.license_photo
       obj.mobile = self.mobile
       obj.mobile_intro = self.mobile_intro
       obj.photo = self.photo
       obj.pk_i_id = self.pk_i_id
       obj.rate = self.rate
       obj.rate_count = self.rate_count
       obj.s_image = self.s_image
       obj.s_name = self.s_name
       obj.s_profileImageUrl = self.s_profileImageUrl
       obj.s_token = self.s_token
       obj.service_ids = self.service_ids
       obj.service_names = self.service_names
       obj.status = self.status
       obj.total_completed_order = self.total_completed_order
       obj.type = self.type

       return obj
    }
    public override var description: String{
        var description: String = "<TUser: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"address\" : \(address != nil ? "\"\(address?.description ?? "nil")\"" : "\(address?.description ?? "nil")");"
        description += "\n    \"email\" : \(email != nil ? "\"\(email?.description ?? "nil")\"" : "\(email?.description ?? "nil")");"
        description += "\n    \"idno\" : \(idno != nil ? "\"\(idno?.description ?? "nil")\"" : "\(idno?.description ?? "nil")");"
        description += "\n    \"is_online\" : \(is_online?.description ?? "nil");"
        description += "\n    \"isNew\" : \(isNew?.description ?? "nil");"
        description += "\n    \"license_photo\" : \(license_photo != nil ? "\"\(license_photo?.description ?? "nil")\"" : "\(license_photo?.description ?? "nil")");"
        description += "\n    \"mobile\" : \(mobile != nil ? "\"\(mobile?.description ?? "nil")\"" : "\(mobile?.description ?? "nil")");"
        description += "\n    \"mobile_intro\" : \(mobile_intro != nil ? "\"\(mobile_intro?.description ?? "nil")\"" : "\(mobile_intro?.description ?? "nil")");"
        description += "\n    \"photo\" : \(photo != nil ? "\"\(photo?.description ?? "nil")\"" : "\(photo?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"rate\" : \(rate?.description ?? "nil");"
        description += "\n    \"rate_count\" : \(rate_count?.description ?? "nil");"
        description += "\n    \"s_image\" : \(s_image != nil ? "\"\(s_image?.description ?? "nil")\"" : "\(s_image?.description ?? "nil")");"
        description += "\n    \"s_name\" : \(s_name != nil ? "\"\(s_name?.description ?? "nil")\"" : "\(s_name?.description ?? "nil")");"
        description += "\n    \"s_profileImageUrl\" : \(s_profileImageUrl != nil ? "\"\(s_profileImageUrl?.description ?? "nil")\"" : "\(s_profileImageUrl?.description ?? "nil")");"
        description += "\n    \"s_token\" : \(s_token != nil ? "\"\(s_token?.description ?? "nil")\"" : "\(s_token?.description ?? "nil")");"
        description += "\n    \"service_ids\" : \(service_ids != nil ? "\"\(service_ids?.description ?? "nil")\"" : "\(service_ids?.description ?? "nil")");"
        description += "\n    \"service_names\" : \(service_names != nil ? "\"\(service_names?.description ?? "nil")\"" : "\(service_names?.description ?? "nil")");"
        description += "\n    \"status\" : \(status?.description ?? "nil");"
        description += "\n    \"total_completed_order\" : \(total_completed_order?.description ?? "nil");"
        description += "\n    \"type\" : \(type != nil ? "\"\(type?.description ?? "nil")\"" : "\(type?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TUser?) -> Bool {
        return self == object
    }
    static func == (left: _TUser, right: _TUser) -> Bool {
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
    static func demoObject()-> TUser?{
        let obj = TUser.mr_createEntity()
        obj?.address = Randoms.randomFakeName()
        obj?.email = Randoms.randomFakeName()
        obj?.idno = Randoms.randomFakeName()
        obj?.is_online = NSNumber(value: Randoms.randomInt32())
        obj?.isNew = NSNumber(value: Randoms.randomInt())
        obj?.license_photo = Randoms.randomFakeName()
        obj?.mobile = Randoms.randomFakeName()
        obj?.mobile_intro = Randoms.randomFakeName()
        obj?.photo = Randoms.randomFakeName()
        obj?.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj?.rate = NSNumber(value: Randoms.randomDouble())
        obj?.rate_count = NSNumber(value: Randoms.randomInt32())
        obj?.s_image = Randoms.randomFakeName()
        obj?.s_name = Randoms.randomFakeName()
        obj?.s_profileImageUrl = Randoms.randomFakeName()
        obj?.s_token = Randoms.randomFakeName()
        obj?.service_ids = nil
        obj?.service_names = nil
        obj?.status = NSNumber(value: Randoms.randomInt32())
        obj?.total_completed_order = NSNumber(value: Randoms.randomInt32())
        obj?.type = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TUser]{
        var arr = [TUser]()
        for _ in 1...GlobalConstants.API_PageSize {
            if let usr = TUser.demoObject() {
                arr.append(usr)
            }
        }
        return arr
    }
    #endif

}





public class _TUserObject: NSObject {
   public class var entityName: String {
      return "TUserObject"
   }

   @objc public var address: String?
   @objc public var email: String?
   @objc public var idno: String?
   @objc public var is_online: NSNumber?
   @objc public var isNew: NSNumber?
   @objc public var license_photo: String?
   @objc public var mobile: String?
   @objc public var mobile_intro: String?
   @objc public var photo: String?
   @objc public var pk_i_id: NSNumber?
   @objc public var rate: NSNumber?
   @objc public var rate_count: NSNumber?
   @objc public var s_image: String?
   @objc public var s_name: String?
   @objc public var s_profileImageUrl: String?
   @objc public var s_token: String?
   @objc public var service_ids: NSObject?
   @objc public var service_names: NSObject?
   @objc public var status: NSNumber?
   @objc public var total_completed_order: NSNumber?
   @objc public var type: String?


   static let rKmapping : RKObjectMapping = {
        var TUserObjectMapping = RKObjectMapping(for: TUserObject.classForCoder())
        TUserObjectMapping?.addAttributeMappings(from: [
                "address":"address",
                "email":"email",
                "idno":"idno",
                "is_online":"is_online",
                "isNew":"isNew",
                "license_photo":"license_photo",
                "mobile":"mobile",
                "mobile_intro":"mobile_intro",
                "photo":"photo",
                "id":"pk_i_id",
                "rate":"rate",
                "rate_count":"rate_count",
                "image":"s_image",
                "name":"s_name",
                "profileImageUrl":"s_profileImageUrl",
                "token":"s_token",
                "service_ids":"service_ids",
                "service_names":"service_names",
                "status":"status",
                "total_completed_order":"total_completed_order",
                "type":"type",

            ])
        return TUserObjectMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["address"] = address
        dictionary["email"] = email
        dictionary["idno"] = idno
        dictionary["is_online"] = is_online
        dictionary["isNew"] = isNew
        dictionary["license_photo"] = license_photo
        dictionary["mobile"] = mobile
        dictionary["mobile_intro"] = mobile_intro
        dictionary["photo"] = photo
        dictionary["id"] = pk_i_id
        dictionary["rate"] = rate
        dictionary["rate_count"] = rate_count
        dictionary["image"] = s_image
        dictionary["name"] = s_name
        dictionary["profileImageUrl"] = s_profileImageUrl
        dictionary["token"] = s_token
        dictionary["service_ids"] = service_ids
        dictionary["service_names"] = service_names
        dictionary["status"] = status
        dictionary["total_completed_order"] = total_completed_order
        dictionary["type"] = type


        return dictionary
    }

    public override var description: String{
        var description: String = "<TUserObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"address\" : \(address != nil ? "\"\(address?.description ?? "nil")\"" : "\(address?.description ?? "nil")");"
        description += "\n    \"email\" : \(email != nil ? "\"\(email?.description ?? "nil")\"" : "\(email?.description ?? "nil")");"
        description += "\n    \"idno\" : \(idno != nil ? "\"\(idno?.description ?? "nil")\"" : "\(idno?.description ?? "nil")");"
        description += "\n    \"is_online\" : \(is_online?.description ?? "nil");"
        description += "\n    \"isNew\" : \(isNew?.description ?? "nil");"
        description += "\n    \"license_photo\" : \(license_photo != nil ? "\"\(license_photo?.description ?? "nil")\"" : "\(license_photo?.description ?? "nil")");"
        description += "\n    \"mobile\" : \(mobile != nil ? "\"\(mobile?.description ?? "nil")\"" : "\(mobile?.description ?? "nil")");"
        description += "\n    \"mobile_intro\" : \(mobile_intro != nil ? "\"\(mobile_intro?.description ?? "nil")\"" : "\(mobile_intro?.description ?? "nil")");"
        description += "\n    \"photo\" : \(photo != nil ? "\"\(photo?.description ?? "nil")\"" : "\(photo?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"rate\" : \(rate?.description ?? "nil");"
        description += "\n    \"rate_count\" : \(rate_count?.description ?? "nil");"
        description += "\n    \"s_image\" : \(s_image != nil ? "\"\(s_image?.description ?? "nil")\"" : "\(s_image?.description ?? "nil")");"
        description += "\n    \"s_name\" : \(s_name != nil ? "\"\(s_name?.description ?? "nil")\"" : "\(s_name?.description ?? "nil")");"
        description += "\n    \"s_profileImageUrl\" : \(s_profileImageUrl != nil ? "\"\(s_profileImageUrl?.description ?? "nil")\"" : "\(s_profileImageUrl?.description ?? "nil")");"
        description += "\n    \"s_token\" : \(s_token != nil ? "\"\(s_token?.description ?? "nil")\"" : "\(s_token?.description ?? "nil")");"
        description += "\n    \"service_ids\" : \(service_ids != nil ? "\"\(service_ids?.description ?? "nil")\"" : "\(service_ids?.description ?? "nil")");"
        description += "\n    \"service_names\" : \(service_names != nil ? "\"\(service_names?.description ?? "nil")\"" : "\(service_names?.description ?? "nil")");"
        description += "\n    \"status\" : \(status?.description ?? "nil");"
        description += "\n    \"total_completed_order\" : \(total_completed_order?.description ?? "nil");"
        description += "\n    \"type\" : \(type != nil ? "\"\(type?.description ?? "nil")\"" : "\(type?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TUserObject?) -> Bool {
        return self == object
    }
    static func == (left: _TUserObject, right: _TUserObject) -> Bool {
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
    static func demoObject()-> TUserObject{
        let obj = TUserObject()
        obj.address = Randoms.randomFakeName()
        obj.email = Randoms.randomFakeName()
        obj.idno = Randoms.randomFakeName()
        obj.is_online = NSNumber(value: Randoms.randomInt32())
        obj.isNew = NSNumber(value: Randoms.randomInt())
        obj.license_photo = Randoms.randomFakeName()
        obj.mobile = Randoms.randomFakeName()
        obj.mobile_intro = Randoms.randomFakeName()
        obj.photo = Randoms.randomFakeName()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.rate = NSNumber(value: Randoms.randomDouble())
        obj.rate_count = NSNumber(value: Randoms.randomInt32())
        obj.s_image = Randoms.randomFakeName()
        obj.s_name = Randoms.randomFakeName()
        obj.s_profileImageUrl = Randoms.randomFakeName()
        obj.s_token = Randoms.randomFakeName()
        obj.service_ids = nil
        obj.service_names = nil
        obj.status = NSNumber(value: Randoms.randomInt32())
        obj.total_completed_order = NSNumber(value: Randoms.randomInt32())
        obj.type = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TUserObject]{
        var arr = [TUserObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TUserObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}


#elseif canImport(Alamofire)
public class _TUserObject: NSObject,NSCoding,NSCopying {
    @objc public var address: String?
    @objc public var longitude: String?
    @objc public var latitude: String?
    @objc public var email: String?
    @objc public var idno: String?
    @objc public var is_online: NSNumber?
    @objc public var isNew: NSNumber?
    @objc public var license_photo: String?
    @objc public var mobile: String?
    @objc public var mobile_intro: String?
    @objc public var photo: String?
    @objc public var pk_i_id: NSNumber?
    @objc public var rate: NSNumber?
    @objc public var rate_count: NSNumber?
    @objc public var s_image: String?
    @objc public var s_name: String?
    @objc public var s_profileImageUrl: String?
    @objc public var s_token: String?
    @objc public var service_ids: NSObject?
    @objc public var service_names: NSObject?
    @objc public var status: NSNumber?
    @objc public var total_completed_order: NSNumber?
    @objc public var type: String?


    init(fromDictionary dictionary: NSDictionary){
        latitude  = dictionary.value(forKeyPath: "latitude") as? String
        longitude  = dictionary.value(forKeyPath: "longitude") as? String
        address = dictionary.value(forKeyPath: "address") as? String
        email = dictionary.value(forKeyPath: "email") as? String
        idno = dictionary.value(forKeyPath: "idno") as? String
        is_online = dictionary.value(forKeyPath: "is_online") as? NSNumber
        isNew = dictionary.value(forKeyPath: "isNew") as? NSNumber
        license_photo = dictionary.value(forKeyPath: "license_photo") as? String
        mobile = dictionary.value(forKeyPath: "mobile") as? String
        mobile_intro = dictionary.value(forKeyPath: "mobile_intro") as? String
        photo = dictionary.value(forKeyPath: "photo") as? String
        pk_i_id = dictionary.value(forKeyPath: "id") as? NSNumber
        rate = dictionary.value(forKeyPath: "rate") as? NSNumber
        rate_count = dictionary.value(forKeyPath: "rate_count") as? NSNumber
        s_image = dictionary.value(forKeyPath: "image") as? String
        s_name = dictionary.value(forKeyPath: "name") as? String
        s_profileImageUrl = dictionary.value(forKeyPath: "profileImageUrl") as? String
        s_token = dictionary.value(forKeyPath: "token") as? String
        service_ids = dictionary.value(forKeyPath: "service_ids") as? NSObject
        service_names = dictionary.value(forKeyPath: "service_names") as? NSObject
        status = dictionary.value(forKeyPath: "status") as? NSNumber
        total_completed_order = dictionary.value(forKeyPath: "total_completed_order") as? NSNumber
        type = dictionary.value(forKeyPath: "type") as? String

    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["longitude"] = longitude
        dictionary["longitude"] = longitude
        dictionary["address"] = address
        dictionary["email"] = email
        dictionary["idno"] = idno
        dictionary["is_online"] = is_online
        dictionary["isNew"] = isNew
        dictionary["license_photo"] = license_photo
        dictionary["mobile"] = mobile
        dictionary["mobile_intro"] = mobile_intro
        dictionary["photo"] = photo
        dictionary["id"] = pk_i_id
        dictionary["rate"] = rate
        dictionary["rate_count"] = rate_count
        dictionary["image"] = s_image
        dictionary["name"] = s_name
        dictionary["profileImageUrl"] = s_profileImageUrl
        dictionary["token"] = s_token
        dictionary["service_ids"] = service_ids
        dictionary["service_names"] = service_names
        dictionary["status"] = status
        dictionary["total_completed_order"] = total_completed_order
        dictionary["type"] = type


        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder){
        address = aDecoder.decodeObject(forKey:"address") as? String
        email = aDecoder.decodeObject(forKey:"email") as? String
        idno = aDecoder.decodeObject(forKey:"idno") as? String
        is_online = aDecoder.decodeObject(forKey:"is_online") as? NSNumber
        isNew = aDecoder.decodeObject(forKey:"isNew") as? NSNumber
        license_photo = aDecoder.decodeObject(forKey:"license_photo") as? String
        mobile = aDecoder.decodeObject(forKey:"mobile") as? String
        mobile_intro = aDecoder.decodeObject(forKey:"mobile_intro") as? String
        photo = aDecoder.decodeObject(forKey:"photo") as? String
        pk_i_id = aDecoder.decodeObject(forKey:"id") as? NSNumber
        rate = aDecoder.decodeObject(forKey:"rate") as? NSNumber
        rate_count = aDecoder.decodeObject(forKey:"rate_count") as? NSNumber
        s_image = aDecoder.decodeObject(forKey:"image") as? String
        s_name = aDecoder.decodeObject(forKey:"name") as? String
        s_profileImageUrl = aDecoder.decodeObject(forKey:"profileImageUrl") as? String
        s_token = aDecoder.decodeObject(forKey:"token") as? String
        service_ids = aDecoder.decodeObject(forKey:"service_ids") as? NSObject
        service_names = aDecoder.decodeObject(forKey:"service_names") as? NSObject
        status = aDecoder.decodeObject(forKey:"status") as? NSNumber
        total_completed_order = aDecoder.decodeObject(forKey:"total_completed_order") as? NSNumber
        type = aDecoder.decodeObject(forKey:"type") as? String

    }

    @objc public func encode(with aCoder: NSCoder){
        if address != nil{
            aCoder.encode(address, forKey: "address")
        }
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if idno != nil{
            aCoder.encode(idno, forKey: "idno")
        }
        if is_online != nil{
            aCoder.encode(is_online, forKey: "is_online")
        }
        if isNew != nil{
            aCoder.encode(isNew, forKey: "isNew")
        }
        if license_photo != nil{
            aCoder.encode(license_photo, forKey: "license_photo")
        }
        if mobile != nil{
            aCoder.encode(mobile, forKey: "mobile")
        }
        if mobile_intro != nil{
            aCoder.encode(mobile_intro, forKey: "mobile_intro")
        }
        if photo != nil{
            aCoder.encode(photo, forKey: "photo")
        }
        if pk_i_id != nil{
            aCoder.encode(pk_i_id, forKey: "id")
        }
        if rate != nil{
            aCoder.encode(rate, forKey: "rate")
        }
        if rate_count != nil{
            aCoder.encode(rate_count, forKey: "rate_count")
        }
        if s_image != nil{
            aCoder.encode(s_image, forKey: "image")
        }
        if s_name != nil{
            aCoder.encode(s_name, forKey: "name")
        }
        if s_profileImageUrl != nil{
            aCoder.encode(s_profileImageUrl, forKey: "profileImageUrl")
        }
        if s_token != nil{
            aCoder.encode(s_token, forKey: "token")
        }
        if service_ids != nil{
            aCoder.encode(service_ids, forKey: "service_ids")
        }
        if service_names != nil{
            aCoder.encode(service_names, forKey: "service_names")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if total_completed_order != nil{
            aCoder.encode(total_completed_order, forKey: "total_completed_order")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }

    }
    public func copy(with zone: NSZone? = nil) -> Any {
        return TUserObject(fromDictionary: self.toDictionary() as NSDictionary)
    }
    public override var description: String{
        var description: String = "<TUserObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"address\" : \(address != nil ? "\"\(address?.description ?? "nil")\"" : "\(address?.description ?? "nil")");"
        description += "\n    \"email\" : \(email != nil ? "\"\(email?.description ?? "nil")\"" : "\(email?.description ?? "nil")");"
        description += "\n    \"idno\" : \(idno != nil ? "\"\(idno?.description ?? "nil")\"" : "\(idno?.description ?? "nil")");"
        description += "\n    \"is_online\" : \(is_online?.description ?? "nil");"
        description += "\n    \"isNew\" : \(isNew?.description ?? "nil");"
        description += "\n    \"license_photo\" : \(license_photo != nil ? "\"\(license_photo?.description ?? "nil")\"" : "\(license_photo?.description ?? "nil")");"
        description += "\n    \"mobile\" : \(mobile != nil ? "\"\(mobile?.description ?? "nil")\"" : "\(mobile?.description ?? "nil")");"
        description += "\n    \"mobile_intro\" : \(mobile_intro != nil ? "\"\(mobile_intro?.description ?? "nil")\"" : "\(mobile_intro?.description ?? "nil")");"
        description += "\n    \"photo\" : \(photo != nil ? "\"\(photo?.description ?? "nil")\"" : "\(photo?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"rate\" : \(rate?.description ?? "nil");"
        description += "\n    \"rate_count\" : \(rate_count?.description ?? "nil");"
        description += "\n    \"s_image\" : \(s_image != nil ? "\"\(s_image?.description ?? "nil")\"" : "\(s_image?.description ?? "nil")");"
        description += "\n    \"s_name\" : \(s_name != nil ? "\"\(s_name?.description ?? "nil")\"" : "\(s_name?.description ?? "nil")");"
        description += "\n    \"s_profileImageUrl\" : \(s_profileImageUrl != nil ? "\"\(s_profileImageUrl?.description ?? "nil")\"" : "\(s_profileImageUrl?.description ?? "nil")");"
        description += "\n    \"s_token\" : \(s_token != nil ? "\"\(s_token?.description ?? "nil")\"" : "\(s_token?.description ?? "nil")");"
        description += "\n    \"service_ids\" : \(service_ids != nil ? "\"\(service_ids?.description ?? "nil")\"" : "\(service_ids?.description ?? "nil")");"
        description += "\n    \"service_names\" : \(service_names != nil ? "\"\(service_names?.description ?? "nil")\"" : "\(service_names?.description ?? "nil")");"
        description += "\n    \"status\" : \(status?.description ?? "nil");"
        description += "\n    \"total_completed_order\" : \(total_completed_order?.description ?? "nil");"
        description += "\n    \"type\" : \(type != nil ? "\"\(type?.description ?? "nil")\"" : "\(type?.description ?? "nil")");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TUserObject?) -> Bool {
        return self == object
    }
    static func == (left: _TUserObject, right: _TUserObject) -> Bool {
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
    static func demoObject()-> TUserObject{
        let obj = TUserObject(fromDictionary: ["":""])
        obj.address = Randoms.randomFakeName()
        obj.email = Randoms.randomFakeName()
        obj.idno = Randoms.randomFakeName()
        obj.is_online = NSNumber(value: Randoms.randomInt32())
        obj.isNew = NSNumber(value: Randoms.randomInt())
        obj.license_photo = Randoms.randomFakeName()
        obj.mobile = Randoms.randomFakeName()
        obj.mobile_intro = Randoms.randomFakeName()
        obj.photo = Randoms.randomFakeName()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.rate = NSNumber(value: Randoms.randomDouble())
        obj.rate_count = NSNumber(value: Randoms.randomInt32())
        obj.s_image = Randoms.randomFakeName()
        obj.s_name = Randoms.randomFakeName()
        obj.s_profileImageUrl = Randoms.randomFakeName()
        obj.s_token = Randoms.randomFakeName()
        obj.service_ids = nil
        obj.service_names = nil
        obj.status = NSNumber(value: Randoms.randomInt32())
        obj.total_completed_order = NSNumber(value: Randoms.randomInt32())
        obj.type = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TUserObject]{
        var arr = [TUserObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TUserObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}

#endif

/************************* Mo’min J.Abusaada *************************/
