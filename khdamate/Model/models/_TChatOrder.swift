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

public enum TChatOrderAttributes: String {
   case chat_closed
   case confirmed_date
   case coupon_discount
   case created_at
   case currency
   case d_delivery_cost
   case d_delivery_distance
   case d_distance
   case d_duration
   case d_max_delivery_value
   case d_min_delivery_value
   case d_order_rate
   case d_pickup_distance
   case d_time
   case d_total_distance
   case dt_accepted
   case dt_created
   case dt_current
   case dt_delivery_date
   case dt_pickup_arrived
   case finished_date
   case full_address
   case i_rate
   case i_rate_count
   case offer_id
   case order_date
   case order_desc
   case order_no
   case order_rate
   case order_status
   case order_time
   case pk_i_id
   case price
   case provider_notes
   case s_app_profit_type
   case s_app_profit_value
   case s_currency
   case s_customer_picture
   case s_date
   case s_delivery_distance
   case s_delivery_full_address
   case s_delivery_latitude
   case s_delivery_longitude
   case s_details
   case s_distance
   case s_driver_name
   case s_driver_picture
   case s_duration
   case s_image
   case s_mobile
   case s_mobile_intro
   case s_pickup_distance
   case s_pickup_full_address
   case s_pickup_latitude
   case s_pickup_longitude
   case s_service_provider
   case s_service_provider_picture
   case s_time_text
   case s_total_distance
   case s_total_price
   case s_type
   case s_vehicle_color
   case s_vehicle_color_code
   case s_vehicle_model
   case s_voice_url
   case service_detail_name
   case service_name
   case total_price
}

public enum TChatOrderRelationships: String {
   case actions
   case chat
   case customer
   case payment_way
   case service_provider
}


public class _TChatOrder: NSManagedObject {
   public class var entityName: String {
      return "TChatOrder"
   }

   @objc @NSManaged public var chat_closed: NSNumber?
   @objc @NSManaged public var confirmed_date: String?
   @objc @NSManaged public var coupon_discount: String?
   @objc @NSManaged public var created_at: String?
   @objc @NSManaged public var currency: String?
   @objc @NSManaged public var d_delivery_cost: NSNumber?
   @objc @NSManaged public var d_delivery_distance: NSNumber?
   @objc @NSManaged public var d_distance: NSNumber?
   @objc @NSManaged public var d_duration: NSNumber?
   @objc @NSManaged public var d_max_delivery_value: NSNumber?
   @objc @NSManaged public var d_min_delivery_value: NSNumber?
   @objc @NSManaged public var d_order_rate: NSNumber?
   @objc @NSManaged public var d_pickup_distance: NSNumber?
   @objc @NSManaged public var d_time: NSNumber?
   @objc @NSManaged public var d_total_distance: NSNumber?
   @objc @NSManaged public var dt_accepted: NSDate?
   @objc @NSManaged public var dt_created: NSDate?
   @objc @NSManaged public var dt_current: NSDate?
   @objc @NSManaged public var dt_delivery_date: NSDate?
   @objc @NSManaged public var dt_pickup_arrived: NSDate?
   @objc @NSManaged public var finished_date: String?
   @objc @NSManaged public var full_address: String?
   @objc @NSManaged public var i_rate: NSNumber?
   @objc @NSManaged public var i_rate_count: NSNumber?
   @objc @NSManaged public var offer_id: NSNumber?
   @objc @NSManaged public var order_date: String?
   @objc @NSManaged public var order_desc: String?
   @objc @NSManaged public var order_no: NSNumber?
   @objc @NSManaged public var order_rate: NSNumber?
   @objc @NSManaged public var order_status: String?
   @objc @NSManaged public var order_time: String?
   @objc @NSManaged public var pk_i_id: NSNumber?
   @objc @NSManaged public var price: String?
   @objc @NSManaged public var provider_notes: String?
   @objc @NSManaged public var s_app_profit_type: String?
   @objc @NSManaged public var s_app_profit_value: String?
   @objc @NSManaged public var s_currency: String?
   @objc @NSManaged public var s_customer_picture: String?
   @objc @NSManaged public var s_date: String?
   @objc @NSManaged public var s_delivery_distance: String?
   @objc @NSManaged public var s_delivery_full_address: String?
   @objc @NSManaged public var s_delivery_latitude: String?
   @objc @NSManaged public var s_delivery_longitude: String?
   @objc @NSManaged public var s_details: String?
   @objc @NSManaged public var s_distance: String?
   @objc @NSManaged public var s_driver_name: String?
   @objc @NSManaged public var s_driver_picture: String?
   @objc @NSManaged public var s_duration: String?
   @objc @NSManaged public var s_image: String?
   @objc @NSManaged public var s_mobile: String?
   @objc @NSManaged public var s_mobile_intro: String?
   @objc @NSManaged public var s_pickup_distance: String?
   @objc @NSManaged public var s_pickup_full_address: String?
   @objc @NSManaged public var s_pickup_latitude: String?
   @objc @NSManaged public var s_pickup_longitude: String?
   @objc @NSManaged public var s_service_provider: String?
   @objc @NSManaged public var s_service_provider_picture: String?
   @objc @NSManaged public var s_time_text: String?
   @objc @NSManaged public var s_total_distance: String?
   @objc @NSManaged public var s_total_price: String?
   @objc @NSManaged public var s_type: String?
   @objc @NSManaged public var s_vehicle_color: String?
   @objc @NSManaged public var s_vehicle_color_code: String?
   @objc @NSManaged public var s_vehicle_model: String?
   @objc @NSManaged public var s_voice_url: String?
   @objc @NSManaged public var service_detail_name: String?
   @objc @NSManaged public var service_name: String?
   @objc @NSManaged public var total_price: String?

   @objc @NSManaged public var actions: TOrderActions?
   @objc @NSManaged public var chat: NSSet
   @objc @NSManaged public var customer: TUser?
   @objc @NSManaged public var payment_way: TPaymentWay?
   @objc @NSManaged public var service_provider: TUser?

   static let rKmapping : RKEntityMapping = {
        var TChatOrderMapping = RKEntityMapping(forEntityForName: NSStringFromClass(TChatOrder.classForCoder()), in: RKObjectManager.shared().managedObjectStore)
        TChatOrderMapping?.addAttributeMappings(from: [
                "chat_closed":"chat_closed",
                "confirmed_date":"confirmed_date",
                "coupon_discount":"coupon_discount",
                "created_at":"created_at",
                "currency":"currency",
                "delivery_cost":"d_delivery_cost",
                "delivery_distance":"d_delivery_distance",
                "distance":"d_distance",
                "duration":"d_duration",
                "max_delivery_value":"d_max_delivery_value",
                "min_delivery_value":"d_min_delivery_value",
                "order_rate":"d_order_rate",
                "pickup_distance":"d_pickup_distance",
                "time":"d_time",
                "total_distance":"d_total_distance",
                "accepted_date":"dt_accepted",
                "dt_created":"dt_created",
                "current_date":"dt_current",
                "dt_delivery_date":"dt_delivery_date",
                "pickup_arrived_date":"dt_pickup_arrived",
                "finished_date":"finished_date",
                "full_address":"full_address",
                "rate":"i_rate",
                "rate_count":"i_rate_count",
                "offer_id":"offer_id",
                "order_date":"order_date",
                "order_desc":"order_desc",
                "order_no":"order_no",
                "order_rate":"order_rate",
                "order_status":"order_status",
                "order_time":"order_time",
                "id":"pk_i_id",
                "price":"price",
                "provider_notes":"provider_notes",
                "app_profit_type":"s_app_profit_type",
                "app_profit_value":"s_app_profit_value",
                "currency":"s_currency",
                "customer_picture_url":"s_customer_picture",
                "date":"s_date",
                "delivery_distance_text":"s_delivery_distance",
                "delivery_full_address":"s_delivery_full_address",
                "delivery_latitude":"s_delivery_latitude",
                "delivery_longitude":"s_delivery_longitude",
                "order_details":"s_details",
                "distance_text":"s_distance",
                "driver_name":"s_driver_name",
                "driver_picture_url":"s_driver_picture",
                "duration_text":"s_duration",
                "picture_url":"s_image",
                "mobile":"s_mobile",
                "mobile_intro":"s_mobile_intro",
                "pickup_distance_text":"s_pickup_distance",
                "pickup_full_address":"s_pickup_full_address",
                "pickup_latitude":"s_pickup_latitude",
                "pickup_longitude":"s_pickup_longitude",
                "service_provider_name":"s_service_provider",
                "service_provider_picture_url":"s_service_provider_picture",
                "time_text":"s_time_text",
                "total_distance_text":"s_total_distance",
                "total_price":"s_total_price",
                "order_type":"s_type",
                "vehicle_color":"s_vehicle_color",
                "vehicle_color_code":"s_vehicle_color_code",
                "vehicle_model":"s_vehicle_model",
                "order_voice":"s_voice_url",
                "service_detail_name":"service_detail_name",
                "service_name":"service_name",
                "total_price":"total_price",

            ])
        TChatOrderMapping?.identificationAttributes = ["pk_i_id"]
        return TChatOrderMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////
        TChatOrder.rKmapping.addPropertyMapping(RKRelationshipMapping(fromKeyPath:"actions", toKeyPath: "actions" , with: TOrderActions.rKmapping))
        TChatOrder.rKmapping.addPropertyMapping(RKRelationshipMapping(fromKeyPath:"customer", toKeyPath: "customer" , with: TUser.rKmapping))
        TChatOrder.rKmapping.addPropertyMapping(RKRelationshipMapping(fromKeyPath:"payment_way", toKeyPath: "payment_way" , with: TPaymentWay.rKmapping))
        TChatOrder.rKmapping.addPropertyMapping(RKRelationshipMapping(fromKeyPath:"service_provider", toKeyPath: "service_provider" , with: TUser.rKmapping))

        ///// Many To One Or Many Relationships /////
        TChatOrder.rKmapping.addPropertyMapping(RKRelationshipMapping(fromKeyPath:"chat", toKeyPath: "chat" , with: TChat.rKmapping))
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["chat_closed"] = chat_closed
        dictionary["confirmed_date"] = confirmed_date
        dictionary["coupon_discount"] = coupon_discount
        dictionary["created_at"] = created_at
        dictionary["currency"] = currency
        dictionary["delivery_cost"] = d_delivery_cost
        dictionary["delivery_distance"] = d_delivery_distance
        dictionary["distance"] = d_distance
        dictionary["duration"] = d_duration
        dictionary["max_delivery_value"] = d_max_delivery_value
        dictionary["min_delivery_value"] = d_min_delivery_value
        dictionary["order_rate"] = d_order_rate
        dictionary["pickup_distance"] = d_pickup_distance
        dictionary["time"] = d_time
        dictionary["total_distance"] = d_total_distance
        dictionary["accepted_date"] = dt_accepted
        dictionary["dt_created"] = dt_created
        dictionary["current_date"] = dt_current
        dictionary["dt_delivery_date"] = dt_delivery_date
        dictionary["pickup_arrived_date"] = dt_pickup_arrived
        dictionary["finished_date"] = finished_date
        dictionary["full_address"] = full_address
        dictionary["rate"] = i_rate
        dictionary["rate_count"] = i_rate_count
        dictionary["offer_id"] = offer_id
        dictionary["order_date"] = order_date
        dictionary["order_desc"] = order_desc
        dictionary["order_no"] = order_no
        dictionary["order_rate"] = order_rate
        dictionary["order_status"] = order_status
        dictionary["order_time"] = order_time
        dictionary["id"] = pk_i_id
        dictionary["price"] = price
        dictionary["provider_notes"] = provider_notes
        dictionary["app_profit_type"] = s_app_profit_type
        dictionary["app_profit_value"] = s_app_profit_value
        dictionary["currency"] = s_currency
        dictionary["customer_picture_url"] = s_customer_picture
        dictionary["date"] = s_date
        dictionary["delivery_distance_text"] = s_delivery_distance
        dictionary["delivery_full_address"] = s_delivery_full_address
        dictionary["delivery_latitude"] = s_delivery_latitude
        dictionary["delivery_longitude"] = s_delivery_longitude
        dictionary["order_details"] = s_details
        dictionary["distance_text"] = s_distance
        dictionary["driver_name"] = s_driver_name
        dictionary["driver_picture_url"] = s_driver_picture
        dictionary["duration_text"] = s_duration
        dictionary["picture_url"] = s_image
        dictionary["mobile"] = s_mobile
        dictionary["mobile_intro"] = s_mobile_intro
        dictionary["pickup_distance_text"] = s_pickup_distance
        dictionary["pickup_full_address"] = s_pickup_full_address
        dictionary["pickup_latitude"] = s_pickup_latitude
        dictionary["pickup_longitude"] = s_pickup_longitude
        dictionary["service_provider_name"] = s_service_provider
        dictionary["service_provider_picture_url"] = s_service_provider_picture
        dictionary["time_text"] = s_time_text
        dictionary["total_distance_text"] = s_total_distance
        dictionary["total_price"] = s_total_price
        dictionary["order_type"] = s_type
        dictionary["vehicle_color"] = s_vehicle_color
        dictionary["vehicle_color_code"] = s_vehicle_color_code
        dictionary["vehicle_model"] = s_vehicle_model
        dictionary["order_voice"] = s_voice_url
        dictionary["service_detail_name"] = service_detail_name
        dictionary["service_name"] = service_name
        dictionary["total_price"] = total_price

        dictionary["actions"] =  actions?.toDictionary()
        do {
            var dictionaryElements = [[String:Any]]()
            for obj in (chat.allObjects as? [TChat] ?? []) {
                dictionaryElements.append(obj.toDictionary())
            }
            dictionary["chat"] = dictionaryElements
        }
        dictionary["customer"] =  customer?.toDictionary()
        dictionary["payment_way"] =  payment_way?.toDictionary()
        dictionary["service_provider"] =  service_provider?.toDictionary()

        return dictionary
    }

    func toNonDBObject() -> TChatOrderObject {
       let obj = TChatOrderObject()
       obj.chat_closed = self.chat_closed
       obj.confirmed_date = self.confirmed_date
       obj.coupon_discount = self.coupon_discount
       obj.created_at = self.created_at
       obj.currency = self.currency
       obj.d_delivery_cost = self.d_delivery_cost
       obj.d_delivery_distance = self.d_delivery_distance
       obj.d_distance = self.d_distance
       obj.d_duration = self.d_duration
       obj.d_max_delivery_value = self.d_max_delivery_value
       obj.d_min_delivery_value = self.d_min_delivery_value
       obj.d_order_rate = self.d_order_rate
       obj.d_pickup_distance = self.d_pickup_distance
       obj.d_time = self.d_time
       obj.d_total_distance = self.d_total_distance
       obj.dt_accepted = self.dt_accepted
       obj.dt_created = self.dt_created
       obj.dt_current = self.dt_current
       obj.dt_delivery_date = self.dt_delivery_date
       obj.dt_pickup_arrived = self.dt_pickup_arrived
       obj.finished_date = self.finished_date
       obj.full_address = self.full_address
       obj.i_rate = self.i_rate
       obj.i_rate_count = self.i_rate_count
       obj.offer_id = self.offer_id
       obj.order_date = self.order_date
       obj.order_desc = self.order_desc
       obj.order_no = self.order_no
       obj.order_rate = self.order_rate
       obj.order_status = self.order_status
       obj.order_time = self.order_time
       obj.pk_i_id = self.pk_i_id
       obj.price = self.price
       obj.provider_notes = self.provider_notes
       obj.s_app_profit_type = self.s_app_profit_type
       obj.s_app_profit_value = self.s_app_profit_value
       obj.s_currency = self.s_currency
       obj.s_customer_picture = self.s_customer_picture
       obj.s_date = self.s_date
       obj.s_delivery_distance = self.s_delivery_distance
       obj.s_delivery_full_address = self.s_delivery_full_address
       obj.s_delivery_latitude = self.s_delivery_latitude
       obj.s_delivery_longitude = self.s_delivery_longitude
       obj.s_details = self.s_details
       obj.s_distance = self.s_distance
       obj.s_driver_name = self.s_driver_name
       obj.s_driver_picture = self.s_driver_picture
       obj.s_duration = self.s_duration
       obj.s_image = self.s_image
       obj.s_mobile = self.s_mobile
       obj.s_mobile_intro = self.s_mobile_intro
       obj.s_pickup_distance = self.s_pickup_distance
       obj.s_pickup_full_address = self.s_pickup_full_address
       obj.s_pickup_latitude = self.s_pickup_latitude
       obj.s_pickup_longitude = self.s_pickup_longitude
       obj.s_service_provider = self.s_service_provider
       obj.s_service_provider_picture = self.s_service_provider_picture
       obj.s_time_text = self.s_time_text
       obj.s_total_distance = self.s_total_distance
       obj.s_total_price = self.s_total_price
       obj.s_type = self.s_type
       obj.s_vehicle_color = self.s_vehicle_color
       obj.s_vehicle_color_code = self.s_vehicle_color_code
       obj.s_vehicle_model = self.s_vehicle_model
       obj.s_voice_url = self.s_voice_url
       obj.service_detail_name = self.service_detail_name
       obj.service_name = self.service_name
       obj.total_price = self.total_price

       obj.actions = self.actions?.toNonDBObject()
       for relObj in self.chat.allObjects as? [TChatObject] ?? []{
          obj.chat.append(relObj)
       }
       obj.customer = self.customer?.toNonDBObject()
       obj.payment_way = self.payment_way?.toNonDBObject()
       obj.service_provider = self.service_provider?.toNonDBObject()
       return obj
    }
    public override var description: String{
        var description: String = "<TChatOrder: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"chat_closed\" : \(chat_closed?.description ?? "nil");"
        description += "\n    \"confirmed_date\" : \(confirmed_date != nil ? "\"\(confirmed_date?.description ?? "nil")\"" : "\(confirmed_date?.description ?? "nil")");"
        description += "\n    \"coupon_discount\" : \(coupon_discount != nil ? "\"\(coupon_discount?.description ?? "nil")\"" : "\(coupon_discount?.description ?? "nil")");"
        description += "\n    \"created_at\" : \(created_at != nil ? "\"\(created_at?.description ?? "nil")\"" : "\(created_at?.description ?? "nil")");"
        description += "\n    \"currency\" : \(currency != nil ? "\"\(currency?.description ?? "nil")\"" : "\(currency?.description ?? "nil")");"
        description += "\n    \"d_delivery_cost\" : \(d_delivery_cost?.description ?? "nil");"
        description += "\n    \"d_delivery_distance\" : \(d_delivery_distance?.description ?? "nil");"
        description += "\n    \"d_distance\" : \(d_distance?.description ?? "nil");"
        description += "\n    \"d_duration\" : \(d_duration?.description ?? "nil");"
        description += "\n    \"d_max_delivery_value\" : \(d_max_delivery_value?.description ?? "nil");"
        description += "\n    \"d_min_delivery_value\" : \(d_min_delivery_value?.description ?? "nil");"
        description += "\n    \"d_order_rate\" : \(d_order_rate?.description ?? "nil");"
        description += "\n    \"d_pickup_distance\" : \(d_pickup_distance?.description ?? "nil");"
        description += "\n    \"d_time\" : \(d_time?.description ?? "nil");"
        description += "\n    \"d_total_distance\" : \(d_total_distance?.description ?? "nil");"
        description += "\n    \"dt_accepted\" : \(dt_accepted != nil ? "\"\(dt_accepted?.description ?? "nil")\"" : "\(dt_accepted?.description ?? "nil")");"
        description += "\n    \"dt_created\" : \(dt_created != nil ? "\"\(dt_created?.description ?? "nil")\"" : "\(dt_created?.description ?? "nil")");"
        description += "\n    \"dt_current\" : \(dt_current != nil ? "\"\(dt_current?.description ?? "nil")\"" : "\(dt_current?.description ?? "nil")");"
        description += "\n    \"dt_delivery_date\" : \(dt_delivery_date != nil ? "\"\(dt_delivery_date?.description ?? "nil")\"" : "\(dt_delivery_date?.description ?? "nil")");"
        description += "\n    \"dt_pickup_arrived\" : \(dt_pickup_arrived != nil ? "\"\(dt_pickup_arrived?.description ?? "nil")\"" : "\(dt_pickup_arrived?.description ?? "nil")");"
        description += "\n    \"finished_date\" : \(finished_date != nil ? "\"\(finished_date?.description ?? "nil")\"" : "\(finished_date?.description ?? "nil")");"
        description += "\n    \"full_address\" : \(full_address != nil ? "\"\(full_address?.description ?? "nil")\"" : "\(full_address?.description ?? "nil")");"
        description += "\n    \"i_rate\" : \(i_rate?.description ?? "nil");"
        description += "\n    \"i_rate_count\" : \(i_rate_count?.description ?? "nil");"
        description += "\n    \"offer_id\" : \(offer_id?.description ?? "nil");"
        description += "\n    \"order_date\" : \(order_date != nil ? "\"\(order_date?.description ?? "nil")\"" : "\(order_date?.description ?? "nil")");"
        description += "\n    \"order_desc\" : \(order_desc != nil ? "\"\(order_desc?.description ?? "nil")\"" : "\(order_desc?.description ?? "nil")");"
        description += "\n    \"order_no\" : \(order_no?.description ?? "nil");"
        description += "\n    \"order_rate\" : \(order_rate?.description ?? "nil");"
        description += "\n    \"order_status\" : \(order_status != nil ? "\"\(order_status?.description ?? "nil")\"" : "\(order_status?.description ?? "nil")");"
        description += "\n    \"order_time\" : \(order_time != nil ? "\"\(order_time?.description ?? "nil")\"" : "\(order_time?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"price\" : \(price != nil ? "\"\(price?.description ?? "nil")\"" : "\(price?.description ?? "nil")");"
        description += "\n    \"provider_notes\" : \(provider_notes != nil ? "\"\(provider_notes?.description ?? "nil")\"" : "\(provider_notes?.description ?? "nil")");"
        description += "\n    \"s_app_profit_type\" : \(s_app_profit_type != nil ? "\"\(s_app_profit_type?.description ?? "nil")\"" : "\(s_app_profit_type?.description ?? "nil")");"
        description += "\n    \"s_app_profit_value\" : \(s_app_profit_value != nil ? "\"\(s_app_profit_value?.description ?? "nil")\"" : "\(s_app_profit_value?.description ?? "nil")");"
        description += "\n    \"s_currency\" : \(s_currency != nil ? "\"\(s_currency?.description ?? "nil")\"" : "\(s_currency?.description ?? "nil")");"
        description += "\n    \"s_customer_picture\" : \(s_customer_picture != nil ? "\"\(s_customer_picture?.description ?? "nil")\"" : "\(s_customer_picture?.description ?? "nil")");"
        description += "\n    \"s_date\" : \(s_date != nil ? "\"\(s_date?.description ?? "nil")\"" : "\(s_date?.description ?? "nil")");"
        description += "\n    \"s_delivery_distance\" : \(s_delivery_distance != nil ? "\"\(s_delivery_distance?.description ?? "nil")\"" : "\(s_delivery_distance?.description ?? "nil")");"
        description += "\n    \"s_delivery_full_address\" : \(s_delivery_full_address != nil ? "\"\(s_delivery_full_address?.description ?? "nil")\"" : "\(s_delivery_full_address?.description ?? "nil")");"
        description += "\n    \"s_delivery_latitude\" : \(s_delivery_latitude != nil ? "\"\(s_delivery_latitude?.description ?? "nil")\"" : "\(s_delivery_latitude?.description ?? "nil")");"
        description += "\n    \"s_delivery_longitude\" : \(s_delivery_longitude != nil ? "\"\(s_delivery_longitude?.description ?? "nil")\"" : "\(s_delivery_longitude?.description ?? "nil")");"
        description += "\n    \"s_details\" : \(s_details != nil ? "\"\(s_details?.description ?? "nil")\"" : "\(s_details?.description ?? "nil")");"
        description += "\n    \"s_distance\" : \(s_distance != nil ? "\"\(s_distance?.description ?? "nil")\"" : "\(s_distance?.description ?? "nil")");"
        description += "\n    \"s_driver_name\" : \(s_driver_name != nil ? "\"\(s_driver_name?.description ?? "nil")\"" : "\(s_driver_name?.description ?? "nil")");"
        description += "\n    \"s_driver_picture\" : \(s_driver_picture != nil ? "\"\(s_driver_picture?.description ?? "nil")\"" : "\(s_driver_picture?.description ?? "nil")");"
        description += "\n    \"s_duration\" : \(s_duration != nil ? "\"\(s_duration?.description ?? "nil")\"" : "\(s_duration?.description ?? "nil")");"
        description += "\n    \"s_image\" : \(s_image != nil ? "\"\(s_image?.description ?? "nil")\"" : "\(s_image?.description ?? "nil")");"
        description += "\n    \"s_mobile\" : \(s_mobile != nil ? "\"\(s_mobile?.description ?? "nil")\"" : "\(s_mobile?.description ?? "nil")");"
        description += "\n    \"s_mobile_intro\" : \(s_mobile_intro != nil ? "\"\(s_mobile_intro?.description ?? "nil")\"" : "\(s_mobile_intro?.description ?? "nil")");"
        description += "\n    \"s_pickup_distance\" : \(s_pickup_distance != nil ? "\"\(s_pickup_distance?.description ?? "nil")\"" : "\(s_pickup_distance?.description ?? "nil")");"
        description += "\n    \"s_pickup_full_address\" : \(s_pickup_full_address != nil ? "\"\(s_pickup_full_address?.description ?? "nil")\"" : "\(s_pickup_full_address?.description ?? "nil")");"
        description += "\n    \"s_pickup_latitude\" : \(s_pickup_latitude != nil ? "\"\(s_pickup_latitude?.description ?? "nil")\"" : "\(s_pickup_latitude?.description ?? "nil")");"
        description += "\n    \"s_pickup_longitude\" : \(s_pickup_longitude != nil ? "\"\(s_pickup_longitude?.description ?? "nil")\"" : "\(s_pickup_longitude?.description ?? "nil")");"
        description += "\n    \"s_service_provider\" : \(s_service_provider != nil ? "\"\(s_service_provider?.description ?? "nil")\"" : "\(s_service_provider?.description ?? "nil")");"
        description += "\n    \"s_service_provider_picture\" : \(s_service_provider_picture != nil ? "\"\(s_service_provider_picture?.description ?? "nil")\"" : "\(s_service_provider_picture?.description ?? "nil")");"
        description += "\n    \"s_time_text\" : \(s_time_text != nil ? "\"\(s_time_text?.description ?? "nil")\"" : "\(s_time_text?.description ?? "nil")");"
        description += "\n    \"s_total_distance\" : \(s_total_distance != nil ? "\"\(s_total_distance?.description ?? "nil")\"" : "\(s_total_distance?.description ?? "nil")");"
        description += "\n    \"s_total_price\" : \(s_total_price != nil ? "\"\(s_total_price?.description ?? "nil")\"" : "\(s_total_price?.description ?? "nil")");"
        description += "\n    \"s_type\" : \(s_type != nil ? "\"\(s_type?.description ?? "nil")\"" : "\(s_type?.description ?? "nil")");"
        description += "\n    \"s_vehicle_color\" : \(s_vehicle_color != nil ? "\"\(s_vehicle_color?.description ?? "nil")\"" : "\(s_vehicle_color?.description ?? "nil")");"
        description += "\n    \"s_vehicle_color_code\" : \(s_vehicle_color_code != nil ? "\"\(s_vehicle_color_code?.description ?? "nil")\"" : "\(s_vehicle_color_code?.description ?? "nil")");"
        description += "\n    \"s_vehicle_model\" : \(s_vehicle_model != nil ? "\"\(s_vehicle_model?.description ?? "nil")\"" : "\(s_vehicle_model?.description ?? "nil")");"
        description += "\n    \"s_voice_url\" : \(s_voice_url != nil ? "\"\(s_voice_url?.description ?? "nil")\"" : "\(s_voice_url?.description ?? "nil")");"
        description += "\n    \"service_detail_name\" : \(service_detail_name != nil ? "\"\(service_detail_name?.description ?? "nil")\"" : "\(service_detail_name?.description ?? "nil")");"
        description += "\n    \"service_name\" : \(service_name != nil ? "\"\(service_name?.description ?? "nil")\"" : "\(service_name?.description ?? "nil")");"
        description += "\n    \"total_price\" : \(total_price != nil ? "\"\(total_price?.description ?? "nil")\"" : "\(total_price?.description ?? "nil")");"
        description += "\n    actions = \(actions != nil ? "<TOrderActions: \(Unmanaged.passUnretained(actions!).toOpaque())>" : "nil");"
        description += "\n    chat = [TChat].count = \(chat.count);"
        description += "\n    customer = \(customer != nil ? "<TUser: \(Unmanaged.passUnretained(customer!).toOpaque())>" : "nil");"
        description += "\n    payment_way = \(payment_way != nil ? "<TPaymentWay: \(Unmanaged.passUnretained(payment_way!).toOpaque())>" : "nil");"
        description += "\n    service_provider = \(service_provider != nil ? "<TUser: \(Unmanaged.passUnretained(service_provider!).toOpaque())>" : "nil");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TChatOrder?) -> Bool {
        return self == object
    }
    static func == (left: _TChatOrder, right: _TChatOrder) -> Bool {
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
    static func demoObject()-> TChatOrder?{
        let obj = TChatOrder.mr_createEntity()
        obj?.chat_closed = NSNumber(value: Randoms.randomBool())
        obj?.confirmed_date = Randoms.randomFakeName()
        obj?.coupon_discount = Randoms.randomFakeName()
        obj?.created_at = Randoms.randomFakeName()
        obj?.currency = Randoms.randomFakeName()
        obj?.d_delivery_cost = NSNumber(value: Randoms.randomDouble())
        obj?.d_delivery_distance = NSNumber(value: Randoms.randomDouble())
        obj?.d_distance = NSNumber(value: Randoms.randomDouble())
        obj?.d_duration = NSNumber(value: Randoms.randomDouble())
        obj?.d_max_delivery_value = NSNumber(value: Randoms.randomDouble())
        obj?.d_min_delivery_value = NSNumber(value: Randoms.randomDouble())
        obj?.d_order_rate = NSNumber(value: Randoms.randomDouble())
        obj?.d_pickup_distance = NSNumber(value: Randoms.randomDouble())
        obj?.d_time = NSNumber(value: Randoms.randomDouble())
        obj?.d_total_distance = NSNumber(value: Randoms.randomDouble())
        obj?.dt_accepted = Randoms.randomDate() as NSDate
        obj?.dt_created = Randoms.randomDate() as NSDate
        obj?.dt_current = Randoms.randomDate() as NSDate
        obj?.dt_delivery_date = Randoms.randomDate() as NSDate
        obj?.dt_pickup_arrived = Randoms.randomDate() as NSDate
        obj?.finished_date = Randoms.randomFakeName()
        obj?.full_address = Randoms.randomFakeName()
        obj?.i_rate = NSNumber(value: Randoms.randomInt32())
        obj?.i_rate_count = NSNumber(value: Randoms.randomInt32())
        obj?.offer_id = NSNumber(value: Randoms.randomInt32())
        obj?.order_date = Randoms.randomFakeName()
        obj?.order_desc = Randoms.randomFakeName()
        obj?.order_no = NSNumber(value: Randoms.randomInt32())
        obj?.order_rate = NSNumber(value: Randoms.randomDouble())
        obj?.order_status = Randoms.randomFakeName()
        obj?.order_time = Randoms.randomFakeName()
        obj?.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj?.price = Randoms.randomFakeName()
        obj?.provider_notes = Randoms.randomFakeName()
        obj?.s_app_profit_type = Randoms.randomFakeName()
        obj?.s_app_profit_value = Randoms.randomFakeName()
        obj?.s_currency = Randoms.randomFakeName()
        obj?.s_customer_picture = Randoms.randomFakeName()
        obj?.s_date = Randoms.randomFakeName()
        obj?.s_delivery_distance = Randoms.randomFakeName()
        obj?.s_delivery_full_address = Randoms.randomFakeName()
        obj?.s_delivery_latitude = Randoms.randomFakeName()
        obj?.s_delivery_longitude = Randoms.randomFakeName()
        obj?.s_details = Randoms.randomFakeName()
        obj?.s_distance = Randoms.randomFakeName()
        obj?.s_driver_name = Randoms.randomFakeName()
        obj?.s_driver_picture = Randoms.randomFakeName()
        obj?.s_duration = Randoms.randomFakeName()
        obj?.s_image = Randoms.randomFakeName()
        obj?.s_mobile = Randoms.randomFakeName()
        obj?.s_mobile_intro = Randoms.randomFakeName()
        obj?.s_pickup_distance = Randoms.randomFakeName()
        obj?.s_pickup_full_address = Randoms.randomFakeName()
        obj?.s_pickup_latitude = Randoms.randomFakeName()
        obj?.s_pickup_longitude = Randoms.randomFakeName()
        obj?.s_service_provider = Randoms.randomFakeName()
        obj?.s_service_provider_picture = Randoms.randomFakeName()
        obj?.s_time_text = Randoms.randomFakeName()
        obj?.s_total_distance = Randoms.randomFakeName()
        obj?.s_total_price = Randoms.randomFakeName()
        obj?.s_type = Randoms.randomFakeName()
        obj?.s_vehicle_color = Randoms.randomFakeName()
        obj?.s_vehicle_color_code = Randoms.randomFakeName()
        obj?.s_vehicle_model = Randoms.randomFakeName()
        obj?.s_voice_url = Randoms.randomFakeName()
        obj?.service_detail_name = Randoms.randomFakeName()
        obj?.service_name = Randoms.randomFakeName()
        obj?.total_price = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TChatOrder]{
        var arr = [TChatOrder]()
        for _ in 1...GlobalConstants.API_PageSize {
            if let usr = TChatOrder.demoObject() {
                for _ in 1...GlobalConstants.API_PageSize {
                    usr.chat.append(TChatObject.demoObject())
                }
                arr.append(usr)
            }
        }
        return arr
    }
    #endif

}





public class _TChatOrderObject: NSObject {
   public class var entityName: String {
      return "TChatOrderObject"
   }

   @objc public var chat_closed: NSNumber?
   @objc public var confirmed_date: String?
   @objc public var coupon_discount: String?
   @objc public var created_at: String?
   @objc public var currency: String?
   @objc public var d_delivery_cost: NSNumber?
   @objc public var d_delivery_distance: NSNumber?
   @objc public var d_distance: NSNumber?
   @objc public var d_duration: NSNumber?
   @objc public var d_max_delivery_value: NSNumber?
   @objc public var d_min_delivery_value: NSNumber?
   @objc public var d_order_rate: NSNumber?
   @objc public var d_pickup_distance: NSNumber?
   @objc public var d_time: NSNumber?
   @objc public var d_total_distance: NSNumber?
   @objc public var dt_accepted: NSDate?
   @objc public var dt_created: NSDate?
   @objc public var dt_current: NSDate?
   @objc public var dt_delivery_date: NSDate?
   @objc public var dt_pickup_arrived: NSDate?
   @objc public var finished_date: String?
   @objc public var full_address: String?
   @objc public var i_rate: NSNumber?
   @objc public var i_rate_count: NSNumber?
   @objc public var offer_id: NSNumber?
   @objc public var order_date: String?
   @objc public var order_desc: String?
   @objc public var order_no: NSNumber?
   @objc public var order_rate: NSNumber?
   @objc public var order_status: String?
   @objc public var order_time: String?
   @objc public var pk_i_id: NSNumber?
   @objc public var price: String?
   @objc public var provider_notes: String?
   @objc public var s_app_profit_type: String?
   @objc public var s_app_profit_value: String?
   @objc public var s_currency: String?
   @objc public var s_customer_picture: String?
   @objc public var s_date: String?
   @objc public var s_delivery_distance: String?
   @objc public var s_delivery_full_address: String?
   @objc public var s_delivery_latitude: String?
   @objc public var s_delivery_longitude: String?
   @objc public var s_details: String?
   @objc public var s_distance: String?
   @objc public var s_driver_name: String?
   @objc public var s_driver_picture: String?
   @objc public var s_duration: String?
   @objc public var s_image: String?
   @objc public var s_mobile: String?
   @objc public var s_mobile_intro: String?
   @objc public var s_pickup_distance: String?
   @objc public var s_pickup_full_address: String?
   @objc public var s_pickup_latitude: String?
   @objc public var s_pickup_longitude: String?
   @objc public var s_service_provider: String?
   @objc public var s_service_provider_picture: String?
   @objc public var s_time_text: String?
   @objc public var s_total_distance: String?
   @objc public var s_total_price: String?
   @objc public var s_type: String?
   @objc public var s_vehicle_color: String?
   @objc public var s_vehicle_color_code: String?
   @objc public var s_vehicle_model: String?
   @objc public var s_voice_url: String?
   @objc public var service_detail_name: String?
   @objc public var service_name: String?
   @objc public var total_price: String?

   @objc public var actions: TOrderActionsObject?
   @objc public var chat = [TChatObject]()
   @objc public var customer: TUserObject?
   @objc public var payment_way: TPaymentWayObject?
   @objc public var service_provider: TUserObject?

   static let rKmapping : RKObjectMapping = {
        var TChatOrderObjectMapping = RKObjectMapping(for: TChatOrderObject.classForCoder())
        TChatOrderObjectMapping?.addAttributeMappings(from: [
                "chat_closed":"chat_closed",
                "confirmed_date":"confirmed_date",
                "coupon_discount":"coupon_discount",
                "created_at":"created_at",
                "currency":"currency",
                "delivery_cost":"d_delivery_cost",
                "delivery_distance":"d_delivery_distance",
                "distance":"d_distance",
                "duration":"d_duration",
                "max_delivery_value":"d_max_delivery_value",
                "min_delivery_value":"d_min_delivery_value",
                "order_rate":"d_order_rate",
                "pickup_distance":"d_pickup_distance",
                "time":"d_time",
                "total_distance":"d_total_distance",
                "accepted_date":"dt_accepted",
                "dt_created":"dt_created",
                "current_date":"dt_current",
                "dt_delivery_date":"dt_delivery_date",
                "pickup_arrived_date":"dt_pickup_arrived",
                "finished_date":"finished_date",
                "full_address":"full_address",
                "rate":"i_rate",
                "rate_count":"i_rate_count",
                "offer_id":"offer_id",
                "order_date":"order_date",
                "order_desc":"order_desc",
                "order_no":"order_no",
                "order_rate":"order_rate",
                "order_status":"order_status",
                "order_time":"order_time",
                "id":"pk_i_id",
                "price":"price",
                "provider_notes":"provider_notes",
                "app_profit_type":"s_app_profit_type",
                "app_profit_value":"s_app_profit_value",
                "currency":"s_currency",
                "customer_picture_url":"s_customer_picture",
                "date":"s_date",
                "delivery_distance_text":"s_delivery_distance",
                "delivery_full_address":"s_delivery_full_address",
                "delivery_latitude":"s_delivery_latitude",
                "delivery_longitude":"s_delivery_longitude",
                "order_details":"s_details",
                "distance_text":"s_distance",
                "driver_name":"s_driver_name",
                "driver_picture_url":"s_driver_picture",
                "duration_text":"s_duration",
                "picture_url":"s_image",
                "mobile":"s_mobile",
                "mobile_intro":"s_mobile_intro",
                "pickup_distance_text":"s_pickup_distance",
                "pickup_full_address":"s_pickup_full_address",
                "pickup_latitude":"s_pickup_latitude",
                "pickup_longitude":"s_pickup_longitude",
                "service_provider_name":"s_service_provider",
                "service_provider_picture_url":"s_service_provider_picture",
                "time_text":"s_time_text",
                "total_distance_text":"s_total_distance",
                "total_price":"s_total_price",
                "order_type":"s_type",
                "vehicle_color":"s_vehicle_color",
                "vehicle_color_code":"s_vehicle_color_code",
                "vehicle_model":"s_vehicle_model",
                "order_voice":"s_voice_url",
                "service_detail_name":"service_detail_name",
                "service_name":"service_name",
                "total_price":"total_price",

            ])
        return TChatOrderObjectMapping!
    }()

    static func addReletions(){
        ///// One To Many Relationships /////
        TChatOrderObject.rKmapping.addPropertyMapping(RKRelationshipMapping(fromKeyPath:"actions", toKeyPath: "actions" , with: TOrderActionsObject.rKmapping))
        TChatOrderObject.rKmapping.addPropertyMapping(RKRelationshipMapping(fromKeyPath:"customer", toKeyPath: "customer" , with: TUserObject.rKmapping))
        TChatOrderObject.rKmapping.addPropertyMapping(RKRelationshipMapping(fromKeyPath:"payment_way", toKeyPath: "payment_way" , with: TPaymentWayObject.rKmapping))
        TChatOrderObject.rKmapping.addPropertyMapping(RKRelationshipMapping(fromKeyPath:"service_provider", toKeyPath: "service_provider" , with: TUserObject.rKmapping))

        ///// Many To One Or Many Relationships /////
        TChatOrderObject.rKmapping.addPropertyMapping(RKRelationshipMapping(fromKeyPath:"chat", toKeyPath: "chat" , with: TChatObject.rKmapping))
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["chat_closed"] = chat_closed
        dictionary["confirmed_date"] = confirmed_date
        dictionary["coupon_discount"] = coupon_discount
        dictionary["created_at"] = created_at
        dictionary["currency"] = currency
        dictionary["delivery_cost"] = d_delivery_cost
        dictionary["delivery_distance"] = d_delivery_distance
        dictionary["distance"] = d_distance
        dictionary["duration"] = d_duration
        dictionary["max_delivery_value"] = d_max_delivery_value
        dictionary["min_delivery_value"] = d_min_delivery_value
        dictionary["order_rate"] = d_order_rate
        dictionary["pickup_distance"] = d_pickup_distance
        dictionary["time"] = d_time
        dictionary["total_distance"] = d_total_distance
        dictionary["accepted_date"] = dt_accepted
        dictionary["dt_created"] = dt_created
        dictionary["current_date"] = dt_current
        dictionary["dt_delivery_date"] = dt_delivery_date
        dictionary["pickup_arrived_date"] = dt_pickup_arrived
        dictionary["finished_date"] = finished_date
        dictionary["full_address"] = full_address
        dictionary["rate"] = i_rate
        dictionary["rate_count"] = i_rate_count
        dictionary["offer_id"] = offer_id
        dictionary["order_date"] = order_date
        dictionary["order_desc"] = order_desc
        dictionary["order_no"] = order_no
        dictionary["order_rate"] = order_rate
        dictionary["order_status"] = order_status
        dictionary["order_time"] = order_time
        dictionary["id"] = pk_i_id
        dictionary["price"] = price
        dictionary["provider_notes"] = provider_notes
        dictionary["app_profit_type"] = s_app_profit_type
        dictionary["app_profit_value"] = s_app_profit_value
        dictionary["currency"] = s_currency
        dictionary["customer_picture_url"] = s_customer_picture
        dictionary["date"] = s_date
        dictionary["delivery_distance_text"] = s_delivery_distance
        dictionary["delivery_full_address"] = s_delivery_full_address
        dictionary["delivery_latitude"] = s_delivery_latitude
        dictionary["delivery_longitude"] = s_delivery_longitude
        dictionary["order_details"] = s_details
        dictionary["distance_text"] = s_distance
        dictionary["driver_name"] = s_driver_name
        dictionary["driver_picture_url"] = s_driver_picture
        dictionary["duration_text"] = s_duration
        dictionary["picture_url"] = s_image
        dictionary["mobile"] = s_mobile
        dictionary["mobile_intro"] = s_mobile_intro
        dictionary["pickup_distance_text"] = s_pickup_distance
        dictionary["pickup_full_address"] = s_pickup_full_address
        dictionary["pickup_latitude"] = s_pickup_latitude
        dictionary["pickup_longitude"] = s_pickup_longitude
        dictionary["service_provider_name"] = s_service_provider
        dictionary["service_provider_picture_url"] = s_service_provider_picture
        dictionary["time_text"] = s_time_text
        dictionary["total_distance_text"] = s_total_distance
        dictionary["total_price"] = s_total_price
        dictionary["order_type"] = s_type
        dictionary["vehicle_color"] = s_vehicle_color
        dictionary["vehicle_color_code"] = s_vehicle_color_code
        dictionary["vehicle_model"] = s_vehicle_model
        dictionary["order_voice"] = s_voice_url
        dictionary["service_detail_name"] = service_detail_name
        dictionary["service_name"] = service_name
        dictionary["total_price"] = total_price

        dictionary["actions"] =  actions?.toDictionary()
        do {
            var dictionaryElements = [[String:Any]]()
            for obj in chat {
                dictionaryElements.append(obj.toDictionary())
            }
            dictionary["chat"] = dictionaryElements
        }
        dictionary["customer"] =  customer?.toDictionary()
        dictionary["payment_way"] =  payment_way?.toDictionary()
        dictionary["service_provider"] =  service_provider?.toDictionary()

        return dictionary
    }

    public override var description: String{
        var description: String = "<TChatOrderObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"chat_closed\" : \(chat_closed?.description ?? "nil");"
        description += "\n    \"confirmed_date\" : \(confirmed_date != nil ? "\"\(confirmed_date?.description ?? "nil")\"" : "\(confirmed_date?.description ?? "nil")");"
        description += "\n    \"coupon_discount\" : \(coupon_discount != nil ? "\"\(coupon_discount?.description ?? "nil")\"" : "\(coupon_discount?.description ?? "nil")");"
        description += "\n    \"created_at\" : \(created_at != nil ? "\"\(created_at?.description ?? "nil")\"" : "\(created_at?.description ?? "nil")");"
        description += "\n    \"currency\" : \(currency != nil ? "\"\(currency?.description ?? "nil")\"" : "\(currency?.description ?? "nil")");"
        description += "\n    \"d_delivery_cost\" : \(d_delivery_cost?.description ?? "nil");"
        description += "\n    \"d_delivery_distance\" : \(d_delivery_distance?.description ?? "nil");"
        description += "\n    \"d_distance\" : \(d_distance?.description ?? "nil");"
        description += "\n    \"d_duration\" : \(d_duration?.description ?? "nil");"
        description += "\n    \"d_max_delivery_value\" : \(d_max_delivery_value?.description ?? "nil");"
        description += "\n    \"d_min_delivery_value\" : \(d_min_delivery_value?.description ?? "nil");"
        description += "\n    \"d_order_rate\" : \(d_order_rate?.description ?? "nil");"
        description += "\n    \"d_pickup_distance\" : \(d_pickup_distance?.description ?? "nil");"
        description += "\n    \"d_time\" : \(d_time?.description ?? "nil");"
        description += "\n    \"d_total_distance\" : \(d_total_distance?.description ?? "nil");"
        description += "\n    \"dt_accepted\" : \(dt_accepted != nil ? "\"\(dt_accepted?.description ?? "nil")\"" : "\(dt_accepted?.description ?? "nil")");"
        description += "\n    \"dt_created\" : \(dt_created != nil ? "\"\(dt_created?.description ?? "nil")\"" : "\(dt_created?.description ?? "nil")");"
        description += "\n    \"dt_current\" : \(dt_current != nil ? "\"\(dt_current?.description ?? "nil")\"" : "\(dt_current?.description ?? "nil")");"
        description += "\n    \"dt_delivery_date\" : \(dt_delivery_date != nil ? "\"\(dt_delivery_date?.description ?? "nil")\"" : "\(dt_delivery_date?.description ?? "nil")");"
        description += "\n    \"dt_pickup_arrived\" : \(dt_pickup_arrived != nil ? "\"\(dt_pickup_arrived?.description ?? "nil")\"" : "\(dt_pickup_arrived?.description ?? "nil")");"
        description += "\n    \"finished_date\" : \(finished_date != nil ? "\"\(finished_date?.description ?? "nil")\"" : "\(finished_date?.description ?? "nil")");"
        description += "\n    \"full_address\" : \(full_address != nil ? "\"\(full_address?.description ?? "nil")\"" : "\(full_address?.description ?? "nil")");"
        description += "\n    \"i_rate\" : \(i_rate?.description ?? "nil");"
        description += "\n    \"i_rate_count\" : \(i_rate_count?.description ?? "nil");"
        description += "\n    \"offer_id\" : \(offer_id?.description ?? "nil");"
        description += "\n    \"order_date\" : \(order_date != nil ? "\"\(order_date?.description ?? "nil")\"" : "\(order_date?.description ?? "nil")");"
        description += "\n    \"order_desc\" : \(order_desc != nil ? "\"\(order_desc?.description ?? "nil")\"" : "\(order_desc?.description ?? "nil")");"
        description += "\n    \"order_no\" : \(order_no?.description ?? "nil");"
        description += "\n    \"order_rate\" : \(order_rate?.description ?? "nil");"
        description += "\n    \"order_status\" : \(order_status != nil ? "\"\(order_status?.description ?? "nil")\"" : "\(order_status?.description ?? "nil")");"
        description += "\n    \"order_time\" : \(order_time != nil ? "\"\(order_time?.description ?? "nil")\"" : "\(order_time?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"price\" : \(price != nil ? "\"\(price?.description ?? "nil")\"" : "\(price?.description ?? "nil")");"
        description += "\n    \"provider_notes\" : \(provider_notes != nil ? "\"\(provider_notes?.description ?? "nil")\"" : "\(provider_notes?.description ?? "nil")");"
        description += "\n    \"s_app_profit_type\" : \(s_app_profit_type != nil ? "\"\(s_app_profit_type?.description ?? "nil")\"" : "\(s_app_profit_type?.description ?? "nil")");"
        description += "\n    \"s_app_profit_value\" : \(s_app_profit_value != nil ? "\"\(s_app_profit_value?.description ?? "nil")\"" : "\(s_app_profit_value?.description ?? "nil")");"
        description += "\n    \"s_currency\" : \(s_currency != nil ? "\"\(s_currency?.description ?? "nil")\"" : "\(s_currency?.description ?? "nil")");"
        description += "\n    \"s_customer_picture\" : \(s_customer_picture != nil ? "\"\(s_customer_picture?.description ?? "nil")\"" : "\(s_customer_picture?.description ?? "nil")");"
        description += "\n    \"s_date\" : \(s_date != nil ? "\"\(s_date?.description ?? "nil")\"" : "\(s_date?.description ?? "nil")");"
        description += "\n    \"s_delivery_distance\" : \(s_delivery_distance != nil ? "\"\(s_delivery_distance?.description ?? "nil")\"" : "\(s_delivery_distance?.description ?? "nil")");"
        description += "\n    \"s_delivery_full_address\" : \(s_delivery_full_address != nil ? "\"\(s_delivery_full_address?.description ?? "nil")\"" : "\(s_delivery_full_address?.description ?? "nil")");"
        description += "\n    \"s_delivery_latitude\" : \(s_delivery_latitude != nil ? "\"\(s_delivery_latitude?.description ?? "nil")\"" : "\(s_delivery_latitude?.description ?? "nil")");"
        description += "\n    \"s_delivery_longitude\" : \(s_delivery_longitude != nil ? "\"\(s_delivery_longitude?.description ?? "nil")\"" : "\(s_delivery_longitude?.description ?? "nil")");"
        description += "\n    \"s_details\" : \(s_details != nil ? "\"\(s_details?.description ?? "nil")\"" : "\(s_details?.description ?? "nil")");"
        description += "\n    \"s_distance\" : \(s_distance != nil ? "\"\(s_distance?.description ?? "nil")\"" : "\(s_distance?.description ?? "nil")");"
        description += "\n    \"s_driver_name\" : \(s_driver_name != nil ? "\"\(s_driver_name?.description ?? "nil")\"" : "\(s_driver_name?.description ?? "nil")");"
        description += "\n    \"s_driver_picture\" : \(s_driver_picture != nil ? "\"\(s_driver_picture?.description ?? "nil")\"" : "\(s_driver_picture?.description ?? "nil")");"
        description += "\n    \"s_duration\" : \(s_duration != nil ? "\"\(s_duration?.description ?? "nil")\"" : "\(s_duration?.description ?? "nil")");"
        description += "\n    \"s_image\" : \(s_image != nil ? "\"\(s_image?.description ?? "nil")\"" : "\(s_image?.description ?? "nil")");"
        description += "\n    \"s_mobile\" : \(s_mobile != nil ? "\"\(s_mobile?.description ?? "nil")\"" : "\(s_mobile?.description ?? "nil")");"
        description += "\n    \"s_mobile_intro\" : \(s_mobile_intro != nil ? "\"\(s_mobile_intro?.description ?? "nil")\"" : "\(s_mobile_intro?.description ?? "nil")");"
        description += "\n    \"s_pickup_distance\" : \(s_pickup_distance != nil ? "\"\(s_pickup_distance?.description ?? "nil")\"" : "\(s_pickup_distance?.description ?? "nil")");"
        description += "\n    \"s_pickup_full_address\" : \(s_pickup_full_address != nil ? "\"\(s_pickup_full_address?.description ?? "nil")\"" : "\(s_pickup_full_address?.description ?? "nil")");"
        description += "\n    \"s_pickup_latitude\" : \(s_pickup_latitude != nil ? "\"\(s_pickup_latitude?.description ?? "nil")\"" : "\(s_pickup_latitude?.description ?? "nil")");"
        description += "\n    \"s_pickup_longitude\" : \(s_pickup_longitude != nil ? "\"\(s_pickup_longitude?.description ?? "nil")\"" : "\(s_pickup_longitude?.description ?? "nil")");"
        description += "\n    \"s_service_provider\" : \(s_service_provider != nil ? "\"\(s_service_provider?.description ?? "nil")\"" : "\(s_service_provider?.description ?? "nil")");"
        description += "\n    \"s_service_provider_picture\" : \(s_service_provider_picture != nil ? "\"\(s_service_provider_picture?.description ?? "nil")\"" : "\(s_service_provider_picture?.description ?? "nil")");"
        description += "\n    \"s_time_text\" : \(s_time_text != nil ? "\"\(s_time_text?.description ?? "nil")\"" : "\(s_time_text?.description ?? "nil")");"
        description += "\n    \"s_total_distance\" : \(s_total_distance != nil ? "\"\(s_total_distance?.description ?? "nil")\"" : "\(s_total_distance?.description ?? "nil")");"
        description += "\n    \"s_total_price\" : \(s_total_price != nil ? "\"\(s_total_price?.description ?? "nil")\"" : "\(s_total_price?.description ?? "nil")");"
        description += "\n    \"s_type\" : \(s_type != nil ? "\"\(s_type?.description ?? "nil")\"" : "\(s_type?.description ?? "nil")");"
        description += "\n    \"s_vehicle_color\" : \(s_vehicle_color != nil ? "\"\(s_vehicle_color?.description ?? "nil")\"" : "\(s_vehicle_color?.description ?? "nil")");"
        description += "\n    \"s_vehicle_color_code\" : \(s_vehicle_color_code != nil ? "\"\(s_vehicle_color_code?.description ?? "nil")\"" : "\(s_vehicle_color_code?.description ?? "nil")");"
        description += "\n    \"s_vehicle_model\" : \(s_vehicle_model != nil ? "\"\(s_vehicle_model?.description ?? "nil")\"" : "\(s_vehicle_model?.description ?? "nil")");"
        description += "\n    \"s_voice_url\" : \(s_voice_url != nil ? "\"\(s_voice_url?.description ?? "nil")\"" : "\(s_voice_url?.description ?? "nil")");"
        description += "\n    \"service_detail_name\" : \(service_detail_name != nil ? "\"\(service_detail_name?.description ?? "nil")\"" : "\(service_detail_name?.description ?? "nil")");"
        description += "\n    \"service_name\" : \(service_name != nil ? "\"\(service_name?.description ?? "nil")\"" : "\(service_name?.description ?? "nil")");"
        description += "\n    \"total_price\" : \(total_price != nil ? "\"\(total_price?.description ?? "nil")\"" : "\(total_price?.description ?? "nil")");"
        description += "\n    actions = \(actions != nil ? "<TOrderActionsObject: \(Unmanaged.passUnretained(actions!).toOpaque())>" : "nil");"
        description += "\n    chat = [TChatObject].count = \(chat.count);"
        description += "\n    customer = \(customer != nil ? "<TUserObject: \(Unmanaged.passUnretained(customer!).toOpaque())>" : "nil");"
        description += "\n    payment_way = \(payment_way != nil ? "<TPaymentWayObject: \(Unmanaged.passUnretained(payment_way!).toOpaque())>" : "nil");"
        description += "\n    service_provider = \(service_provider != nil ? "<TUserObject: \(Unmanaged.passUnretained(service_provider!).toOpaque())>" : "nil");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TChatOrderObject?) -> Bool {
        return self == object
    }
    static func == (left: _TChatOrderObject, right: _TChatOrderObject) -> Bool {
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
    static func demoObject()-> TChatOrderObject{
        let obj = TChatOrderObject()
        obj.chat_closed = NSNumber(value: Randoms.randomBool())
        obj.confirmed_date = Randoms.randomFakeName()
        obj.coupon_discount = Randoms.randomFakeName()
        obj.created_at = Randoms.randomFakeName()
        obj.currency = Randoms.randomFakeName()
        obj.d_delivery_cost = NSNumber(value: Randoms.randomDouble())
        obj.d_delivery_distance = NSNumber(value: Randoms.randomDouble())
        obj.d_distance = NSNumber(value: Randoms.randomDouble())
        obj.d_duration = NSNumber(value: Randoms.randomDouble())
        obj.d_max_delivery_value = NSNumber(value: Randoms.randomDouble())
        obj.d_min_delivery_value = NSNumber(value: Randoms.randomDouble())
        obj.d_order_rate = NSNumber(value: Randoms.randomDouble())
        obj.d_pickup_distance = NSNumber(value: Randoms.randomDouble())
        obj.d_time = NSNumber(value: Randoms.randomDouble())
        obj.d_total_distance = NSNumber(value: Randoms.randomDouble())
        obj.dt_accepted = Randoms.randomDate() as NSDate
        obj.dt_created = Randoms.randomDate() as NSDate
        obj.dt_current = Randoms.randomDate() as NSDate
        obj.dt_delivery_date = Randoms.randomDate() as NSDate
        obj.dt_pickup_arrived = Randoms.randomDate() as NSDate
        obj.finished_date = Randoms.randomFakeName()
        obj.full_address = Randoms.randomFakeName()
        obj.i_rate = NSNumber(value: Randoms.randomInt32())
        obj.i_rate_count = NSNumber(value: Randoms.randomInt32())
        obj.offer_id = NSNumber(value: Randoms.randomInt32())
        obj.order_date = Randoms.randomFakeName()
        obj.order_desc = Randoms.randomFakeName()
        obj.order_no = NSNumber(value: Randoms.randomInt32())
        obj.order_rate = NSNumber(value: Randoms.randomDouble())
        obj.order_status = Randoms.randomFakeName()
        obj.order_time = Randoms.randomFakeName()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.price = Randoms.randomFakeName()
        obj.provider_notes = Randoms.randomFakeName()
        obj.s_app_profit_type = Randoms.randomFakeName()
        obj.s_app_profit_value = Randoms.randomFakeName()
        obj.s_currency = Randoms.randomFakeName()
        obj.s_customer_picture = Randoms.randomFakeName()
        obj.s_date = Randoms.randomFakeName()
        obj.s_delivery_distance = Randoms.randomFakeName()
        obj.s_delivery_full_address = Randoms.randomFakeName()
        obj.s_delivery_latitude = Randoms.randomFakeName()
        obj.s_delivery_longitude = Randoms.randomFakeName()
        obj.s_details = Randoms.randomFakeName()
        obj.s_distance = Randoms.randomFakeName()
        obj.s_driver_name = Randoms.randomFakeName()
        obj.s_driver_picture = Randoms.randomFakeName()
        obj.s_duration = Randoms.randomFakeName()
        obj.s_image = Randoms.randomFakeName()
        obj.s_mobile = Randoms.randomFakeName()
        obj.s_mobile_intro = Randoms.randomFakeName()
        obj.s_pickup_distance = Randoms.randomFakeName()
        obj.s_pickup_full_address = Randoms.randomFakeName()
        obj.s_pickup_latitude = Randoms.randomFakeName()
        obj.s_pickup_longitude = Randoms.randomFakeName()
        obj.s_service_provider = Randoms.randomFakeName()
        obj.s_service_provider_picture = Randoms.randomFakeName()
        obj.s_time_text = Randoms.randomFakeName()
        obj.s_total_distance = Randoms.randomFakeName()
        obj.s_total_price = Randoms.randomFakeName()
        obj.s_type = Randoms.randomFakeName()
        obj.s_vehicle_color = Randoms.randomFakeName()
        obj.s_vehicle_color_code = Randoms.randomFakeName()
        obj.s_vehicle_model = Randoms.randomFakeName()
        obj.s_voice_url = Randoms.randomFakeName()
        obj.service_detail_name = Randoms.randomFakeName()
        obj.service_name = Randoms.randomFakeName()
        obj.total_price = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TChatOrderObject]{
        var arr = [TChatOrderObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TChatOrderObject.demoObject()
            for _ in 1...GlobalConstants.API_PageSize {
                obj.chat.append(TChatObject.demoObject())
            }
            arr.append(obj)
        }
        return arr
    }
    #endif

}


#elseif canImport(Alamofire)
public class _TChatOrderObject: NSObject,NSCoding,NSCopying {
    @objc public var chat_closed: NSNumber?
    @objc public var confirmed_date: String?
    @objc public var coupon_discount: String?
    @objc public var created_at: String?
    @objc public var currency: String?
    @objc public var d_delivery_cost: NSNumber?
    @objc public var d_delivery_distance: NSNumber?
    @objc public var d_distance: NSNumber?
    @objc public var d_duration: NSNumber?
    @objc public var d_max_delivery_value: NSNumber?
    @objc public var d_min_delivery_value: NSNumber?
    @objc public var d_order_rate: NSNumber?
    @objc public var d_pickup_distance: NSNumber?
    @objc public var d_time: NSNumber?
    @objc public var d_total_distance: NSNumber?
    @objc public var dt_accepted: NSDate?
    @objc public var dt_created: NSDate?
    @objc public var dt_current: NSDate?
    @objc public var dt_delivery_date: NSDate?
    @objc public var dt_pickup_arrived: NSDate?
    @objc public var finished_date: String?
    @objc public var full_address: String?
    @objc public var i_rate: NSNumber?
    @objc public var i_rate_count: NSNumber?
    @objc public var offer_id: NSNumber?
    @objc public var order_date: String?
    @objc public var order_desc: String?
    @objc public var order_no: NSNumber?
    @objc public var order_rate: NSNumber?
    @objc public var order_status: String?
    @objc public var order_time: String?
    @objc public var pk_i_id: NSNumber?
    @objc public var price: String?
    @objc public var provider_notes: String?
    @objc public var s_app_profit_type: String?
    @objc public var s_app_profit_value: String?
    @objc public var s_currency: String?
    @objc public var s_customer_picture: String?
    @objc public var s_date: String?
    @objc public var s_delivery_distance: String?
    @objc public var s_delivery_full_address: String?
    @objc public var s_delivery_latitude: String?
    @objc public var s_delivery_longitude: String?
    @objc public var s_details: String?
    @objc public var s_distance: String?
    @objc public var s_driver_name: String?
    @objc public var s_driver_picture: String?
    @objc public var s_duration: String?
    @objc public var s_image: String?
    @objc public var s_mobile: String?
    @objc public var s_mobile_intro: String?
    @objc public var s_pickup_distance: String?
    @objc public var s_pickup_full_address: String?
    @objc public var s_pickup_latitude: String?
    @objc public var s_pickup_longitude: String?
    @objc public var s_service_provider: String?
    @objc public var s_service_provider_picture: String?
    @objc public var s_time_text: String?
    @objc public var s_total_distance: String?
    @objc public var s_total_price: String?
    @objc public var s_type: String?
    @objc public var s_vehicle_color: String?
    @objc public var s_vehicle_color_code: String?
    @objc public var s_vehicle_model: String?
    @objc public var s_voice_url: String?
    @objc public var service_detail_name: String?
    @objc public var service_name: String?
    @objc public var service_type: String?
    @objc public var total_price: String?

    @objc public var actions: TOrderActionsObject?
    @objc public var chat = [TChatObject]()
    @objc public var customer: TUserObject?
    @objc public var payment_way: TPaymentWayObject?
    @objc public var service_provider: TUserObject?

    init(fromDictionary dictionary: NSDictionary){
        chat_closed = dictionary.value(forKeyPath: "chat_closed") as? NSNumber
        service_type = dictionary.value(forKeyPath: "service_type") as? String
        confirmed_date = dictionary.value(forKeyPath: "confirmed_date") as? String
        coupon_discount = dictionary.value(forKeyPath: "coupon_discount") as? String
        created_at = dictionary.value(forKeyPath: "created_at") as? String
        currency = dictionary.value(forKeyPath: "currency") as? String
        d_delivery_cost = dictionary.value(forKeyPath: "delivery_cost") as? NSNumber
        d_delivery_distance = dictionary.value(forKeyPath: "delivery_distance") as? NSNumber
        d_distance = dictionary.value(forKeyPath: "distance") as? NSNumber
        d_duration = dictionary.value(forKeyPath: "duration") as? NSNumber
        d_max_delivery_value = dictionary.value(forKeyPath: "max_delivery_value") as? NSNumber
        d_min_delivery_value = dictionary.value(forKeyPath: "min_delivery_value") as? NSNumber
        d_order_rate = dictionary.value(forKeyPath: "order_rate") as? NSNumber
        d_pickup_distance = dictionary.value(forKeyPath: "pickup_distance") as? NSNumber
        d_time = dictionary.value(forKeyPath: "time") as? NSNumber
        d_total_distance = dictionary.value(forKeyPath: "total_distance") as? NSNumber
        dt_accepted = NSDate.mapperDateFormatter.formats(fromString:dictionary.value(forKeyPath: "accepted_date")  as? String)
        dt_created = NSDate.mapperDateFormatter.formats(fromString:dictionary.value(forKeyPath: "dt_created")  as? String)
        dt_current = NSDate.mapperDateFormatter.formats(fromString:dictionary.value(forKeyPath: "current_date")  as? String)
        dt_delivery_date = NSDate.mapperDateFormatter.formats(fromString:dictionary.value(forKeyPath: "dt_delivery_date")  as? String)
        dt_pickup_arrived = NSDate.mapperDateFormatter.formats(fromString:dictionary.value(forKeyPath: "pickup_arrived_date")  as? String)
        finished_date = dictionary.value(forKeyPath: "finished_date") as? String
        full_address = dictionary.value(forKeyPath: "full_address") as? String
        i_rate = dictionary.value(forKeyPath: "rate") as? NSNumber
        i_rate_count = dictionary.value(forKeyPath: "rate_count") as? NSNumber
        offer_id = dictionary.value(forKeyPath: "offer_id") as? NSNumber
        order_date = dictionary.value(forKeyPath: "order_date") as? String
        order_desc = dictionary.value(forKeyPath: "order_desc") as? String
        order_no = NumberFormatter().number(from: dictionary.value(forKeyPath: "order_no") as? String ?? "0")
        order_rate = dictionary.value(forKeyPath: "order_rate") as? NSNumber
        order_status = dictionary.value(forKeyPath: "order_status") as? String
        order_time = dictionary.value(forKeyPath: "order_time") as? String
        pk_i_id = dictionary.value(forKeyPath: "id") as? NSNumber
        price = dictionary.value(forKeyPath: "price") as? String
        provider_notes = dictionary.value(forKeyPath: "provider_notes") as? String
        s_app_profit_type = dictionary.value(forKeyPath: "app_profit_type") as? String
        s_app_profit_value = dictionary.value(forKeyPath: "app_profit_value") as? String
        s_currency = dictionary.value(forKeyPath: "currency") as? String
        s_customer_picture = dictionary.value(forKeyPath: "customer_picture_url") as? String
        s_date = dictionary.value(forKeyPath: "date") as? String
        s_delivery_distance = dictionary.value(forKeyPath: "delivery_distance_text") as? String
        s_delivery_full_address = dictionary.value(forKeyPath: "delivery_full_address") as? String
        s_delivery_latitude = dictionary.value(forKeyPath: "delivery_latitude") as? String
        s_delivery_longitude = dictionary.value(forKeyPath: "delivery_longitude") as? String
        s_details = dictionary.value(forKeyPath: "order_details") as? String
        s_distance = dictionary.value(forKeyPath: "distance_text") as? String
        s_driver_name = dictionary.value(forKeyPath: "driver_name") as? String
        s_driver_picture = dictionary.value(forKeyPath: "driver_picture_url") as? String
        s_duration = dictionary.value(forKeyPath: "duration_text") as? String
        s_image = dictionary.value(forKeyPath: "picture_url") as? String
        s_mobile = dictionary.value(forKeyPath: "mobile") as? String
        s_mobile_intro = dictionary.value(forKeyPath: "mobile_intro") as? String
        s_pickup_distance = dictionary.value(forKeyPath: "pickup_distance_text") as? String
        s_pickup_full_address = dictionary.value(forKeyPath: "pickup_full_address") as? String
        s_pickup_latitude = dictionary.value(forKeyPath: "pickup_latitude") as? String
        s_pickup_longitude = dictionary.value(forKeyPath: "pickup_longitude") as? String
        s_service_provider = dictionary.value(forKeyPath: "service_provider_name") as? String
        s_service_provider_picture = dictionary.value(forKeyPath: "service_provider_picture_url") as? String
        s_time_text = dictionary.value(forKeyPath: "time_text") as? String
        s_total_distance = dictionary.value(forKeyPath: "total_distance_text") as? String
        s_total_price = dictionary.value(forKeyPath: "total_price") as? String
        s_type = dictionary.value(forKeyPath: "order_type") as? String
        s_vehicle_color = dictionary.value(forKeyPath: "vehicle_color") as? String
        s_vehicle_color_code = dictionary.value(forKeyPath: "vehicle_color_code") as? String
        s_vehicle_model = dictionary.value(forKeyPath: "vehicle_model") as? String
        s_voice_url = dictionary.value(forKeyPath: "order_voice") as? String
        service_detail_name = dictionary.value(forKeyPath: "service_detail_name") as? String
        service_name = dictionary.value(forKeyPath: "service_name") as? String
        total_price = dictionary.value(forKeyPath: "total_price") as? String

        if let data = dictionary["actions"] as? NSDictionary{
            actions = TOrderActionsObject(fromDictionary: data)
        }
        if let arr = dictionary["chat"] as? [NSDictionary]{
            for dic in arr{
                let value = TChatObject(fromDictionary: dic)
                chat.append(value)
            }
        }
        if let data = dictionary["customer"] as? NSDictionary{
            customer = TUserObject(fromDictionary: data)
        }
        if let data = dictionary["payment_way"] as? NSDictionary{
            payment_way = TPaymentWayObject(fromDictionary: data)
        }
        if let data = dictionary["service_provider"] as? NSDictionary{
            service_provider = TUserObject(fromDictionary: data)
        }
    }

    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()

        dictionary["chat_closed"] = chat_closed
        dictionary["confirmed_date"] = confirmed_date
        dictionary["coupon_discount"] = coupon_discount
        dictionary["created_at"] = created_at
        dictionary["currency"] = currency
        dictionary["delivery_cost"] = d_delivery_cost
        dictionary["delivery_distance"] = d_delivery_distance
        dictionary["distance"] = d_distance
        dictionary["duration"] = d_duration
        dictionary["max_delivery_value"] = d_max_delivery_value
        dictionary["min_delivery_value"] = d_min_delivery_value
        dictionary["order_rate"] = d_order_rate
        dictionary["pickup_distance"] = d_pickup_distance
        dictionary["time"] = d_time
        dictionary["total_distance"] = d_total_distance
        dictionary["accepted_date"] = dt_accepted
        dictionary["dt_created"] = dt_created
        dictionary["current_date"] = dt_current
        dictionary["dt_delivery_date"] = dt_delivery_date
        dictionary["pickup_arrived_date"] = dt_pickup_arrived
        dictionary["finished_date"] = finished_date
        dictionary["full_address"] = full_address
        dictionary["rate"] = i_rate
        dictionary["rate_count"] = i_rate_count
        dictionary["offer_id"] = offer_id
        dictionary["order_date"] = order_date
        dictionary["order_desc"] = order_desc
        dictionary["order_no"] = order_no
        dictionary["order_rate"] = order_rate
        dictionary["order_status"] = order_status
        dictionary["order_time"] = order_time
        dictionary["id"] = pk_i_id
        dictionary["price"] = price
        dictionary["provider_notes"] = provider_notes
        dictionary["app_profit_type"] = s_app_profit_type
        dictionary["app_profit_value"] = s_app_profit_value
        dictionary["currency"] = s_currency
        dictionary["customer_picture_url"] = s_customer_picture
        dictionary["date"] = s_date
        dictionary["delivery_distance_text"] = s_delivery_distance
        dictionary["delivery_full_address"] = s_delivery_full_address
        dictionary["delivery_latitude"] = s_delivery_latitude
        dictionary["delivery_longitude"] = s_delivery_longitude
        dictionary["order_details"] = s_details
        dictionary["distance_text"] = s_distance
        dictionary["driver_name"] = s_driver_name
        dictionary["driver_picture_url"] = s_driver_picture
        dictionary["duration_text"] = s_duration
        dictionary["picture_url"] = s_image
        dictionary["mobile"] = s_mobile
        dictionary["mobile_intro"] = s_mobile_intro
        dictionary["pickup_distance_text"] = s_pickup_distance
        dictionary["pickup_full_address"] = s_pickup_full_address
        dictionary["pickup_latitude"] = s_pickup_latitude
        dictionary["pickup_longitude"] = s_pickup_longitude
        dictionary["service_provider_name"] = s_service_provider
        dictionary["service_provider_picture_url"] = s_service_provider_picture
        dictionary["time_text"] = s_time_text
        dictionary["total_distance_text"] = s_total_distance
        dictionary["total_price"] = s_total_price
        dictionary["order_type"] = s_type
        dictionary["vehicle_color"] = s_vehicle_color
        dictionary["vehicle_color_code"] = s_vehicle_color_code
        dictionary["vehicle_model"] = s_vehicle_model
        dictionary["order_voice"] = s_voice_url
        dictionary["service_detail_name"] = service_detail_name
        dictionary["service_name"] = service_name
        dictionary["total_price"] = total_price

        dictionary["actions"] =  actions?.toDictionary()
        do {
            var dictionaryElements = [[String:Any]]()
            for obj in chat {
                dictionaryElements.append(obj.toDictionary())
            }
            dictionary["chat"] = dictionaryElements
        }
        dictionary["customer"] =  customer?.toDictionary()
        dictionary["payment_way"] =  payment_way?.toDictionary()
        dictionary["service_provider"] =  service_provider?.toDictionary()

        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder){
        chat_closed = aDecoder.decodeObject(forKey:"chat_closed") as? NSNumber
        confirmed_date = aDecoder.decodeObject(forKey:"confirmed_date") as? String
        coupon_discount = aDecoder.decodeObject(forKey:"coupon_discount") as? String
        created_at = aDecoder.decodeObject(forKey:"created_at") as? String
        currency = aDecoder.decodeObject(forKey:"currency") as? String
        d_delivery_cost = aDecoder.decodeObject(forKey:"delivery_cost") as? NSNumber
        d_delivery_distance = aDecoder.decodeObject(forKey:"delivery_distance") as? NSNumber
        d_distance = aDecoder.decodeObject(forKey:"distance") as? NSNumber
        d_duration = aDecoder.decodeObject(forKey:"duration") as? NSNumber
        d_max_delivery_value = aDecoder.decodeObject(forKey:"max_delivery_value") as? NSNumber
        d_min_delivery_value = aDecoder.decodeObject(forKey:"min_delivery_value") as? NSNumber
        d_order_rate = aDecoder.decodeObject(forKey:"order_rate") as? NSNumber
        d_pickup_distance = aDecoder.decodeObject(forKey:"pickup_distance") as? NSNumber
        d_time = aDecoder.decodeObject(forKey:"time") as? NSNumber
        d_total_distance = aDecoder.decodeObject(forKey:"total_distance") as? NSNumber
        dt_accepted = aDecoder.decodeObject(forKey:"accepted_date") as? NSDate
        dt_created = aDecoder.decodeObject(forKey:"dt_created") as? NSDate
        dt_current = aDecoder.decodeObject(forKey:"current_date") as? NSDate
        dt_delivery_date = aDecoder.decodeObject(forKey:"dt_delivery_date") as? NSDate
        dt_pickup_arrived = aDecoder.decodeObject(forKey:"pickup_arrived_date") as? NSDate
        finished_date = aDecoder.decodeObject(forKey:"finished_date") as? String
        full_address = aDecoder.decodeObject(forKey:"full_address") as? String
        i_rate = aDecoder.decodeObject(forKey:"rate") as? NSNumber
        i_rate_count = aDecoder.decodeObject(forKey:"rate_count") as? NSNumber
        offer_id = aDecoder.decodeObject(forKey:"offer_id") as? NSNumber
        order_date = aDecoder.decodeObject(forKey:"order_date") as? String
        order_desc = aDecoder.decodeObject(forKey:"order_desc") as? String
        order_no = aDecoder.decodeObject(forKey:"order_no") as? NSNumber
        order_rate = aDecoder.decodeObject(forKey:"order_rate") as? NSNumber
        order_status = aDecoder.decodeObject(forKey:"order_status") as? String
        order_time = aDecoder.decodeObject(forKey:"order_time") as? String
        pk_i_id = aDecoder.decodeObject(forKey:"id") as? NSNumber
        price = aDecoder.decodeObject(forKey:"price") as? String
        provider_notes = aDecoder.decodeObject(forKey:"provider_notes") as? String
        s_app_profit_type = aDecoder.decodeObject(forKey:"app_profit_type") as? String
        s_app_profit_value = aDecoder.decodeObject(forKey:"app_profit_value") as? String
        s_currency = aDecoder.decodeObject(forKey:"currency") as? String
        s_customer_picture = aDecoder.decodeObject(forKey:"customer_picture_url") as? String
        s_date = aDecoder.decodeObject(forKey:"date") as? String
        s_delivery_distance = aDecoder.decodeObject(forKey:"delivery_distance_text") as? String
        s_delivery_full_address = aDecoder.decodeObject(forKey:"delivery_full_address") as? String
        s_delivery_latitude = aDecoder.decodeObject(forKey:"delivery_latitude") as? String
        s_delivery_longitude = aDecoder.decodeObject(forKey:"delivery_longitude") as? String
        s_details = aDecoder.decodeObject(forKey:"order_details") as? String
        s_distance = aDecoder.decodeObject(forKey:"distance_text") as? String
        s_driver_name = aDecoder.decodeObject(forKey:"driver_name") as? String
        s_driver_picture = aDecoder.decodeObject(forKey:"driver_picture_url") as? String
        s_duration = aDecoder.decodeObject(forKey:"duration_text") as? String
        s_image = aDecoder.decodeObject(forKey:"picture_url") as? String
        s_mobile = aDecoder.decodeObject(forKey:"mobile") as? String
        s_mobile_intro = aDecoder.decodeObject(forKey:"mobile_intro") as? String
        s_pickup_distance = aDecoder.decodeObject(forKey:"pickup_distance_text") as? String
        s_pickup_full_address = aDecoder.decodeObject(forKey:"pickup_full_address") as? String
        s_pickup_latitude = aDecoder.decodeObject(forKey:"pickup_latitude") as? String
        s_pickup_longitude = aDecoder.decodeObject(forKey:"pickup_longitude") as? String
        s_service_provider = aDecoder.decodeObject(forKey:"service_provider_name") as? String
        s_service_provider_picture = aDecoder.decodeObject(forKey:"service_provider_picture_url") as? String
        s_time_text = aDecoder.decodeObject(forKey:"time_text") as? String
        s_total_distance = aDecoder.decodeObject(forKey:"total_distance_text") as? String
        s_total_price = aDecoder.decodeObject(forKey:"total_price") as? String
        s_type = aDecoder.decodeObject(forKey:"order_type") as? String
        s_vehicle_color = aDecoder.decodeObject(forKey:"vehicle_color") as? String
        s_vehicle_color_code = aDecoder.decodeObject(forKey:"vehicle_color_code") as? String
        s_vehicle_model = aDecoder.decodeObject(forKey:"vehicle_model") as? String
        s_voice_url = aDecoder.decodeObject(forKey:"order_voice") as? String
        service_detail_name = aDecoder.decodeObject(forKey:"service_detail_name") as? String
        service_name = aDecoder.decodeObject(forKey:"service_name") as? String
        total_price = aDecoder.decodeObject(forKey:"total_price") as? String

        actions = aDecoder.decodeObject(forKey:"actions") as? TOrderActionsObject
        chat = aDecoder.decodeObject(forKey:"chat") as? [TChatObject] ?? [TChatObject]()
        customer = aDecoder.decodeObject(forKey:"customer") as? TUserObject
        payment_way = aDecoder.decodeObject(forKey:"payment_way") as? TPaymentWayObject
        service_provider = aDecoder.decodeObject(forKey:"service_provider") as? TUserObject
    }

    @objc public func encode(with aCoder: NSCoder){
        if chat_closed != nil{
            aCoder.encode(chat_closed, forKey: "chat_closed")
        }
        if confirmed_date != nil{
            aCoder.encode(confirmed_date, forKey: "confirmed_date")
        }
        if coupon_discount != nil{
            aCoder.encode(coupon_discount, forKey: "coupon_discount")
        }
        if created_at != nil{
            aCoder.encode(created_at, forKey: "created_at")
        }
        if currency != nil{
            aCoder.encode(currency, forKey: "currency")
        }
        if d_delivery_cost != nil{
            aCoder.encode(d_delivery_cost, forKey: "delivery_cost")
        }
        if d_delivery_distance != nil{
            aCoder.encode(d_delivery_distance, forKey: "delivery_distance")
        }
        if d_distance != nil{
            aCoder.encode(d_distance, forKey: "distance")
        }
        if d_duration != nil{
            aCoder.encode(d_duration, forKey: "duration")
        }
        if d_max_delivery_value != nil{
            aCoder.encode(d_max_delivery_value, forKey: "max_delivery_value")
        }
        if d_min_delivery_value != nil{
            aCoder.encode(d_min_delivery_value, forKey: "min_delivery_value")
        }
        if d_order_rate != nil{
            aCoder.encode(d_order_rate, forKey: "order_rate")
        }
        if d_pickup_distance != nil{
            aCoder.encode(d_pickup_distance, forKey: "pickup_distance")
        }
        if d_time != nil{
            aCoder.encode(d_time, forKey: "time")
        }
        if d_total_distance != nil{
            aCoder.encode(d_total_distance, forKey: "total_distance")
        }
        if dt_accepted != nil{
            aCoder.encode(dt_accepted, forKey: "accepted_date")
        }
        if dt_created != nil{
            aCoder.encode(dt_created, forKey: "dt_created")
        }
        if dt_current != nil{
            aCoder.encode(dt_current, forKey: "current_date")
        }
        if dt_delivery_date != nil{
            aCoder.encode(dt_delivery_date, forKey: "dt_delivery_date")
        }
        if dt_pickup_arrived != nil{
            aCoder.encode(dt_pickup_arrived, forKey: "pickup_arrived_date")
        }
        if finished_date != nil{
            aCoder.encode(finished_date, forKey: "finished_date")
        }
        if full_address != nil{
            aCoder.encode(full_address, forKey: "full_address")
        }
        if i_rate != nil{
            aCoder.encode(i_rate, forKey: "rate")
        }
        if i_rate_count != nil{
            aCoder.encode(i_rate_count, forKey: "rate_count")
        }
        if offer_id != nil{
            aCoder.encode(offer_id, forKey: "offer_id")
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
        if order_rate != nil{
            aCoder.encode(order_rate, forKey: "order_rate")
        }
        if order_status != nil{
            aCoder.encode(order_status, forKey: "order_status")
        }
        if order_time != nil{
            aCoder.encode(order_time, forKey: "order_time")
        }
        if pk_i_id != nil{
            aCoder.encode(pk_i_id, forKey: "id")
        }
        if price != nil{
            aCoder.encode(price, forKey: "price")
        }
        if provider_notes != nil{
            aCoder.encode(provider_notes, forKey: "provider_notes")
        }
        if s_app_profit_type != nil{
            aCoder.encode(s_app_profit_type, forKey: "app_profit_type")
        }
        if s_app_profit_value != nil{
            aCoder.encode(s_app_profit_value, forKey: "app_profit_value")
        }
        if s_currency != nil{
            aCoder.encode(s_currency, forKey: "currency")
        }
        if s_customer_picture != nil{
            aCoder.encode(s_customer_picture, forKey: "customer_picture_url")
        }
        if s_date != nil{
            aCoder.encode(s_date, forKey: "date")
        }
        if s_delivery_distance != nil{
            aCoder.encode(s_delivery_distance, forKey: "delivery_distance_text")
        }
        if s_delivery_full_address != nil{
            aCoder.encode(s_delivery_full_address, forKey: "delivery_full_address")
        }
        if s_delivery_latitude != nil{
            aCoder.encode(s_delivery_latitude, forKey: "delivery_latitude")
        }
        if s_delivery_longitude != nil{
            aCoder.encode(s_delivery_longitude, forKey: "delivery_longitude")
        }
        if s_details != nil{
            aCoder.encode(s_details, forKey: "order_details")
        }
        if s_distance != nil{
            aCoder.encode(s_distance, forKey: "distance_text")
        }
        if s_driver_name != nil{
            aCoder.encode(s_driver_name, forKey: "driver_name")
        }
        if s_driver_picture != nil{
            aCoder.encode(s_driver_picture, forKey: "driver_picture_url")
        }
        if s_duration != nil{
            aCoder.encode(s_duration, forKey: "duration_text")
        }
        if s_image != nil{
            aCoder.encode(s_image, forKey: "picture_url")
        }
        if s_mobile != nil{
            aCoder.encode(s_mobile, forKey: "mobile")
        }
        if s_mobile_intro != nil{
            aCoder.encode(s_mobile_intro, forKey: "mobile_intro")
        }
        if s_pickup_distance != nil{
            aCoder.encode(s_pickup_distance, forKey: "pickup_distance_text")
        }
        if s_pickup_full_address != nil{
            aCoder.encode(s_pickup_full_address, forKey: "pickup_full_address")
        }
        if s_pickup_latitude != nil{
            aCoder.encode(s_pickup_latitude, forKey: "pickup_latitude")
        }
        if s_pickup_longitude != nil{
            aCoder.encode(s_pickup_longitude, forKey: "pickup_longitude")
        }
        if s_service_provider != nil{
            aCoder.encode(s_service_provider, forKey: "service_provider_name")
        }
        if s_service_provider_picture != nil{
            aCoder.encode(s_service_provider_picture, forKey: "service_provider_picture_url")
        }
        if s_time_text != nil{
            aCoder.encode(s_time_text, forKey: "time_text")
        }
        if s_total_distance != nil{
            aCoder.encode(s_total_distance, forKey: "total_distance_text")
        }
        if s_total_price != nil{
            aCoder.encode(s_total_price, forKey: "total_price")
        }
        if s_type != nil{
            aCoder.encode(s_type, forKey: "order_type")
        }
        if s_vehicle_color != nil{
            aCoder.encode(s_vehicle_color, forKey: "vehicle_color")
        }
        if s_vehicle_color_code != nil{
            aCoder.encode(s_vehicle_color_code, forKey: "vehicle_color_code")
        }
        if s_vehicle_model != nil{
            aCoder.encode(s_vehicle_model, forKey: "vehicle_model")
        }
        if s_voice_url != nil{
            aCoder.encode(s_voice_url, forKey: "order_voice")
        }
        if service_detail_name != nil{
            aCoder.encode(service_detail_name, forKey: "service_detail_name")
        }
        if service_name != nil{
            aCoder.encode(service_name, forKey: "service_name")
        }
        if total_price != nil{
            aCoder.encode(total_price, forKey: "total_price")
        }

        if actions != nil{
            aCoder.encode(actions, forKey: "actions")
        }
        if chat != nil{
            aCoder.encode(chat, forKey: "chat")
        }
        if customer != nil{
            aCoder.encode(customer, forKey: "customer")
        }
        if payment_way != nil{
            aCoder.encode(payment_way, forKey: "payment_way")
        }
        if service_provider != nil{
            aCoder.encode(service_provider, forKey: "service_provider")
        }
    }
    public func copy(with zone: NSZone? = nil) -> Any {
        return TChatOrderObject(fromDictionary: self.toDictionary() as NSDictionary)
    }
    public override var description: String{
        var description: String = "<TChatOrderObject: \(Unmanaged.passUnretained(self as AnyObject).toOpaque())> {"

        description += "\n    \"chat_closed\" : \(chat_closed?.description ?? "nil");"
        description += "\n    \"confirmed_date\" : \(confirmed_date != nil ? "\"\(confirmed_date?.description ?? "nil")\"" : "\(confirmed_date?.description ?? "nil")");"
        description += "\n    \"coupon_discount\" : \(coupon_discount != nil ? "\"\(coupon_discount?.description ?? "nil")\"" : "\(coupon_discount?.description ?? "nil")");"
        description += "\n    \"created_at\" : \(created_at != nil ? "\"\(created_at?.description ?? "nil")\"" : "\(created_at?.description ?? "nil")");"
        description += "\n    \"currency\" : \(currency != nil ? "\"\(currency?.description ?? "nil")\"" : "\(currency?.description ?? "nil")");"
        description += "\n    \"d_delivery_cost\" : \(d_delivery_cost?.description ?? "nil");"
        description += "\n    \"d_delivery_distance\" : \(d_delivery_distance?.description ?? "nil");"
        description += "\n    \"d_distance\" : \(d_distance?.description ?? "nil");"
        description += "\n    \"d_duration\" : \(d_duration?.description ?? "nil");"
        description += "\n    \"d_max_delivery_value\" : \(d_max_delivery_value?.description ?? "nil");"
        description += "\n    \"d_min_delivery_value\" : \(d_min_delivery_value?.description ?? "nil");"
        description += "\n    \"d_order_rate\" : \(d_order_rate?.description ?? "nil");"
        description += "\n    \"d_pickup_distance\" : \(d_pickup_distance?.description ?? "nil");"
        description += "\n    \"d_time\" : \(d_time?.description ?? "nil");"
        description += "\n    \"d_total_distance\" : \(d_total_distance?.description ?? "nil");"
        description += "\n    \"dt_accepted\" : \(dt_accepted != nil ? "\"\(dt_accepted?.description ?? "nil")\"" : "\(dt_accepted?.description ?? "nil")");"
        description += "\n    \"dt_created\" : \(dt_created != nil ? "\"\(dt_created?.description ?? "nil")\"" : "\(dt_created?.description ?? "nil")");"
        description += "\n    \"dt_current\" : \(dt_current != nil ? "\"\(dt_current?.description ?? "nil")\"" : "\(dt_current?.description ?? "nil")");"
        description += "\n    \"dt_delivery_date\" : \(dt_delivery_date != nil ? "\"\(dt_delivery_date?.description ?? "nil")\"" : "\(dt_delivery_date?.description ?? "nil")");"
        description += "\n    \"dt_pickup_arrived\" : \(dt_pickup_arrived != nil ? "\"\(dt_pickup_arrived?.description ?? "nil")\"" : "\(dt_pickup_arrived?.description ?? "nil")");"
        description += "\n    \"finished_date\" : \(finished_date != nil ? "\"\(finished_date?.description ?? "nil")\"" : "\(finished_date?.description ?? "nil")");"
        description += "\n    \"full_address\" : \(full_address != nil ? "\"\(full_address?.description ?? "nil")\"" : "\(full_address?.description ?? "nil")");"
        description += "\n    \"i_rate\" : \(i_rate?.description ?? "nil");"
        description += "\n    \"i_rate_count\" : \(i_rate_count?.description ?? "nil");"
        description += "\n    \"offer_id\" : \(offer_id?.description ?? "nil");"
        description += "\n    \"order_date\" : \(order_date != nil ? "\"\(order_date?.description ?? "nil")\"" : "\(order_date?.description ?? "nil")");"
        description += "\n    \"order_desc\" : \(order_desc != nil ? "\"\(order_desc?.description ?? "nil")\"" : "\(order_desc?.description ?? "nil")");"
        description += "\n    \"order_no\" : \(order_no?.description ?? "nil");"
        description += "\n    \"order_rate\" : \(order_rate?.description ?? "nil");"
        description += "\n    \"order_status\" : \(order_status != nil ? "\"\(order_status?.description ?? "nil")\"" : "\(order_status?.description ?? "nil")");"
        description += "\n    \"order_time\" : \(order_time != nil ? "\"\(order_time?.description ?? "nil")\"" : "\(order_time?.description ?? "nil")");"
        description += "\n    \"pk_i_id\" : \(pk_i_id?.description ?? "nil");"
        description += "\n    \"price\" : \(price != nil ? "\"\(price?.description ?? "nil")\"" : "\(price?.description ?? "nil")");"
        description += "\n    \"provider_notes\" : \(provider_notes != nil ? "\"\(provider_notes?.description ?? "nil")\"" : "\(provider_notes?.description ?? "nil")");"
        description += "\n    \"s_app_profit_type\" : \(s_app_profit_type != nil ? "\"\(s_app_profit_type?.description ?? "nil")\"" : "\(s_app_profit_type?.description ?? "nil")");"
        description += "\n    \"s_app_profit_value\" : \(s_app_profit_value != nil ? "\"\(s_app_profit_value?.description ?? "nil")\"" : "\(s_app_profit_value?.description ?? "nil")");"
        description += "\n    \"s_currency\" : \(s_currency != nil ? "\"\(s_currency?.description ?? "nil")\"" : "\(s_currency?.description ?? "nil")");"
        description += "\n    \"s_customer_picture\" : \(s_customer_picture != nil ? "\"\(s_customer_picture?.description ?? "nil")\"" : "\(s_customer_picture?.description ?? "nil")");"
        description += "\n    \"s_date\" : \(s_date != nil ? "\"\(s_date?.description ?? "nil")\"" : "\(s_date?.description ?? "nil")");"
        description += "\n    \"s_delivery_distance\" : \(s_delivery_distance != nil ? "\"\(s_delivery_distance?.description ?? "nil")\"" : "\(s_delivery_distance?.description ?? "nil")");"
        description += "\n    \"s_delivery_full_address\" : \(s_delivery_full_address != nil ? "\"\(s_delivery_full_address?.description ?? "nil")\"" : "\(s_delivery_full_address?.description ?? "nil")");"
        description += "\n    \"s_delivery_latitude\" : \(s_delivery_latitude != nil ? "\"\(s_delivery_latitude?.description ?? "nil")\"" : "\(s_delivery_latitude?.description ?? "nil")");"
        description += "\n    \"s_delivery_longitude\" : \(s_delivery_longitude != nil ? "\"\(s_delivery_longitude?.description ?? "nil")\"" : "\(s_delivery_longitude?.description ?? "nil")");"
        description += "\n    \"s_details\" : \(s_details != nil ? "\"\(s_details?.description ?? "nil")\"" : "\(s_details?.description ?? "nil")");"
        description += "\n    \"s_distance\" : \(s_distance != nil ? "\"\(s_distance?.description ?? "nil")\"" : "\(s_distance?.description ?? "nil")");"
        description += "\n    \"s_driver_name\" : \(s_driver_name != nil ? "\"\(s_driver_name?.description ?? "nil")\"" : "\(s_driver_name?.description ?? "nil")");"
        description += "\n    \"s_driver_picture\" : \(s_driver_picture != nil ? "\"\(s_driver_picture?.description ?? "nil")\"" : "\(s_driver_picture?.description ?? "nil")");"
        description += "\n    \"s_duration\" : \(s_duration != nil ? "\"\(s_duration?.description ?? "nil")\"" : "\(s_duration?.description ?? "nil")");"
        description += "\n    \"s_image\" : \(s_image != nil ? "\"\(s_image?.description ?? "nil")\"" : "\(s_image?.description ?? "nil")");"
        description += "\n    \"s_mobile\" : \(s_mobile != nil ? "\"\(s_mobile?.description ?? "nil")\"" : "\(s_mobile?.description ?? "nil")");"
        description += "\n    \"s_mobile_intro\" : \(s_mobile_intro != nil ? "\"\(s_mobile_intro?.description ?? "nil")\"" : "\(s_mobile_intro?.description ?? "nil")");"
        description += "\n    \"s_pickup_distance\" : \(s_pickup_distance != nil ? "\"\(s_pickup_distance?.description ?? "nil")\"" : "\(s_pickup_distance?.description ?? "nil")");"
        description += "\n    \"s_pickup_full_address\" : \(s_pickup_full_address != nil ? "\"\(s_pickup_full_address?.description ?? "nil")\"" : "\(s_pickup_full_address?.description ?? "nil")");"
        description += "\n    \"s_pickup_latitude\" : \(s_pickup_latitude != nil ? "\"\(s_pickup_latitude?.description ?? "nil")\"" : "\(s_pickup_latitude?.description ?? "nil")");"
        description += "\n    \"s_pickup_longitude\" : \(s_pickup_longitude != nil ? "\"\(s_pickup_longitude?.description ?? "nil")\"" : "\(s_pickup_longitude?.description ?? "nil")");"
        description += "\n    \"s_service_provider\" : \(s_service_provider != nil ? "\"\(s_service_provider?.description ?? "nil")\"" : "\(s_service_provider?.description ?? "nil")");"
        description += "\n    \"s_service_provider_picture\" : \(s_service_provider_picture != nil ? "\"\(s_service_provider_picture?.description ?? "nil")\"" : "\(s_service_provider_picture?.description ?? "nil")");"
        description += "\n    \"s_time_text\" : \(s_time_text != nil ? "\"\(s_time_text?.description ?? "nil")\"" : "\(s_time_text?.description ?? "nil")");"
        description += "\n    \"s_total_distance\" : \(s_total_distance != nil ? "\"\(s_total_distance?.description ?? "nil")\"" : "\(s_total_distance?.description ?? "nil")");"
        description += "\n    \"s_total_price\" : \(s_total_price != nil ? "\"\(s_total_price?.description ?? "nil")\"" : "\(s_total_price?.description ?? "nil")");"
        description += "\n    \"s_type\" : \(s_type != nil ? "\"\(s_type?.description ?? "nil")\"" : "\(s_type?.description ?? "nil")");"
        description += "\n    \"s_vehicle_color\" : \(s_vehicle_color != nil ? "\"\(s_vehicle_color?.description ?? "nil")\"" : "\(s_vehicle_color?.description ?? "nil")");"
        description += "\n    \"s_vehicle_color_code\" : \(s_vehicle_color_code != nil ? "\"\(s_vehicle_color_code?.description ?? "nil")\"" : "\(s_vehicle_color_code?.description ?? "nil")");"
        description += "\n    \"s_vehicle_model\" : \(s_vehicle_model != nil ? "\"\(s_vehicle_model?.description ?? "nil")\"" : "\(s_vehicle_model?.description ?? "nil")");"
        description += "\n    \"s_voice_url\" : \(s_voice_url != nil ? "\"\(s_voice_url?.description ?? "nil")\"" : "\(s_voice_url?.description ?? "nil")");"
        description += "\n    \"service_detail_name\" : \(service_detail_name != nil ? "\"\(service_detail_name?.description ?? "nil")\"" : "\(service_detail_name?.description ?? "nil")");"
        description += "\n    \"service_name\" : \(service_name != nil ? "\"\(service_name?.description ?? "nil")\"" : "\(service_name?.description ?? "nil")");"
        description += "\n    \"total_price\" : \(total_price != nil ? "\"\(total_price?.description ?? "nil")\"" : "\(total_price?.description ?? "nil")");"
        description += "\n    actions = \(actions != nil ? "<TOrderActionsObject: \(Unmanaged.passUnretained(actions!).toOpaque())>" : "nil");"
        description += "\n    chat = [TChatObject].count = \(chat.count);"
        description += "\n    customer = \(customer != nil ? "<TUserObject: \(Unmanaged.passUnretained(customer!).toOpaque())>" : "nil");"
        description += "\n    payment_way = \(payment_way != nil ? "<TPaymentWayObject: \(Unmanaged.passUnretained(payment_way!).toOpaque())>" : "nil");"
        description += "\n    service_provider = \(service_provider != nil ? "<TUserObject: \(Unmanaged.passUnretained(service_provider!).toOpaque())>" : "nil");"
        description += "\n  }"

        return description
    }

    func isEqual(object: _TChatOrderObject?) -> Bool {
        return self == object
    }
    static func == (left: _TChatOrderObject, right: _TChatOrderObject) -> Bool {
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
    static func demoObject()-> TChatOrderObject{
        let obj = TChatOrderObject(fromDictionary: ["":""])
        obj.chat_closed = NSNumber(value: Randoms.randomBool())
        obj.confirmed_date = Randoms.randomFakeName()
        obj.coupon_discount = Randoms.randomFakeName()
        obj.created_at = Randoms.randomFakeName()
        obj.currency = Randoms.randomFakeName()
        obj.d_delivery_cost = NSNumber(value: Randoms.randomDouble())
        obj.d_delivery_distance = NSNumber(value: Randoms.randomDouble())
        obj.d_distance = NSNumber(value: Randoms.randomDouble())
        obj.d_duration = NSNumber(value: Randoms.randomDouble())
        obj.d_max_delivery_value = NSNumber(value: Randoms.randomDouble())
        obj.d_min_delivery_value = NSNumber(value: Randoms.randomDouble())
        obj.d_order_rate = NSNumber(value: Randoms.randomDouble())
        obj.d_pickup_distance = NSNumber(value: Randoms.randomDouble())
        obj.d_time = NSNumber(value: Randoms.randomDouble())
        obj.d_total_distance = NSNumber(value: Randoms.randomDouble())
        obj.dt_accepted = Randoms.randomDate() as NSDate
        obj.dt_created = Randoms.randomDate() as NSDate
        obj.dt_current = Randoms.randomDate() as NSDate
        obj.dt_delivery_date = Randoms.randomDate() as NSDate
        obj.dt_pickup_arrived = Randoms.randomDate() as NSDate
        obj.finished_date = Randoms.randomFakeName()
        obj.full_address = Randoms.randomFakeName()
        obj.i_rate = NSNumber(value: Randoms.randomInt32())
        obj.i_rate_count = NSNumber(value: Randoms.randomInt32())
        obj.offer_id = NSNumber(value: Randoms.randomInt32())
        obj.order_date = Randoms.randomFakeName()
        obj.order_desc = Randoms.randomFakeName()
        obj.order_no = NSNumber(value: Randoms.randomInt32())
        obj.order_rate = NSNumber(value: Randoms.randomDouble())
        obj.order_status = Randoms.randomFakeName()
        obj.order_time = Randoms.randomFakeName()
        obj.pk_i_id = NSNumber(value: Randoms.randomInt32())
        obj.price = Randoms.randomFakeName()
        obj.provider_notes = Randoms.randomFakeName()
        obj.s_app_profit_type = Randoms.randomFakeName()
        obj.s_app_profit_value = Randoms.randomFakeName()
        obj.s_currency = Randoms.randomFakeName()
        obj.s_customer_picture = Randoms.randomFakeName()
        obj.s_date = Randoms.randomFakeName()
        obj.s_delivery_distance = Randoms.randomFakeName()
        obj.s_delivery_full_address = Randoms.randomFakeName()
        obj.s_delivery_latitude = Randoms.randomFakeName()
        obj.s_delivery_longitude = Randoms.randomFakeName()
        obj.s_details = Randoms.randomFakeName()
        obj.s_distance = Randoms.randomFakeName()
        obj.s_driver_name = Randoms.randomFakeName()
        obj.s_driver_picture = Randoms.randomFakeName()
        obj.s_duration = Randoms.randomFakeName()
        obj.s_image = Randoms.randomFakeName()
        obj.s_mobile = Randoms.randomFakeName()
        obj.s_mobile_intro = Randoms.randomFakeName()
        obj.s_pickup_distance = Randoms.randomFakeName()
        obj.s_pickup_full_address = Randoms.randomFakeName()
        obj.s_pickup_latitude = Randoms.randomFakeName()
        obj.s_pickup_longitude = Randoms.randomFakeName()
        obj.s_service_provider = Randoms.randomFakeName()
        obj.s_service_provider_picture = Randoms.randomFakeName()
        obj.s_time_text = Randoms.randomFakeName()
        obj.s_total_distance = Randoms.randomFakeName()
        obj.s_total_price = Randoms.randomFakeName()
        obj.s_type = Randoms.randomFakeName()
        obj.s_vehicle_color = Randoms.randomFakeName()
        obj.s_vehicle_color_code = Randoms.randomFakeName()
        obj.s_vehicle_model = Randoms.randomFakeName()
        obj.s_voice_url = Randoms.randomFakeName()
        obj.service_detail_name = Randoms.randomFakeName()
        obj.service_name = Randoms.randomFakeName()
        obj.total_price = Randoms.randomFakeName()
        return obj
    }
    static func demoArray()-> [TChatOrderObject]{
        var arr = [TChatOrderObject]()
        for _ in 1...GlobalConstants.API_PageSize {
            let obj = TChatOrderObject.demoObject()
            for _ in 1...GlobalConstants.API_PageSize {
                obj.chat.append(TChatObject.demoObject())
            }
            arr.append(obj)
        }
        return arr
    }
    #endif

}

#endif

/************************* Mo’min J.Abusaada *************************/
