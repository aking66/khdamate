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

public enum TOrderAttributes: String {
   case accepted_date
   case confirmed_date
   case coupon_code
   case coupon_discount
   case created_at
   case customer_id
   case customer_mobile
   case customer_name
   case customer_photo
   case descriptions
   case files
   case finished_date
   case full_address
   case icon_url
   case name
   case order_date
   case order_desc
   case order_no
   case order_rated
   case order_time
   case payed_date
   case photos
   case picture_url
   case pk_i_id
   case price
   case processing_date
   case provider_id
   case provider_mobile
   case provider_name
   case provider_notes
   case provider_photo
   case provider_rate
   case service_detail_id
   case service_detail_name
   case service_detail_name_photo
   case service_id
   case service_name
   case status
   case total_price
}



public class _TOrder: NSManagedObject {
   public class var entityName: String {
      return "TOrder"
   }

   @objc @NSManaged public var accepted_date: String?
   @objc @NSManaged public var confirmed_date: String?
   @objc @NSManaged public var coupon_code: String?
   @objc @NSManaged public var coupon_discount: String?
   @objc @NSManaged public var created_at: String?
   @objc @NSManaged public var customer_id: NSNumber?
   @objc @NSManaged public var customer_mobile: String?
   @objc @NSManaged public var customer_name: String?
   @objc @NSManaged public var customer_photo: String?
   @objc @NSManaged public var descriptions: String?
   @objc @NSManaged public var files: NSObject?
   @objc @NSManaged public var finished_date: String?
   @objc @NSManaged public var full_address: String?
   @objc @NSManaged public var icon_url: String?
   @objc @NSManaged public var name: String?
   @objc @NSManaged public var order_date: NSDate?
   @objc @NSManaged public var order_desc: String?
   @objc @NSManaged public var order_no: NSNumber?
   @objc @NSManaged public var order_rated: NSNumber?
   @objc @NSManaged public var order_time: String?
   @objc @NSManaged public var payed_date: String?
   @objc @NSManaged public var photos: NSObject?
   @objc @NSManaged public var picture_url: String?
   @objc @NSManaged public var pk_i_id: NSNumber?
   @objc @NSManaged public var price: NSNumber?
   @objc @NSManaged public var processing_date: String?
   @objc @NSManaged public var provider_id: NSNumber?
   @objc @NSManaged public var provider_mobile: String?
   @objc @NSManaged public var provider_name: String?
   @objc @NSManaged public var provider_notes: String?
   @objc @NSManaged public var provider_photo: String?
   @objc @NSManaged public var provider_rate: String?
   @objc @NSManaged public var service_detail_id: NSNumber?
   @objc @NSManaged public var service_detail_name: String?
   @objc @NSManaged public var service_detail_name_photo: String?
   @objc @NSManaged public var service_id: NSNumber?
   @objc @NSManaged public var service_name: String?
   @objc @NSManaged public var status: String?
   @objc @NSManaged public var total_price: NSNumber?


   static let rKmapping : RKEntityMapping = {
        var TOrderMapping = RKEntityMapping(forEntityForName: NSStringFromClass(TOrder.classForCoder()), in: RKObjectManager.shared().managedObjectStore)
        TOrderMapping?.addAttributeMappings(from: [
                "accepted_date":"accepted_date",
                "confirmed_date":"confirmed_date",
                "coupon_code":"coupon_code",
                "coupon_discount":"coupon_discount",
                "created_at":"created_at",
                "customer_id":"customer_id",
                "customer_mobile":"customer_mobile",
                "customer_name":"customer_name",
                "customer_photo":"customer_photo",
                "descriptions":"descriptions",
                "files":"files",
                "finished_date":"finished_date",
                "full_address":"full_address",
                "icon_url":"icon_url",
                "name":"name",
                "order_date":"order_date",
                "order_desc":"order_desc",
                "order_no":"order_no",
                "order_rated":"order_rated",
                "order_time":"order_time",
                "payed_date":"payed_date",
                "photos":"photos",
                "picture_url":"picture_url",
                "id":"pk_i_id",
                "price":"price",
                "processing_date":"processing_date",
                "provider_id":"provider_id",
                "provider_mobile":"provider_mobile",
                "provider_name":"provider_name",
                "provider_notes":"provider_notes",
                "provider_photo":"provider_photo",
                "provider_rate":"provider_rate",
                "service_detail_id":"service_detail_id",
                "service_detail_name":"service_detail_name",
                "service_detail_name_photo":"service_detail_name_photo",
                "service_id":"service_id",
                "service_name":"service_name",
                "status":"status",
                "total_price":"total_price",

            ])
        TOrderMapping?.identificationAttributes = ["pk_i_id"]
        return TOrderMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["accepted_date"] = accepted_date
        dictionary["confirmed_date"] = confirmed_date
        dictionary["coupon_code"] = coupon_code
        dictionary["coupon_discount"] = coupon_discount
        dictionary["created_at"] = created_at
        dictionary["customer_id"] = customer_id
        dictionary["customer_mobile"] = customer_mobile
        dictionary["customer_name"] = customer_name
        dictionary["customer_photo"] = customer_photo
        dictionary["descriptions"] = descriptions
        dictionary["files"] = files
        dictionary["finished_date"] = finished_date
        dictionary["full_address"] = full_address
        dictionary["icon_url"] = icon_url
        dictionary["name"] = name
        dictionary["order_date"] = order_date
        dictionary["order_desc"] = order_desc
        dictionary["order_no"] = order_no
        dictionary["order_rated"] = order_rated
        dictionary["order_time"] = order_time
        dictionary["payed_date"] = payed_date
        dictionary["photos"] = photos
        dictionary["picture_url"] = picture_url
        dictionary["id"] = pk_i_id
        dictionary["price"] = price
        dictionary["processing_date"] = processing_date
        dictionary["provider_id"] = provider_id
        dictionary["provider_mobile"] = provider_mobile
        dictionary["provider_name"] = provider_name
        dictionary["provider_notes"] = provider_notes
        dictionary["provider_photo"] = provider_photo
        dictionary["provider_rate"] = provider_rate
        dictionary["service_detail_id"] = service_detail_id
        dictionary["service_detail_name"] = service_detail_name
        dictionary["service_detail_name_photo"] = service_detail_name_photo
        dictionary["service_id"] = service_id
        dictionary["service_name"] = service_name
        dictionary["status"] = status
        dictionary["total_price"] = total_price


        return dictionary
    }

    func toNonDBObject() -> TOrderObject {
       let obj = TOrderObject()
       obj.accepted_date = self.accepted_date
       obj.confirmed_date = self.confirmed_date
       obj.coupon_code = self.coupon_code
       obj.coupon_discount = self.coupon_discount
       obj.created_at = self.created_at
       obj.customer_id = self.customer_id
       obj.customer_mobile = self.customer_mobile
       obj.customer_name = self.customer_name
       obj.customer_photo = self.customer_photo
       obj.descriptions = self.descriptions
       obj.files = self.files
       obj.finished_date = self.finished_date
       obj.full_address = self.full_address
       obj.icon_url = self.icon_url
       obj.name = self.name
       obj.order_date = self.order_date
       obj.order_desc = self.order_desc
       obj.order_no = self.order_no
       obj.order_rated = self.order_rated
       obj.order_time = self.order_time
       obj.payed_date = self.payed_date
       obj.photos = self.photos
       obj.picture_url = self.picture_url
       obj.pk_i_id = self.pk_i_id
       obj.price = self.price
       obj.processing_date = self.processing_date
       obj.provider_id = self.provider_id
       obj.provider_mobile = self.provider_mobile
       obj.provider_name = self.provider_name
       obj.provider_notes = self.provider_notes
       obj.provider_photo = self.provider_photo
       obj.provider_rate = self.provider_rate
       obj.service_detail_id = self.service_detail_id
       obj.service_detail_name = self.service_detail_name
       obj.service_detail_name_photo = self.service_detail_name_photo
       obj.service_id = self.service_id
       obj.service_name = self.service_name
       obj.status = self.status
       obj.total_price = self.total_price

       return obj
    }
    public override var description: String{
        var description: String = "<TOrder: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"accepted_date\" : \(accepted_date != nil ? "\"\(accepted_date?.description ?? "nil")\"" : "\(accepted_date?.description ?? "nil")");"
        description += "\n    \"confirmed_date\" : \(confirmed_date != nil ? "\"\(confirmed_date?.description ?? "nil")\"" : "\(confirmed_date?.description ?? "nil")");"
        description += "\n    \"coupon_code\" : \(coupon_code != nil ? "\"\(coupon_code?.description ?? "nil")\"" : "\(coupon_code?.description ?? "nil")");"
        description += "\n    \"coupon_discount\" : \(coupon_discount != nil ? "\"\(coupon_discount?.description ?? "nil")\"" : "\(coupon_discount?.description ?? "nil")");"
        description += "\n    \"created_at\" : \(created_at != nil ? "\"\(created_at?.description ?? "nil")\"" : "\(created_at?.description ?? "nil")");"
        description += "\n    \"customer_id\" : \(customer_id?.description ?? "nil");"
        description += "\n    \"customer_mobile\" : \(customer_mobile != nil ? "\"\(customer_mobile?.description ?? "nil")\"" : "\(customer_mobile?.description ?? "nil")");"
        description += "\n    \"customer_name\" : \(customer_name != nil ? "\"\(customer_name?.description ?? "nil")\"" : "\(customer_name?.description ?? "nil")");"
        description += "\n    \"customer_photo\" : \(customer_photo != nil ? "\"\(customer_photo?.description ?? "nil")\"" : "\(customer_photo?.description ?? "nil")");"
        description += "\n    \"descriptions\" : \(descriptions != nil ? "\"\(descriptions?.description ?? "nil")\"" : "\(descriptions?.description ?? "nil")");"
        description += "\n    \"files\" : \(files != nil ? "\"\(files?.description ?? "nil")\"" : "\(files?.description ?? "nil")");"
        description += "\n    \"finished_date\" : \(finished_date != nil ? "\"\(finished_date?.description ?? "nil")\"" : "\(finished_date?.description ?? "nil")");"
        description += "\n    \"full_address\" : \(full_address != nil ? "\"\(full_address?.description ?? "nil")\"" : "\(full_address?.description ?? "nil")");"
        description += "\n    \"icon_url\" : \(icon_url != nil ? "\"\(icon_url?.description ?? "nil")\"" : "\(icon_url?.description ?? "nil")");"
        description += "\n    \"name\" : \(name != nil ? "\"\(name?.description ?? "nil")\"" : "\(name?.description ?? "nil")");"
        description += "\n    \"order_date\" : \(order_date != nil ? "\"\(order_date?.description ?? "nil")\"" : "\(order_date?.description ?? "nil")");"
        description += "\n    \"order_desc\" : \(order_desc != nil ? "\"\(order_desc?.description ?? "nil")\"" : "\(order_desc?.description ?? "nil")");"
        description += "\n    \"order_no\" : \(order_no?.description ?? "nil");"
        description += "\n    \"order_rated\" : \(order_rated?.description ?? "nil");"
        description += "\n    \"order_time\" : \(order_time != nil ? "\"\(order_time?.description ?? "nil")\"" : "\(order_time?.description ?? "nil")");"
        description += "\n    \"payed_date\" : \(payed_date != nil ? "\"\(payed_date?.description ?? "nil")\"" : "\(payed_date?.description ?? "nil")");"
        description += "\n    \"photos\" : \(photos != nil ? "\"\(photos?.description ?? "nil")\"" : "\(photos?.description ?? "nil")");"
        description += "\n    \"picture_url\" : \(picture_url != nil ? "\"\(picture_url?.description ?? "nil")\"" : "\(picture_url?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"price\" : \(price?.description ?? "nil");"
        description += "\n    \"processing_date\" : \(processing_date != nil ? "\"\(processing_date?.description ?? "nil")\"" : "\(processing_date?.description ?? "nil")");"
        description += "\n    \"provider_id\" : \(provider_id?.description ?? "nil");"
        description += "\n    \"provider_mobile\" : \(provider_mobile != nil ? "\"\(provider_mobile?.description ?? "nil")\"" : "\(provider_mobile?.description ?? "nil")");"
        description += "\n    \"provider_name\" : \(provider_name != nil ? "\"\(provider_name?.description ?? "nil")\"" : "\(provider_name?.description ?? "nil")");"
        description += "\n    \"provider_notes\" : \(provider_notes != nil ? "\"\(provider_notes?.description ?? "nil")\"" : "\(provider_notes?.description ?? "nil")");"
        description += "\n    \"provider_photo\" : \(provider_photo != nil ? "\"\(provider_photo?.description ?? "nil")\"" : "\(provider_photo?.description ?? "nil")");"
        description += "\n    \"provider_rate\" : \(provider_rate != nil ? "\"\(provider_rate?.description ?? "nil")\"" : "\(provider_rate?.description ?? "nil")");"
        description += "\n    \"service_detail_id\" : \(service_detail_id?.description ?? "nil");"
        description += "\n    \"service_detail_name\" : \(service_detail_name != nil ? "\"\(service_detail_name?.description ?? "nil")\"" : "\(service_detail_name?.description ?? "nil")");"
        description += "\n    \"service_detail_name_photo\" : \(service_detail_name_photo != nil ? "\"\(service_detail_name_photo?.description ?? "nil")\"" : "\(service_detail_name_photo?.description ?? "nil")");"
        description += "\n    \"service_id\" : \(service_id?.description ?? "nil");"
        description += "\n    \"service_name\" : \(service_name != nil ? "\"\(service_name?.description ?? "nil")\"" : "\(service_name?.description ?? "nil")");"
        description += "\n    \"status\" : \(status != nil ? "\"\(status?.description ?? "nil")\"" : "\(status?.description ?? "nil")");"
        description += "\n    \"total_price\" : \(total_price?.description ?? "nil");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TOrder?) -> Bool {
        return self == object
    }
    static func == (left: _TOrder, right: _TOrder) -> Bool {
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
    static func demoObject()-> TOrder?{
        let obj = TOrder.mr_createEntity()
        obj?.accepted_date = Randoms.randomFakeName()
        obj?.confirmed_date = Randoms.randomFakeName()
        obj?.coupon_code = Randoms.randomFakeName()
        obj?.coupon_discount = Randoms.randomFakeName()
        obj?.created_at = Randoms.randomFakeName()
        obj?.customer_id = NSNumber(value: Randoms.randomInt32())
        obj?.customer_mobile = Randoms.randomFakeName()
        obj?.customer_name = Randoms.randomFakeName()
        obj?.customer_photo = Randoms.randomFakeName()
        obj?.descriptions = Randoms.randomFakeName()
        obj?.files = nil
        obj?.finished_date = Randoms.randomFakeName()
        obj?.full_address = Randoms.randomFakeName()
        obj?.icon_url = Randoms.randomFakeName()
        obj?.name = Randoms.randomFakeName()
        obj?.order_date = Randoms.randomDate() as NSDate
        obj?.order_desc = Randoms.randomFakeName()
        obj?.order_no = NSNumber(value: Randoms.randomInt32())
        obj?.order_rated = NSNumber(value: Randoms.randomBool())
        obj?.order_time = Randoms.randomFakeName()
        obj?.payed_date = Randoms.randomFakeName()
        obj?.photos = nil
        obj?.picture_url = Randoms.randomFakeName()
        obj?.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj?.price = NSNumber(value: Randoms.randomDouble())
        obj?.processing_date = Randoms.randomFakeName()
        obj?.provider_id = NSNumber(value: Randoms.randomInt32())
        obj?.provider_mobile = Randoms.randomFakeName()
        obj?.provider_name = Randoms.randomFakeName()
        obj?.provider_notes = Randoms.randomFakeName()
        obj?.provider_photo = Randoms.randomFakeName()
        obj?.provider_rate = Randoms.randomFakeName()
        obj?.service_detail_id = NSNumber(value: Randoms.randomInt32())
        obj?.service_detail_name = Randoms.randomFakeName()
        obj?.service_detail_name_photo = Randoms.randomFakeName()
        obj?.service_id = NSNumber(value: Randoms.randomInt32())
        obj?.service_name = Randoms.randomFakeName()
        obj?.status = Randoms.randomFakeName()
        obj?.total_price = NSNumber(value: Randoms.randomDouble())
        return obj
    }
    static func demoArray()-> [TOrder]{
        var arr = [TOrder]()
        for _ in 1...GlobalConstants.API_PageSize {
            if let usr = TOrder.demoObject() {
                arr.append(usr)
            }
        }
        return arr
    }
    #endif

}





public class _TOrderObject: NSObject {
   public class var entityName: String {
      return "TOrderObject"
   }

   @objc public var accepted_date: String?
   @objc public var confirmed_date: String?
   @objc public var coupon_code: String?
   @objc public var coupon_discount: String?
   @objc public var created_at: String?
   @objc public var customer_id: NSNumber?
   @objc public var customer_mobile: String?
   @objc public var customer_name: String?
   @objc public var customer_photo: String?
   @objc public var descriptions: String?
   @objc public var files: NSObject?
   @objc public var finished_date: String?
   @objc public var full_address: String?
   @objc public var icon_url: String?
   @objc public var name: String?
   @objc public var order_date: NSDate?
   @objc public var order_desc: String?
   @objc public var order_no: NSNumber?
   @objc public var order_rated: NSNumber?
   @objc public var order_time: String?
   @objc public var payed_date: String?
   @objc public var photos: NSObject?
   @objc public var picture_url: String?
   @objc public var pk_i_id: NSNumber?
   @objc public var price: NSNumber?
   @objc public var processing_date: String?
   @objc public var provider_id: NSNumber?
   @objc public var provider_mobile: String?
   @objc public var provider_name: String?
   @objc public var provider_notes: String?
   @objc public var provider_photo: String?
   @objc public var provider_rate: String?
   @objc public var service_detail_id: NSNumber?
   @objc public var service_detail_name: String?
   @objc public var service_detail_name_photo: String?
   @objc public var service_id: NSNumber?
   @objc public var service_name: String?
   @objc public var status: String?
   @objc public var total_price: NSNumber?


   static let rKmapping : RKObjectMapping = {
        var TOrderObjectMapping = RKObjectMapping(for: TOrderObject.classForCoder())
        TOrderObjectMapping?.addAttributeMappings(from: [
                "accepted_date":"accepted_date",
                "confirmed_date":"confirmed_date",
                "coupon_code":"coupon_code",
                "coupon_discount":"coupon_discount",
                "created_at":"created_at",
                "customer_id":"customer_id",
                "customer_mobile":"customer_mobile",
                "customer_name":"customer_name",
                "customer_photo":"customer_photo",
                "descriptions":"descriptions",
                "files":"files",
                "finished_date":"finished_date",
                "full_address":"full_address",
                "icon_url":"icon_url",
                "name":"name",
                "order_date":"order_date",
                "order_desc":"order_desc",
                "order_no":"order_no",
                "order_rated":"order_rated",
                "order_time":"order_time",
                "payed_date":"payed_date",
                "photos":"photos",
                "picture_url":"picture_url",
                "id":"pk_i_id",
                "price":"price",
                "processing_date":"processing_date",
                "provider_id":"provider_id",
                "provider_mobile":"provider_mobile",
                "provider_name":"provider_name",
                "provider_notes":"provider_notes",
                "provider_photo":"provider_photo",
                "provider_rate":"provider_rate",
                "service_detail_id":"service_detail_id",
                "service_detail_name":"service_detail_name",
                "service_detail_name_photo":"service_detail_name_photo",
                "service_id":"service_id",
                "service_name":"service_name",
                "status":"status",
                "total_price":"total_price",

            ])
        return TOrderObjectMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////

        ///// Many To One Or Many Relationships /////
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["accepted_date"] = accepted_date
        dictionary["confirmed_date"] = confirmed_date
        dictionary["coupon_code"] = coupon_code
        dictionary["coupon_discount"] = coupon_discount
        dictionary["created_at"] = created_at
        dictionary["customer_id"] = customer_id
        dictionary["customer_mobile"] = customer_mobile
        dictionary["customer_name"] = customer_name
        dictionary["customer_photo"] = customer_photo
        dictionary["descriptions"] = descriptions
        dictionary["files"] = files
        dictionary["finished_date"] = finished_date
        dictionary["full_address"] = full_address
        dictionary["icon_url"] = icon_url
        dictionary["name"] = name
        dictionary["order_date"] = order_date
        dictionary["order_desc"] = order_desc
        dictionary["order_no"] = order_no
        dictionary["order_rated"] = order_rated
        dictionary["order_time"] = order_time
        dictionary["payed_date"] = payed_date
        dictionary["photos"] = photos
        dictionary["picture_url"] = picture_url
        dictionary["id"] = pk_i_id
        dictionary["price"] = price
        dictionary["processing_date"] = processing_date
        dictionary["provider_id"] = provider_id
        dictionary["provider_mobile"] = provider_mobile
        dictionary["provider_name"] = provider_name
        dictionary["provider_notes"] = provider_notes
        dictionary["provider_photo"] = provider_photo
        dictionary["provider_rate"] = provider_rate
        dictionary["service_detail_id"] = service_detail_id
        dictionary["service_detail_name"] = service_detail_name
        dictionary["service_detail_name_photo"] = service_detail_name_photo
        dictionary["service_id"] = service_id
        dictionary["service_name"] = service_name
        dictionary["status"] = status
        dictionary["total_price"] = total_price


        return dictionary
    }

    public override var description: String{
        var description: String = "<TOrderObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"accepted_date\" : \(accepted_date != nil ? "\"\(accepted_date?.description ?? "nil")\"" : "\(accepted_date?.description ?? "nil")");"
        description += "\n    \"confirmed_date\" : \(confirmed_date != nil ? "\"\(confirmed_date?.description ?? "nil")\"" : "\(confirmed_date?.description ?? "nil")");"
        description += "\n    \"coupon_code\" : \(coupon_code != nil ? "\"\(coupon_code?.description ?? "nil")\"" : "\(coupon_code?.description ?? "nil")");"
        description += "\n    \"coupon_discount\" : \(coupon_discount != nil ? "\"\(coupon_discount?.description ?? "nil")\"" : "\(coupon_discount?.description ?? "nil")");"
        description += "\n    \"created_at\" : \(created_at != nil ? "\"\(created_at?.description ?? "nil")\"" : "\(created_at?.description ?? "nil")");"
        description += "\n    \"customer_id\" : \(customer_id?.description ?? "nil");"
        description += "\n    \"customer_mobile\" : \(customer_mobile != nil ? "\"\(customer_mobile?.description ?? "nil")\"" : "\(customer_mobile?.description ?? "nil")");"
        description += "\n    \"customer_name\" : \(customer_name != nil ? "\"\(customer_name?.description ?? "nil")\"" : "\(customer_name?.description ?? "nil")");"
        description += "\n    \"customer_photo\" : \(customer_photo != nil ? "\"\(customer_photo?.description ?? "nil")\"" : "\(customer_photo?.description ?? "nil")");"
        description += "\n    \"descriptions\" : \(descriptions != nil ? "\"\(descriptions?.description ?? "nil")\"" : "\(descriptions?.description ?? "nil")");"
        description += "\n    \"files\" : \(files != nil ? "\"\(files?.description ?? "nil")\"" : "\(files?.description ?? "nil")");"
        description += "\n    \"finished_date\" : \(finished_date != nil ? "\"\(finished_date?.description ?? "nil")\"" : "\(finished_date?.description ?? "nil")");"
        description += "\n    \"full_address\" : \(full_address != nil ? "\"\(full_address?.description ?? "nil")\"" : "\(full_address?.description ?? "nil")");"
        description += "\n    \"icon_url\" : \(icon_url != nil ? "\"\(icon_url?.description ?? "nil")\"" : "\(icon_url?.description ?? "nil")");"
        description += "\n    \"name\" : \(name != nil ? "\"\(name?.description ?? "nil")\"" : "\(name?.description ?? "nil")");"
        description += "\n    \"order_date\" : \(order_date != nil ? "\"\(order_date?.description ?? "nil")\"" : "\(order_date?.description ?? "nil")");"
        description += "\n    \"order_desc\" : \(order_desc != nil ? "\"\(order_desc?.description ?? "nil")\"" : "\(order_desc?.description ?? "nil")");"
        description += "\n    \"order_no\" : \(order_no?.description ?? "nil");"
        description += "\n    \"order_rated\" : \(order_rated?.description ?? "nil");"
        description += "\n    \"order_time\" : \(order_time != nil ? "\"\(order_time?.description ?? "nil")\"" : "\(order_time?.description ?? "nil")");"
        description += "\n    \"payed_date\" : \(payed_date != nil ? "\"\(payed_date?.description ?? "nil")\"" : "\(payed_date?.description ?? "nil")");"
        description += "\n    \"photos\" : \(photos != nil ? "\"\(photos?.description ?? "nil")\"" : "\(photos?.description ?? "nil")");"
        description += "\n    \"picture_url\" : \(picture_url != nil ? "\"\(picture_url?.description ?? "nil")\"" : "\(picture_url?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"price\" : \(price?.description ?? "nil");"
        description += "\n    \"processing_date\" : \(processing_date != nil ? "\"\(processing_date?.description ?? "nil")\"" : "\(processing_date?.description ?? "nil")");"
        description += "\n    \"provider_id\" : \(provider_id?.description ?? "nil");"
        description += "\n    \"provider_mobile\" : \(provider_mobile != nil ? "\"\(provider_mobile?.description ?? "nil")\"" : "\(provider_mobile?.description ?? "nil")");"
        description += "\n    \"provider_name\" : \(provider_name != nil ? "\"\(provider_name?.description ?? "nil")\"" : "\(provider_name?.description ?? "nil")");"
        description += "\n    \"provider_notes\" : \(provider_notes != nil ? "\"\(provider_notes?.description ?? "nil")\"" : "\(provider_notes?.description ?? "nil")");"
        description += "\n    \"provider_photo\" : \(provider_photo != nil ? "\"\(provider_photo?.description ?? "nil")\"" : "\(provider_photo?.description ?? "nil")");"
        description += "\n    \"provider_rate\" : \(provider_rate != nil ? "\"\(provider_rate?.description ?? "nil")\"" : "\(provider_rate?.description ?? "nil")");"
        description += "\n    \"service_detail_id\" : \(service_detail_id?.description ?? "nil");"
        description += "\n    \"service_detail_name\" : \(service_detail_name != nil ? "\"\(service_detail_name?.description ?? "nil")\"" : "\(service_detail_name?.description ?? "nil")");"
        description += "\n    \"service_detail_name_photo\" : \(service_detail_name_photo != nil ? "\"\(service_detail_name_photo?.description ?? "nil")\"" : "\(service_detail_name_photo?.description ?? "nil")");"
        description += "\n    \"service_id\" : \(service_id?.description ?? "nil");"
        description += "\n    \"service_name\" : \(service_name != nil ? "\"\(service_name?.description ?? "nil")\"" : "\(service_name?.description ?? "nil")");"
        description += "\n    \"status\" : \(status != nil ? "\"\(status?.description ?? "nil")\"" : "\(status?.description ?? "nil")");"
        description += "\n    \"total_price\" : \(total_price?.description ?? "nil");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TOrderObject?) -> Bool {
        return self == object
    }
    static func == (left: _TOrderObject, right: _TOrderObject) -> Bool {
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
    static func demoObject()-> TOrderObject{
        let obj = TOrderObject()
        obj.accepted_date = Randoms.randomFakeName()
        obj.confirmed_date = Randoms.randomFakeName()
        obj.coupon_code = Randoms.randomFakeName()
        obj.coupon_discount = Randoms.randomFakeName()
        obj.created_at = Randoms.randomFakeName()
        obj.customer_id = NSNumber(value: Randoms.randomInt32())
        obj.customer_mobile = Randoms.randomFakeName()
        obj.customer_name = Randoms.randomFakeName()
        obj.customer_photo = Randoms.randomFakeName()
        obj.descriptions = Randoms.randomFakeName()
        obj.files = nil
        obj.finished_date = Randoms.randomFakeName()
        obj.full_address = Randoms.randomFakeName()
        obj.icon_url = Randoms.randomFakeName()
        obj.name = Randoms.randomFakeName()
        obj.order_date = Randoms.randomDate() as NSDate
        obj.order_desc = Randoms.randomFakeName()
        obj.order_no = NSNumber(value: Randoms.randomInt32())
        obj.order_rated = NSNumber(value: Randoms.randomBool())
        obj.order_time = Randoms.randomFakeName()
        obj.payed_date = Randoms.randomFakeName()
        obj.photos = nil
        obj.picture_url = Randoms.randomFakeName()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.price = NSNumber(value: Randoms.randomDouble())
        obj.processing_date = Randoms.randomFakeName()
        obj.provider_id = NSNumber(value: Randoms.randomInt32())
        obj.provider_mobile = Randoms.randomFakeName()
        obj.provider_name = Randoms.randomFakeName()
        obj.provider_notes = Randoms.randomFakeName()
        obj.provider_photo = Randoms.randomFakeName()
        obj.provider_rate = Randoms.randomFakeName()
        obj.service_detail_id = NSNumber(value: Randoms.randomInt32())
        obj.service_detail_name = Randoms.randomFakeName()
        obj.service_detail_name_photo = Randoms.randomFakeName()
        obj.service_id = NSNumber(value: Randoms.randomInt32())
        obj.service_name = Randoms.randomFakeName()
        obj.status = Randoms.randomFakeName()
        obj.total_price = NSNumber(value: Randoms.randomDouble())
        return obj
    }
    static func demoArray()-> [TOrderObject]{
        var arr = [TOrderObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TOrderObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}


#elseif canImport(Alamofire)
public class _TOrderObject: NSObject,NSCoding,NSCopying {
    @objc public var service_type: String?
    @objc public var service_type_name: String?
    @objc public var accepted_date: String?
    @objc public var confirmed_date: String?
    @objc public var coupon_code: String?
    @objc public var coupon_discount: String?
    @objc public var created_at: String?
    @objc public var customer_id: NSNumber?
    @objc public var customer_mobile: String?
    @objc public var customer_name: String?
    @objc public var customer_photo: String?
    @objc public var descriptions: String?
    @objc public var files: NSObject?
    @objc public var finished_date: String?
    @objc public var full_address: String?
    @objc public var icon_url: String?
    @objc public var name: String?
    @objc public var order_date: NSDate?
    @objc public var order_dateString: String?
    @objc public var audio_description: String?
    @objc public var order_desc: String?
    @objc public var order_no: NSNumber?
    @objc public var order_rated: NSNumber?
    @objc public var order_time: String?
    @objc public var payed_date: String?
    @objc public var photos: NSObject?
    @objc public var picture_url: String?
    @objc public var pk_i_id: NSNumber?
    @objc public var price: NSNumber?
    @objc public var processing_date: String?
    @objc public var provider_id: NSNumber?
    @objc public var provider_mobile: String?
    @objc public var provider_name: String?
    @objc public var provider_notes: String?
    @objc public var provider_photo: String?
    @objc public var provider_rate: String?
    @objc public var service_detail_id: NSNumber?
    @objc public var service_detail_name: String?
    @objc public var service_detail_name_photo: String?
    @objc public var service_id: NSNumber?
    @objc public var service_name: String?
    @objc public var status: String?
    @objc public var total_price: NSNumber?


    init(fromDictionary dictionary: NSDictionary){
        service_type = dictionary.value(forKeyPath: "service_type") as? String
        service_type_name = dictionary.value(forKeyPath: "service_type_name") as? String
        audio_description  = dictionary.value(forKeyPath: "audio_description") as? String
        service_type = dictionary.value(forKeyPath: "accepted_date") as? String
        confirmed_date = dictionary.value(forKeyPath: "confirmed_date") as? String
        coupon_code = dictionary.value(forKeyPath: "coupon_code") as? String
        coupon_discount = dictionary.value(forKeyPath: "coupon_discount") as? String
        created_at = dictionary.value(forKeyPath: "created_at") as? String
        customer_id = dictionary.value(forKeyPath: "customer_id") as? NSNumber
        customer_mobile = dictionary.value(forKeyPath: "customer_mobile") as? String
        customer_name = dictionary.value(forKeyPath: "customer_name") as? String
        customer_photo = dictionary.value(forKeyPath: "customer_photo") as? String
        descriptions = dictionary.value(forKeyPath: "descriptions") as? String
        files = dictionary.value(forKeyPath: "files") as? NSObject
        finished_date = dictionary.value(forKeyPath: "finished_date") as? String
        full_address = dictionary.value(forKeyPath: "full_address") as? String
        icon_url = dictionary.value(forKeyPath: "icon_url") as? String
        name = dictionary.value(forKeyPath: "name") as? String
        order_date = NSDate.mapperDateFormatter.formats(fromString:dictionary.value(forKeyPath: "order_date")  as? String)
        order_dateString = dictionary.value(forKeyPath: "order_date") as? String

        order_desc = dictionary.value(forKeyPath: "order_desc") as? String
        order_no = NumberFormatter().number(from: dictionary.value(forKeyPath: "order_no") as? String ?? "0")
        order_rated = dictionary.value(forKeyPath: "order_rated") as? NSNumber
        order_time = dictionary.value(forKeyPath: "order_time") as? String
        payed_date = dictionary.value(forKeyPath: "payed_date") as? String
        photos = dictionary.value(forKeyPath: "photos") as? NSObject
        picture_url = dictionary.value(forKeyPath: "picture_url") as? String
        pk_i_id = dictionary.value(forKeyPath: "id") as? NSNumber
        price = dictionary.value(forKeyPath: "price") as? NSNumber
        processing_date = dictionary.value(forKeyPath: "processing_date") as? String
        provider_id = dictionary.value(forKeyPath: "provider_id") as? NSNumber
        provider_mobile = dictionary.value(forKeyPath: "provider_mobile") as? String
        provider_name = dictionary.value(forKeyPath: "provider_name") as? String
        provider_notes = dictionary.value(forKeyPath: "provider_notes") as? String
        provider_photo = dictionary.value(forKeyPath: "provider_photo") as? String
        provider_rate = dictionary.value(forKeyPath: "provider_rate") as? String
        service_detail_id = dictionary.value(forKeyPath: "service_detail_id") as? NSNumber
        service_detail_name = dictionary.value(forKeyPath: "service_detail_name") as? String
        service_detail_name_photo = dictionary.value(forKeyPath: "service_detail_name_photo") as? String
        service_id = dictionary.value(forKeyPath: "service_id") as? NSNumber
        service_name = dictionary.value(forKeyPath: "service_name") as? String
        status = dictionary.value(forKeyPath: "status") as? String
        total_price = dictionary.value(forKeyPath: "total_price") as? NSNumber

    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()
        dictionary["service_type"] = service_type
        dictionary["service_type_name"] = service_type_name

        dictionary["accepted_date"] = accepted_date
        dictionary["confirmed_date"] = confirmed_date
        dictionary["coupon_code"] = coupon_code
        dictionary["coupon_discount"] = coupon_discount
        dictionary["created_at"] = created_at
        dictionary["customer_id"] = customer_id
        dictionary["customer_mobile"] = customer_mobile
        dictionary["customer_name"] = customer_name
        dictionary["customer_photo"] = customer_photo
        dictionary["descriptions"] = descriptions
        dictionary["files"] = files
        dictionary["finished_date"] = finished_date
        dictionary["full_address"] = full_address
        dictionary["icon_url"] = icon_url
        dictionary["name"] = name
        dictionary["order_date"] = order_date
        dictionary["order_desc"] = order_desc
        dictionary["order_no"] = order_no
        dictionary["order_rated"] = order_rated
        dictionary["order_time"] = order_time
        dictionary["payed_date"] = payed_date
        dictionary["photos"] = photos
        dictionary["picture_url"] = picture_url
        dictionary["id"] = pk_i_id
        dictionary["price"] = price
        dictionary["processing_date"] = processing_date
        dictionary["provider_id"] = provider_id
        dictionary["provider_mobile"] = provider_mobile
        dictionary["provider_name"] = provider_name
        dictionary["provider_notes"] = provider_notes
        dictionary["provider_photo"] = provider_photo
        dictionary["provider_rate"] = provider_rate
        dictionary["service_detail_id"] = service_detail_id
        dictionary["service_detail_name"] = service_detail_name
        dictionary["service_detail_name_photo"] = service_detail_name_photo
        dictionary["service_id"] = service_id
        dictionary["service_name"] = service_name
        dictionary["status"] = status
        dictionary["total_price"] = total_price


        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder){
        service_type = aDecoder.decodeObject(forKey:"service_type") as? String
        service_type_name  = aDecoder.decodeObject(forKey:"service_type_name") as? String
        accepted_date = aDecoder.decodeObject(forKey:"accepted_date") as? String
        confirmed_date = aDecoder.decodeObject(forKey:"confirmed_date") as? String
        coupon_code = aDecoder.decodeObject(forKey:"coupon_code") as? String
        coupon_discount = aDecoder.decodeObject(forKey:"coupon_discount") as? String
        created_at = aDecoder.decodeObject(forKey:"created_at") as? String
        customer_id = aDecoder.decodeObject(forKey:"customer_id") as? NSNumber
        customer_mobile = aDecoder.decodeObject(forKey:"customer_mobile") as? String
        customer_name = aDecoder.decodeObject(forKey:"customer_name") as? String
        customer_photo = aDecoder.decodeObject(forKey:"customer_photo") as? String
        descriptions = aDecoder.decodeObject(forKey:"descriptions") as? String
        files = aDecoder.decodeObject(forKey:"files") as? NSObject
        finished_date = aDecoder.decodeObject(forKey:"finished_date") as? String
        full_address = aDecoder.decodeObject(forKey:"full_address") as? String
        icon_url = aDecoder.decodeObject(forKey:"icon_url") as? String
        name = aDecoder.decodeObject(forKey:"name") as? String
        order_date = aDecoder.decodeObject(forKey:"order_date") as? NSDate
        order_desc = aDecoder.decodeObject(forKey:"order_desc") as? String
        order_no = aDecoder.decodeObject(forKey:"order_no") as? NSNumber
        order_rated = aDecoder.decodeObject(forKey:"order_rated") as? NSNumber
        order_time = aDecoder.decodeObject(forKey:"order_time") as? String
        payed_date = aDecoder.decodeObject(forKey:"payed_date") as? String
        photos = aDecoder.decodeObject(forKey:"photos") as? NSObject
        picture_url = aDecoder.decodeObject(forKey:"picture_url") as? String
        pk_i_id = aDecoder.decodeObject(forKey:"id") as? NSNumber
        price = aDecoder.decodeObject(forKey:"price") as? NSNumber
        processing_date = aDecoder.decodeObject(forKey:"processing_date") as? String
        provider_id = aDecoder.decodeObject(forKey:"provider_id") as? NSNumber
        provider_mobile = aDecoder.decodeObject(forKey:"provider_mobile") as? String
        provider_name = aDecoder.decodeObject(forKey:"provider_name") as? String
        provider_notes = aDecoder.decodeObject(forKey:"provider_notes") as? String
        provider_photo = aDecoder.decodeObject(forKey:"provider_photo") as? String
        provider_rate = aDecoder.decodeObject(forKey:"provider_rate") as? String
        service_detail_id = aDecoder.decodeObject(forKey:"service_detail_id") as? NSNumber
        service_detail_name = aDecoder.decodeObject(forKey:"service_detail_name") as? String
        service_detail_name_photo = aDecoder.decodeObject(forKey:"service_detail_name_photo") as? String
        service_id = aDecoder.decodeObject(forKey:"service_id") as? NSNumber
        service_name = aDecoder.decodeObject(forKey:"service_name") as? String
        status = aDecoder.decodeObject(forKey:"status") as? String
        total_price = aDecoder.decodeObject(forKey:"total_price") as? NSNumber

    }

    @objc public func encode(with aCoder: NSCoder){
        if accepted_date != nil{
            aCoder.encode(accepted_date, forKey: "accepted_date")
        }
        if confirmed_date != nil{
            aCoder.encode(confirmed_date, forKey: "confirmed_date")
        }
        if coupon_code != nil{
            aCoder.encode(coupon_code, forKey: "coupon_code")
        }
        if coupon_discount != nil{
            aCoder.encode(coupon_discount, forKey: "coupon_discount")
        }
        if created_at != nil{
            aCoder.encode(created_at, forKey: "created_at")
        }
        if customer_id != nil{
            aCoder.encode(customer_id, forKey: "customer_id")
        }
        if customer_mobile != nil{
            aCoder.encode(customer_mobile, forKey: "customer_mobile")
        }
        if customer_name != nil{
            aCoder.encode(customer_name, forKey: "customer_name")
        }
        if customer_photo != nil{
            aCoder.encode(customer_photo, forKey: "customer_photo")
        }
        if service_type_name != nil{
            aCoder.encode(service_type_name, forKey: "service_type_name")
        }
        if service_type != nil{
            aCoder.encode(service_type, forKey: "service_type")
        }
        
        if descriptions != nil{
            aCoder.encode(descriptions, forKey: "descriptions")
        }
        if files != nil{
            aCoder.encode(files, forKey: "files")
        }
        if finished_date != nil{
            aCoder.encode(finished_date, forKey: "finished_date")
        }
        if full_address != nil{
            aCoder.encode(full_address, forKey: "full_address")
        }
        if icon_url != nil{
            aCoder.encode(icon_url, forKey: "icon_url")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if order_date != nil{
            aCoder.encode(order_date, forKey: "order_date")
        }
        if order_desc != nil{
            aCoder.encode(order_desc, forKey: "order_desc")
        }
        if order_no != nil{
            aCoder.encode(order_no, forKey: "order_no")
        }
        if order_rated != nil{
            aCoder.encode(order_rated, forKey: "order_rated")
        }
        if order_time != nil{
            aCoder.encode(order_time, forKey: "order_time")
        }
        if payed_date != nil{
            aCoder.encode(payed_date, forKey: "payed_date")
        }
        if photos != nil{
            aCoder.encode(photos, forKey: "photos")
        }
        if picture_url != nil{
            aCoder.encode(picture_url, forKey: "picture_url")
        }
        if pk_i_id != nil{
            aCoder.encode(pk_i_id, forKey: "id")
        }
        if price != nil{
            aCoder.encode(price, forKey: "price")
        }
        if processing_date != nil{
            aCoder.encode(processing_date, forKey: "processing_date")
        }
        if provider_id != nil{
            aCoder.encode(provider_id, forKey: "provider_id")
        }
        if provider_mobile != nil{
            aCoder.encode(provider_mobile, forKey: "provider_mobile")
        }
        if provider_name != nil{
            aCoder.encode(provider_name, forKey: "provider_name")
        }
        if provider_notes != nil{
            aCoder.encode(provider_notes, forKey: "provider_notes")
        }
        if provider_photo != nil{
            aCoder.encode(provider_photo, forKey: "provider_photo")
        }
        if provider_rate != nil{
            aCoder.encode(provider_rate, forKey: "provider_rate")
        }
        if service_detail_id != nil{
            aCoder.encode(service_detail_id, forKey: "service_detail_id")
        }
        if service_detail_name != nil{
            aCoder.encode(service_detail_name, forKey: "service_detail_name")
        }
        if service_detail_name_photo != nil{
            aCoder.encode(service_detail_name_photo, forKey: "service_detail_name_photo")
        }
        if service_id != nil{
            aCoder.encode(service_id, forKey: "service_id")
        }
        if service_name != nil{
            aCoder.encode(service_name, forKey: "service_name")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if total_price != nil{
            aCoder.encode(total_price, forKey: "total_price")
        }

    }
    public func copy(with zone: NSZone? = nil) -> Any {
        return TOrderObject(fromDictionary: self.toDictionary() as NSDictionary)
    }
    public override var description: String{
        var description: String = "<TOrderObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"accepted_date\" : \(accepted_date != nil ? "\"\(accepted_date?.description ?? "nil")\"" : "\(accepted_date?.description ?? "nil")");"
        description += "\n    \"confirmed_date\" : \(confirmed_date != nil ? "\"\(confirmed_date?.description ?? "nil")\"" : "\(confirmed_date?.description ?? "nil")");"
        description += "\n    \"coupon_code\" : \(coupon_code != nil ? "\"\(coupon_code?.description ?? "nil")\"" : "\(coupon_code?.description ?? "nil")");"
        description += "\n    \"coupon_discount\" : \(coupon_discount != nil ? "\"\(coupon_discount?.description ?? "nil")\"" : "\(coupon_discount?.description ?? "nil")");"
        description += "\n    \"created_at\" : \(created_at != nil ? "\"\(created_at?.description ?? "nil")\"" : "\(created_at?.description ?? "nil")");"
        description += "\n    \"customer_id\" : \(customer_id?.description ?? "nil");"
        description += "\n    \"customer_mobile\" : \(customer_mobile != nil ? "\"\(customer_mobile?.description ?? "nil")\"" : "\(customer_mobile?.description ?? "nil")");"
        description += "\n    \"customer_name\" : \(customer_name != nil ? "\"\(customer_name?.description ?? "nil")\"" : "\(customer_name?.description ?? "nil")");"
        description += "\n    \"customer_photo\" : \(customer_photo != nil ? "\"\(customer_photo?.description ?? "nil")\"" : "\(customer_photo?.description ?? "nil")");"
        description += "\n    \"descriptions\" : \(descriptions != nil ? "\"\(descriptions?.description ?? "nil")\"" : "\(descriptions?.description ?? "nil")");"
        description += "\n    \"files\" : \(files != nil ? "\"\(files?.description ?? "nil")\"" : "\(files?.description ?? "nil")");"
        description += "\n    \"finished_date\" : \(finished_date != nil ? "\"\(finished_date?.description ?? "nil")\"" : "\(finished_date?.description ?? "nil")");"
        description += "\n    \"full_address\" : \(full_address != nil ? "\"\(full_address?.description ?? "nil")\"" : "\(full_address?.description ?? "nil")");"
        description += "\n    \"icon_url\" : \(icon_url != nil ? "\"\(icon_url?.description ?? "nil")\"" : "\(icon_url?.description ?? "nil")");"
        description += "\n    \"name\" : \(name != nil ? "\"\(name?.description ?? "nil")\"" : "\(name?.description ?? "nil")");"
        description += "\n    \"order_date\" : \(order_date != nil ? "\"\(order_date?.description ?? "nil")\"" : "\(order_date?.description ?? "nil")");"
        description += "\n    \"order_desc\" : \(order_desc != nil ? "\"\(order_desc?.description ?? "nil")\"" : "\(order_desc?.description ?? "nil")");"
        description += "\n    \"order_no\" : \(order_no?.description ?? "nil");"
        description += "\n    \"order_rated\" : \(order_rated?.description ?? "nil");"
        description += "\n    \"order_time\" : \(order_time != nil ? "\"\(order_time?.description ?? "nil")\"" : "\(order_time?.description ?? "nil")");"
        description += "\n    \"payed_date\" : \(payed_date != nil ? "\"\(payed_date?.description ?? "nil")\"" : "\(payed_date?.description ?? "nil")");"
        description += "\n    \"photos\" : \(photos != nil ? "\"\(photos?.description ?? "nil")\"" : "\(photos?.description ?? "nil")");"
        description += "\n    \"picture_url\" : \(picture_url != nil ? "\"\(picture_url?.description ?? "nil")\"" : "\(picture_url?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"price\" : \(price?.description ?? "nil");"
        description += "\n    \"processing_date\" : \(processing_date != nil ? "\"\(processing_date?.description ?? "nil")\"" : "\(processing_date?.description ?? "nil")");"
        description += "\n    \"provider_id\" : \(provider_id?.description ?? "nil");"
        description += "\n    \"provider_mobile\" : \(provider_mobile != nil ? "\"\(provider_mobile?.description ?? "nil")\"" : "\(provider_mobile?.description ?? "nil")");"
        description += "\n    \"provider_name\" : \(provider_name != nil ? "\"\(provider_name?.description ?? "nil")\"" : "\(provider_name?.description ?? "nil")");"
        description += "\n    \"provider_notes\" : \(provider_notes != nil ? "\"\(provider_notes?.description ?? "nil")\"" : "\(provider_notes?.description ?? "nil")");"
        description += "\n    \"provider_photo\" : \(provider_photo != nil ? "\"\(provider_photo?.description ?? "nil")\"" : "\(provider_photo?.description ?? "nil")");"
        description += "\n    \"provider_rate\" : \(provider_rate != nil ? "\"\(provider_rate?.description ?? "nil")\"" : "\(provider_rate?.description ?? "nil")");"
        description += "\n    \"service_detail_id\" : \(service_detail_id?.description ?? "nil");"
        description += "\n    \"service_detail_name\" : \(service_detail_name != nil ? "\"\(service_detail_name?.description ?? "nil")\"" : "\(service_detail_name?.description ?? "nil")");"
        description += "\n    \"service_detail_name_photo\" : \(service_detail_name_photo != nil ? "\"\(service_detail_name_photo?.description ?? "nil")\"" : "\(service_detail_name_photo?.description ?? "nil")");"
        description += "\n    \"service_id\" : \(service_id?.description ?? "nil");"
        description += "\n    \"service_name\" : \(service_name != nil ? "\"\(service_name?.description ?? "nil")\"" : "\(service_name?.description ?? "nil")");"
        description += "\n    \"status\" : \(status != nil ? "\"\(status?.description ?? "nil")\"" : "\(status?.description ?? "nil")");"
        description += "\n    \"total_price\" : \(total_price?.description ?? "nil");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TOrderObject?) -> Bool {
        return self == object
    }
    static func == (left: _TOrderObject, right: _TOrderObject) -> Bool {
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
    static func demoObject()-> TOrderObject{
        let obj = TOrderObject(fromDictionary: ["":""])
        obj.accepted_date = Randoms.randomFakeName()
        obj.confirmed_date = Randoms.randomFakeName()
        obj.coupon_code = Randoms.randomFakeName()
        obj.coupon_discount = Randoms.randomFakeName()
        obj.created_at = Randoms.randomFakeName()
        obj.customer_id = NSNumber(value: Randoms.randomInt32())
        obj.customer_mobile = Randoms.randomFakeName()
        obj.customer_name = Randoms.randomFakeName()
        obj.customer_photo = Randoms.randomFakeName()
        obj.descriptions = Randoms.randomFakeName()
        obj.files = nil
        obj.finished_date = Randoms.randomFakeName()
        obj.full_address = Randoms.randomFakeName()
        obj.icon_url = Randoms.randomFakeName()
        obj.name = Randoms.randomFakeName()
        obj.order_date = Randoms.randomDate() as NSDate
        obj.order_desc = Randoms.randomFakeName()
        obj.order_no = NSNumber(value: Randoms.randomInt32())
        obj.order_rated = NSNumber(value: Randoms.randomBool())
        obj.order_time = Randoms.randomFakeName()
        obj.payed_date = Randoms.randomFakeName()
        obj.photos = nil
        obj.picture_url = Randoms.randomFakeName()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.price = NSNumber(value: Randoms.randomDouble())
        obj.processing_date = Randoms.randomFakeName()
        obj.provider_id = NSNumber(value: Randoms.randomInt32())
        obj.provider_mobile = Randoms.randomFakeName()
        obj.provider_name = Randoms.randomFakeName()
        obj.provider_notes = Randoms.randomFakeName()
        obj.provider_photo = Randoms.randomFakeName()
        obj.provider_rate = Randoms.randomFakeName()
        obj.service_detail_id = NSNumber(value: Randoms.randomInt32())
        obj.service_detail_name = Randoms.randomFakeName()
        obj.service_detail_name_photo = Randoms.randomFakeName()
        obj.service_id = NSNumber(value: Randoms.randomInt32())
        obj.service_name = Randoms.randomFakeName()
        obj.status = Randoms.randomFakeName()
        obj.total_price = NSNumber(value: Randoms.randomDouble())
        return obj
    }
    static func demoArray()-> [TOrderObject]{
        var arr = [TOrderObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TOrderObject.demoObject()
            arr.append(obj)
        }
        return arr
    }
    #endif

}

#endif

/************************* Mo’min J.Abusaada *************************/
