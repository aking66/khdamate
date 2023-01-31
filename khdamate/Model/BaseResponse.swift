/************************* Mo’min J.Abusaada *************************/
//
//  BaseResponse.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//

import Foundation
import CoreData

#if canImport(Alamofire)
import Alamofire

@objc(BaseResponse)
public class BaseResponse: NSObject {
    
    public var pagination: Pagination?
    public var status: ResponceStatus?
    
//    public var productsArray = [TProductObject]()
    
    public var ordersObject: TChatOrderObject?
    public var orders = [TOrderObject]()
    public var order: TOrderObject?
    public var userObject: TUserObject?
    public var services = [TConstantObject]()
    public var cancelReasons = [TConstantObject]()
    public var complaintTypes = [TConstantObject]()
    public var orderOffers = [TOrderOfferObject]()
    public var tabOrders = [TTabOrderObject]()
    public var subServices = [TServiceObject]()
    public var searchResults = [TSearchResultObject]()
    public var financialSupportObject: TFinancialSupportObject?
    public var walkthrough = [TWalkthroughObject]()
    public var contactReasons = [TConstantObject]()
    public var socialLinks: TContactObject?
    public var notifications = [TNotificationObject]()
    public var providers = [TProviderObject]()
    public var provider: TProviderObject?
    public var calendarOrders = [TCalendarObject]()
    public var home: THomeObject?
    public var homeServicesObject = [TServiceObject]()
    public var homeSearchResults = [TServiceObject]()
    public var advertisements = [TAdvertisementObject]()
    public var terms: TTermsObject?
    public var paymentURL: TPaymentURLObject?
    public var privacy: TTermsObject?
    public var aboutUs: TTermsObject?
    public var contacInfo: TContactObject?
    public var prev_total_price: NSNumber?
    public var coupon_discount: NSNumber?
    public var total_price: NSNumber?
    public var media_path: String?
    
    init(_ json:NSDictionary) {
        super.init()
//        if let arr = json.value(forKeyPath: "Products") as? [[String:Any]]{
//            for dic in arr{
//                let value = TProductObject(fromDictionary: dic)
//                productsArray.append(value)
//            }
//        }
        if let result = json.value(forKeyPath: "result") as? NSDictionary {
            if let dic = result.value(forKeyPath: "data") as? NSDictionary {
                financialSupportObject = TFinancialSupportObject(fromDictionary: dic)
            }
            if let dic = result.value(forKeyPath: "prev_total_price") as? NSNumber {
                prev_total_price = dic
            }
            if let dic = result.value(forKeyPath: "coupon_discount") as? NSNumber {
                coupon_discount = dic
            }
            if let dic = result.value(forKeyPath: "total_price") as? NSNumber {
                total_price = dic
            }
            if let dic = result.value(forKeyPath: "media_path") as? String {
                media_path = dic
            }
        }
        if let dic = json.value(forKeyPath: "result") as? NSDictionary {
            order = TOrderObject(fromDictionary: dic)
        }
        if let dic = json.value(forKeyPath: "result") as? NSDictionary {
            paymentURL = TPaymentURLObject(fromDictionary: dic)
        }
        if let dic = json.value(forKeyPath: "result") as? NSDictionary {
            home = THomeObject(fromDictionary: dic)
        }
        if let dic = json.value(forKeyPath: "result") as? NSDictionary {
            contacInfo = TContactObject(fromDictionary: dic)
        }
        if let dic = json.value(forKeyPath: "result") as? NSDictionary {
            socialLinks = TContactObject(fromDictionary: dic)
        }
        if let dic = json.value(forKeyPath: "result") as? NSDictionary {
            ordersObject = TChatOrderObject(fromDictionary: dic)
        }
        if let dic = json.value(forKeyPath: "result") as? NSDictionary {
            terms = TTermsObject(fromDictionary: dic)
        }
        if let dic = json.value(forKeyPath: "result") as? NSDictionary {
            privacy = TTermsObject(fromDictionary: dic)
        }
        if let dic = json.value(forKeyPath: "result") as? NSDictionary {
            aboutUs = TTermsObject(fromDictionary: dic)
        }
        if let dic = json.value(forKeyPath: "result") as? NSDictionary {
            userObject = TUserObject(fromDictionary: dic)
        }
        if let arr = json.value(forKeyPath: "result.services") as? [NSDictionary] {
            for dic in arr{
                homeServicesObject.append(TServiceObject(fromDictionary: dic))
            }
        }
        if let arr = json.value(forKeyPath: "result.services") as? [NSDictionary] {
            for dic in arr{
                homeSearchResults.append(TServiceObject(fromDictionary: dic))
            }
        }
        if let arr = json.value(forKeyPath: "result") as? [NSDictionary] {
            for dic in arr{
                services.append(TConstantObject(fromDictionary: dic))
            }
        }
        if let arr = json.value(forKeyPath: "result") as? [NSDictionary] {
            for dic in arr{
                complaintTypes.append(TConstantObject(fromDictionary: dic))
            }
        }
        if let arr = json.value(forKeyPath: "result") as? [NSDictionary] {
            for dic in arr{
                cancelReasons.append(TConstantObject(fromDictionary: dic))
            }
        }
        if let arr = json.value(forKeyPath: "result") as? [NSDictionary] {
            for dic in arr{
                calendarOrders.append(TCalendarObject(fromDictionary: dic))
            }
        }
        if let arr = json.value(forKeyPath: "result.data") as? [NSDictionary] {
            for dic in arr{
                orderOffers.append(TOrderOfferObject(fromDictionary: dic))
            }
        }
        if let arr = json.value(forKeyPath: "result.data") as? [NSDictionary] {
            for dic in arr{
                notifications.append(TNotificationObject(fromDictionary: dic))
            }
        }
        if let arr = json.value(forKeyPath: "result") as? [NSDictionary] {
            for dic in arr{
                providers.append(TProviderObject(fromDictionary: dic))
            }
        }
        if let dic = json.value(forKeyPath: "result") as? NSDictionary {
                provider = TProviderObject(fromDictionary: dic)
        }
        if let arr = json.value(forKeyPath: "result") as? [NSDictionary] {
            for dic in arr{
                orders.append(TOrderObject(fromDictionary: dic))
            }
        }
        if let arr = json.value(forKeyPath: "result") as? [NSDictionary] {
            for dic in arr{
                subServices.append(TServiceObject(fromDictionary: dic))
            }
        }
        if let arr = json.value(forKeyPath: "result") as? [NSDictionary] {
            for dic in arr{
                tabOrders.append(TTabOrderObject(fromDictionary: dic))
            }
        }
        if let arr = json.value(forKeyPath: "result") as? [NSDictionary] {
            for dic in arr{
                searchResults.append(TSearchResultObject(fromDictionary: dic))
            }
        }
        if let arr = json.value(forKeyPath: "result.advs") as? [NSDictionary] {
            for dic in arr{
                advertisements.append(TAdvertisementObject(fromDictionary: dic))
            }
        }
        if let arr = json.value(forKeyPath: "result") as? [NSDictionary] {
            for dic in arr{
                walkthrough.append(TWalkthroughObject(fromDictionary: dic))
            }
        }
        if let arr = json.value(forKeyPath: "result") as? [NSDictionary] {
            for dic in arr{
                contactReasons.append(TConstantObject(fromDictionary: dic))
            }
        }
        if let dic = json.value(forKeyPath: "status") as? [String : Any] {
            status = ResponceStatus(fromDictionary: dic)
        }
        if let dic = json.value(forKeyPath: "pagination") as? [String : Any] {
            pagination = Pagination(fromDictionary: dic)
        }
    }
}

public class ResponceStatus: NSObject
{
    public var success: NSNumber?
    public var codeNumber: NSNumber?
    public var message: String?
    public var showMessage: Bool?
    
    init(fromDictionary dictionary: [String:Any]){
        success    = dictionary["success"] as? NSNumber
        codeNumber = dictionary["messageCode"] as? NSNumber
        message    = dictionary["otherTxt"] as? String
        showMessage    = dictionary["showMessage"] as? Bool
    }
}

public class Pagination: NSObject
{
    public var i_per_page: NSNumber?
    public var i_total_pages: NSNumber?
    public var i_total_objects: NSNumber?
    public var i_current_page: NSNumber?
    public var i_items_on_page: NSNumber?
    
    init(fromDictionary dictionary: [String:Any]){
        i_per_page      = dictionary["i_per_page"] as? NSNumber
        i_total_pages   = dictionary["i_total_pages"] as? NSNumber
        i_total_objects = dictionary["i_total_objects"] as? NSNumber
        i_current_page  = dictionary["i_current_page"] as? NSNumber
        i_items_on_page = dictionary["i_items_on_page"] as? NSNumber
    }
}



#elseif canImport(RestKit)
import RestKit

@objcMembers
public class BaseResponse: NSObject {
    public var pagination:Pagination?
    public var status: ResponceStatus?
    
    public var userID: NSNumber?
    
    
    public static func prepareMapping() -> RKObjectMapping{
        let BaseREsponseMapping = RKObjectMapping(for: BaseResponse.classForCoder())
        BaseREsponseMapping?.addAttributeMappings(from: [
            "data.UserId": "userID",
            ])
        
        BaseREsponseMapping?.addPropertyMapping(RKRelationshipMapping(fromKeyPath: "status", toKeyPath: "status", with: ResponceStatus.initMapping()))
        BaseREsponseMapping?.addPropertyMapping(RKRelationshipMapping(fromKeyPath: "pagination", toKeyPath: "pagination", with: Pagination.initMapping()))
        
        
        return BaseREsponseMapping!;
        
    }
    
}

@objcMembers
public class ResponceStatus: NSObject
{
    public var success: NSNumber?
    public var codeNumber: NSNumber?
    public var message: String?
    public var showMessage: NSNumber?
    
    public static func initMapping() -> RKObjectMapping {
        let StatusEsponseMapping = RKObjectMapping(for: ResponceStatus.classForCoder())
        StatusEsponseMapping?.addAttributeMappings(from: [
            "success": "success",
            "messageCode": "codeNumber",
            "otherTxt": "message",
            "showMessage": "showMessage",
            ])
        return StatusEsponseMapping!
    }
}

@objcMembers
public class Pagination: NSObject
{
    public var i_per_page: NSNumber?
    public var i_total_pages: NSNumber?
    public var i_total_objects: NSNumber?
    public var i_current_page: NSNumber?
    public var i_items_on_page: NSNumber?
    
    public static func initMapping() -> RKObjectMapping {
        let EPagination = RKObjectMapping(for: Pagination.classForCoder())
        EPagination?.addAttributeMappings(from: [
            "i_per_page": "i_per_page",
            "i_total_pages": "i_total_pages",
            "i_total_objects": "i_total_objects",
            "i_current_page": "i_current_page",
            "i_items_on_page": "i_items_on_page"
            ])
        return EPagination!
    }
}
#endif
