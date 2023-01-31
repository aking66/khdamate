//
//  OrderRequest.swift
//  khdamate
//
//  Created by Yaser on 12/12/2021.
//

import Foundation
import UIKit

class OrderRequest: BaseRequest {
    
    var city_id: String?
    var photos: [UIImage]?
    var order_id: String?
    var cancel_reason_id: String?
    var text: String?
//    var rate: String?
    var month: String?
    var coupon_code: String?
    
    public enum Route {
        case addOrder(service_detail_id: String?, descriptionValue: String?, full_address: String?, order_date: String?, order_time: String?, order_type: String, images: [UIImage]?,media:Data?)
        case cancelOrder(order_id:NSNumber?,cancel_reason_id:NSNumber?, cancel_reason_text: String?)
        case payOrder(order_id: NSNumber?)
        case confirmFinishOrder(order_id: NSNumber?)
        case confirmOrder
        case addOrderIssue(order_id: NSNumber?, text: String?)
        case getOrder(order_id: NSNumber?)
        case reOrder(order_id: NSNumber?)
        case checkPayment(order_id: NSNumber?)
        case getPaymentUrl(order_id: NSNumber?)
        case addCoupon(order_id: NSNumber?, coupon_code: String?)
        case rate(order_id: NSNumber?, rate: NSNumber?, text: String?)
        case getOrders(status: String?)
        case getOrdersOffers
        case getOrderOffers
        case getOrdersByDate(order_date: String?)
        case getOrdersByMonth
        case getPaymentsWays
        case acceptOffer(offer_id: Int?)
        case rejectOffer(offer_id: Int?)
        case answerFinalPrice(order_id: Int?, is_accepted: Int?)
        case answerWorkTime(order_id: Int?, is_accepted: Int?)
    }
    
    private var route: Route
    
    private let paramKey_service_detail_id: String = "service_detail_id"
    private let paramKey_city_id: String = "city_id"
    private let paramKey_description: String = "description"
    private let paramKey_photos: String = "photos"
    private let paramKey_files: String = "files"
    private let paramKey_full_address: String = "full_address"
    private let paramKey_latitude: String = "latitude"
    private let paramKey_longitude: String = "longitude"
    private let paramKey_order_date: String = "order_date"
    private let paramKey_order_time: String = "order_time"
    private let paramKey_service_type: String = "service_type"
    private let paramKey_order_id: String = "order_id"
    private let paramKey_cancel_reason_id: String = "cancel_reason_id"
    private let paramKey_cancel_reason_text: String = "cancel_reason_text"
    private let paramKey_text: String = "text"
    private let paramKey_rate: String = "rate"
    private let paramKey_status: String = "status"
    private let paramKey_month: String = "month"
    private let paramKey_coupon_code: String = "coupon_code"
    private let paramKey_price: String = "price"
    private let paramKey_offer_id: String = "offer_id"
    private let paramKey_is_accepted: String = "is_accepted"
    
    init(_ route:Route) {
        self.route = route
    }
    
    override var url: String {
        switch self.route {
        case .addOrder:
            return GlobalConstants.API_Order_addOrder_Controller
        case .cancelOrder:
            return GlobalConstants.API_Order_cancelOrder_Controller
        case .payOrder:
            return GlobalConstants.API_Order_payOrder_Controller
        case .confirmOrder:
            return GlobalConstants.API_Order_confirmOrder_Controller
        case .addOrderIssue:
            return GlobalConstants.API_Order_addOrderIssue_Controller
        case .getOrder:
            return GlobalConstants.API_Order_getOrder_Controller
        case .rate:
            return GlobalConstants.API_Order_rate_Controller
        case .getOrders:
            return GlobalConstants.API_Order_getOrders_Controller
        case .getOrdersByDate:
            return GlobalConstants.API_Order_getOrdersByDate_Controller
        case .getOrdersByMonth:
            return GlobalConstants.API_Order_getOrdersByMonth_Controller
        case .getPaymentsWays:
            return GlobalConstants.API_paymentMethods_Controller
        case .addCoupon:
            return GlobalConstants.API_addCoupon_Controller
        case .reOrder:
            return GlobalConstants.API_reOrder_Controller
        case .getOrdersOffers:
            return GlobalConstants.API_getOrdersOffers_Controller
        case .getOrderOffers:
            return GlobalConstants.API_getOrderOffers_Controller
        case .acceptOffer:
            return GlobalConstants.API_acceptOffer_Controller
        case .rejectOffer:
            return GlobalConstants.API_rejectOffer_Controller
        case .answerFinalPrice:
            return GlobalConstants.API_answerFinalPrice_Controller
        case .answerWorkTime:
            return GlobalConstants.API_answerWorkTime_Controller
        case .confirmFinishOrder:
            return GlobalConstants.API_confirmFinishOrder_Controller
        case .getPaymentUrl:
            return GlobalConstants.API_getPaymentUrl_Controller
        case .checkPayment:
            return GlobalConstants.API_checkPayment_Controller
        }
    }
    
    override var params: Dictionary<AnyHashable, Any> {
        var parmameters: Dictionary<AnyHashable, Any> = [:]
        switch self.route {
            
        case let .addOrder(service_detail_id, descriptionValue, full_address, order_date, order_time,order_type, _,_):
            parmameters[paramKey_service_detail_id] = service_detail_id
//            parmameters[paramKey_city_id] = city_id
            parmameters[paramKey_description] = descriptionValue
            parmameters[paramKey_full_address] = full_address
//            parmameters[paramKey_latitude] = latitude
//            parmameters[paramKey_longitude] = longitude
            parmameters[paramKey_order_date] = order_date
            parmameters[paramKey_order_time] = order_time
            parmameters[paramKey_service_type] = order_type
          //  parmameters[paramKey_photos] = photos
            break
        case let .cancelOrder(order_id, cancel_reason_id, cancel_reason_text):
            parmameters[paramKey_order_id] = order_id
            parmameters[paramKey_cancel_reason_id] = cancel_reason_id
            parmameters[paramKey_cancel_reason_text] = cancel_reason_text
            break
        case .payOrder(let order_id):
            parmameters[paramKey_order_id] = order_id
            break
        case .confirmOrder:
            parmameters[paramKey_order_id] = order_id
            break
        case let .addOrderIssue(order_id, text):
            parmameters[paramKey_order_id] = order_id
            parmameters[paramKey_text] = text
            break
        case .getOrder(let order_id):
            parmameters[paramKey_order_id] = order_id
            break
        case let .rate(order_id, rate, text):
            parmameters[paramKey_order_id] = order_id
            parmameters[paramKey_rate] = rate
            parmameters[paramKey_text] = text
            break
        case .getOrders(let status):
            parmameters[paramKey_status] = status
            break
        case let .getOrdersByDate(order_date):
            parmameters[paramKey_order_date] = order_date
            break
        case .getOrdersByMonth:
            parmameters[paramKey_month] = month
            break
        case .getPaymentsWays:
            break
        case let .addCoupon(order_id, coupon_code):
            parmameters[paramKey_order_id] = order_id
            parmameters[paramKey_coupon_code] = coupon_code
        case let .reOrder(order_id):
            parmameters[paramKey_order_id] = order_id
        case .getOrdersOffers:
            break
        case .getOrderOffers:
            parmameters[paramKey_order_id] = order_id
        case .acceptOffer(offer_id: let offer_id):
            parmameters[paramKey_offer_id] = offer_id
        case .rejectOffer(offer_id: let offer_id):
            parmameters[paramKey_offer_id] = offer_id
        case .answerFinalPrice(order_id: let order_id, is_accepted: let is_accepted):
            parmameters[paramKey_order_id] = order_id
            parmameters[paramKey_is_accepted] = is_accepted
        case .answerWorkTime(order_id: let order_id, is_accepted: let is_accepted):
            parmameters[paramKey_order_id] = order_id
            parmameters[paramKey_is_accepted] = is_accepted
        case .confirmFinishOrder(order_id: let order_id):
            parmameters[paramKey_order_id] = order_id
        case .getPaymentUrl(order_id: let order_id):
            parmameters[paramKey_order_id] = order_id
        case .checkPayment(order_id: let order_id):
            parmameters[paramKey_order_id] = order_id
        }
        return parmameters
    }
    
    override var type: BaseRequestHTTPMethod {
        switch self.route {
        case .addOrder:
            return .post
        case .cancelOrder:
            return .post
        case .payOrder:
            return .post
        case .confirmOrder:
            return .post
        case .addOrderIssue:
            return .post
        case .getOrder:
            return .get
        case .rate:
            return .post
        case .getOrders:
            return .get
        case .getOrdersByDate:
            return .get
        case .getOrdersByMonth:
            return .get
        case .getPaymentsWays:
            return .get
        case .addCoupon:
            return .post
        case .reOrder:
            return .post
        case .getOrdersOffers:
            return .get
        case .getOrderOffers:
            return .get
        case .acceptOffer:
            return .post
        case .rejectOffer:
            return .post
        case .answerFinalPrice:
            return .post
        case .answerWorkTime:
            return .post
        case .confirmFinishOrder:
            return .post
        case .getPaymentUrl:
            return .get
        case .checkPayment:
            return .get
        }
    }
    
    override var multiPartFiles: [BaseRequestFile] {
        var files = [BaseRequestFile]()
        switch self.route {
        case .addOrder(_, _, _, _, _, _, let images,let audio):
            guard let arrImages = images else { return [] }
            for (index, image) in (arrImages).enumerated() {
                if let data = image.jpegData(compressionQuality: 0) {
                    files.append(BaseRequestFile.init(fileData: data, parameterName: paramKey_files+"[\(index)]" , fileName: paramKey_files + "[\(index)]"+".png"))
                }
            }
            if let dataImage = audio {
                files.append(BaseRequestFile(fileData: dataImage, parameterName: "audio_description", fileName: "audio.mp3"))
            }
    

        case .cancelOrder, .getPaymentsWays, .payOrder, .confirmOrder, .addOrderIssue, .getOrder, .rate, .reOrder, .getOrders, .getOrdersByDate, .addCoupon, .getOrdersByMonth, .getOrderOffers, .getOrdersOffers, .acceptOffer, .rejectOffer, .answerFinalPrice, .confirmFinishOrder, .getPaymentUrl, .checkPayment,.answerWorkTime:
            break
        }
        return files
    }
}
