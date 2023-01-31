/************************* Mo’min J.Abusaada *************************/
//
//  OrderRequest.swift
//  Done
//
//  Created by Mo'min J.Abusaada on 13/02/2021.
//

import UIKit

enum OrderRequestStatus:String {
    case accepted
    case rejected
    case completed
    case submitted
}
enum OrderIssueType:String {
    case complaint
    case compensation
}
enum DriverOrdersPaymentType:String {
    case online
    case cash
    
    var s_title:String {
        switch self {
            case .online:
                return "BalanceVC_lblOnlineOrders_text".localize_
            case .cash:
                return "BalanceVC_lblCashOrders_text".localize_
        }
    }
}
enum OrderPaymentOperation:String {
    case pay_order
    case pay_cancelled
    case support
    case pay_app_profit
    case subscription
}

class ChatOrderRequest: BaseRequest {

    public enum Route {
        case offersHistory
        case list(status:OrderRequestStatus?)
        case driverList(status:OrderRequestStatus?, ordersPaymentType: DriverOrdersPaymentType? = nil)
        case paymentsWays
        case add(service_provider_id:NSNumber?,
                 notes:String?,
                 audio:Data?,
                 payment_way_id:NSNumber?,
                 save_new_address:Bool,
                 full_address:String?,
                 pickup_latitude:String?,
                 pickup_longitude:String?)
        case offers(order_id:NSNumber?)
        case rejectOffer(offer_id:NSNumber?)
        case cancelOrder(order_id:NSNumber?,cancel_reason_id:NSNumber?)
        case acceptOffer(offer_id:NSNumber?)
        case getOffer(offer_id:NSNumber?)
        case driverNewOrders
        case driverOrdersOffers
        case driverCancelOffer(order_id:NSNumber?)
        case driverGetOffer(offer_id:NSNumber?)
        case driverGetOrder(order_id:NSNumber?)
        case driverRejectOrder(order_id:NSNumber?)
        case driverSubmitOffer(order_id:NSNumber?,price:String?)
        case orderSummary(order_id:NSNumber?,without_chat:NSNumber?)
        case sendMessage(order_id:NSNumber?,type:ChatType?,media:Data?,text:String?)
        case driverOnTheWay(order_id:NSNumber?)
        case driverArrivedToProvider(order_id:NSNumber?)
        case driverChangeDeliveryOffer(order_id:NSNumber?,price:String?)
        case driverAddInvoice(order_id:NSNumber?,price:String?,invoice_photo:UIImage?,invoice_text:String?)
        case checkCoupon(order_id:NSNumber?,coupon_code:String?)
        case acceptInvoice(order_id:NSNumber?,is_accepted:NSNumber?,coupon_code:String?,payment_way_id:NSNumber?)
        case driverFinancialSupport(order_id:NSNumber?,amount:String?,face_photo:UIImage?,id_no:String?,mobile:String?,verification_code:String?)
        case driverFinancialSupportDetails(order_id:NSNumber?)
        case driverAcceptFinancialSupport(order_id:NSNumber?,status:NSNumber?)
        case driverArrived(order_id:NSNumber?)
        case driverFinishOrder(order_id:NSNumber?)
        case driverRateOrder(order_id:NSNumber?,rate:NSNumber?)
        case reOrder(order_id:NSNumber?)
        case completeOrder(order_id:NSNumber?)
        case driverAddOrderIssue(order_id:NSNumber?,type:OrderIssueType?,text:String?)
        case paymentInitCheckout(order_id:NSNumber?,amount:NSNumber?,type:TPaymentWayType?,operation:OrderPaymentOperation?)
        case paymentCheck(order_id:NSNumber?,type:TPaymentWayType?,transaction_id:String?,operation:OrderPaymentOperation?)
        case driverPurchaseDone(order_id:NSNumber?)

    }
    private var route:Route
    
    init(_ route:Route) {
        self.route = route
    }

    override var url : String {
        switch self.route {
        case .offersHistory:
            return GlobalConstants.API_Order_offersHistory_Controller
        case .list:
            return GlobalConstants.API_Order_list_Controller
        case .paymentsWays:
            return GlobalConstants.API_Order_paymentsWays_Controller
        case .add:
            return GlobalConstants.API_Order_add_Controller
        case .offers:
            return GlobalConstants.API_Order_offers_Controller
        case .rejectOffer:
            return GlobalConstants.API_Order_rejectOffer_Controller
        case .cancelOrder:
            return GlobalConstants.API_Order_cancelOrder_Controller
        case .acceptOffer:
            return GlobalConstants.API_Order_acceptOffer_Controller
        case .getOffer:
            return GlobalConstants.API_Order_getOffer_Controller
        case .driverNewOrders:
            return GlobalConstants.API_Order_driverNewOrders_Controller
        case .driverOrdersOffers:
            return GlobalConstants.API_Order_driverOrdersOffers_Controller
        case .driverCancelOffer:
            return GlobalConstants.API_Order_driverCancelOffer_Controller
        case .driverGetOffer:
            return GlobalConstants.API_Order_driverGetOffer_Controller
        case .driverGetOrder:
            return GlobalConstants.API_Order_driverGetOrder_Controller
        case .driverRejectOrder:
            return GlobalConstants.API_Order_driverRejectOrder_Controller
        case .driverSubmitOffer:
            return GlobalConstants.API_Order_driverSubmitOffer_Controller
        case .driverList:
            return GlobalConstants.API_Order_driverList_Controller
        case .orderSummary:
            return GlobalConstants.API_Order_orderSummary_Controller
        case .sendMessage:
            return GlobalConstants.API_Order_sendMessage_Controller
        case .driverOnTheWay:
            return GlobalConstants.API_Order_driverOnTheWay_Controller
        case .driverArrivedToProvider:
            return GlobalConstants.API_Order_driverArrivedToProvider_Controller
        case .driverChangeDeliveryOffer:
            return GlobalConstants.API_Order_driverChangeDeliveryOffer_Controller
        case .driverAddInvoice:
            return GlobalConstants.API_Order_driverAddInvoice_Controller
        case .checkCoupon:
            return GlobalConstants.API_Order_checkCoupon_Controller
        case .acceptInvoice:
            return GlobalConstants.API_Order_acceptInvoice_Controller
        case .driverFinancialSupport:
            return GlobalConstants.API_Order_driverFinancialSupport_Controller
        case .driverFinancialSupportDetails:
            return GlobalConstants.API_Order_driverFinancialSupportDetails_Controller
        case .driverAcceptFinancialSupport:
            return GlobalConstants.API_Order_driverAcceptFinancialSupport_Controller
        case .driverArrived:
            return GlobalConstants.API_Order_driverArrived_Controller
        case .driverFinishOrder:
            return GlobalConstants.API_Order_driverFinishOrder_Controller
        case .driverRateOrder:
            return GlobalConstants.API_Order_driverRateOrder_Controller
        case .reOrder:
            return GlobalConstants.API_Order_reOrder_Controller
        case .completeOrder:
            return GlobalConstants.API_Order_completeOrder_Controller
        case .driverAddOrderIssue:
            return GlobalConstants.API_Order_driverAddOrderIssue_Controller
        case .paymentInitCheckout:
            return GlobalConstants.API_Order_paymentInitCheckout_Controller
        case .paymentCheck:
            return GlobalConstants.API_Order_paymentCheck_Controller
        case .driverPurchaseDone:
            return GlobalConstants.API_Order_driverPurchaseDone_Controller
        }
    }
    override var params : Dictionary<AnyHashable, Any> {
        var parmameters : Dictionary<AnyHashable, Any> = [:]
        switch self.route {
        case .offersHistory,.paymentsWays,.driverNewOrders,.driverOrdersOffers:
            parmameters[""] = ""
            break
        case .list(status: let status):
            parmameters["status"] = status?.rawValue
            break
        case let .driverList(status,ordersPaymentType):
            parmameters["status"] = status?.rawValue
            parmameters["payment_type"] = ordersPaymentType?.rawValue
            break
        case let .add(service_provider_id,
                      notes,_,
                      payment_way_id,
                      save_new_address,
                      full_address,
                      pickup_latitude,
                      pickup_longitude):
            parmameters["service_provider_id"] = service_provider_id
            parmameters["notes"] = notes
            parmameters["payment_way_id"] = payment_way_id
            parmameters["save_new_address"] = save_new_address
            parmameters["full_address"] = full_address
            parmameters["pickup_latitude"] = pickup_latitude
            parmameters["pickup_longitude"] = pickup_longitude
            break
        case let .offers(order_id):
            parmameters["order_id"] = order_id
            break
        case let .rejectOffer(offer_id):
            parmameters["offer_id"] = offer_id
            break
        case let .cancelOrder(order_id, cancel_reason_id):
            parmameters["order_id"] = order_id
            parmameters["cancel_reason_id"] = cancel_reason_id
           // parmameters["confirm"] = confirm
            break
        case let .acceptOffer(offer_id):
            parmameters["offer_id"] = offer_id
            break
        case let .getOffer(offer_id):
            parmameters["offer_id"] = offer_id
            break
        case let .driverCancelOffer(order_id):
            parmameters["order_id"] = order_id
            break
        case let .driverGetOffer(offer_id):
            parmameters["offer_id"] = offer_id
            break
        case let .driverGetOrder(order_id):
            parmameters["order_id"] = order_id
            break
        case let .driverRejectOrder(order_id):
            parmameters["order_id"] = order_id
            break
        case let .driverSubmitOffer(order_id,price):
            parmameters["order_id"] = order_id
            parmameters["price"] = price
            break
        case let .orderSummary(order_id,without_chat):
            parmameters["order_id"] = order_id
            parmameters["without_chat"] = without_chat
            break
        case let .sendMessage(order_id, type, _, text):
            parmameters["order_id"] = order_id
            parmameters["type"] = type?.rawValue
            parmameters["text"] = text
            break
        case let .driverOnTheWay(order_id):
            parmameters["order_id"] = order_id
            break
        case let .driverArrivedToProvider(order_id):
            parmameters["order_id"] = order_id
            break
        case let .driverChangeDeliveryOffer(order_id,price):
            parmameters["order_id"] = order_id
            parmameters["price"] = price
            break
        case let .driverAddInvoice(order_id,price,_,invoice_text):
            parmameters["order_id"] = order_id
            parmameters["price"] = price
            parmameters["invoice_text"] = invoice_text
            break
        case let .checkCoupon(order_id, coupon_code):
            parmameters["order_id"] = order_id
            parmameters["coupon_code"] = coupon_code
            break
        case let .acceptInvoice(order_id,is_accepted,coupon_code,payment_way_id):
            parmameters["order_id"] = order_id
            parmameters["is_accepted"] = is_accepted
            parmameters["coupon_code"] = coupon_code
            parmameters["payment_way_id"] = payment_way_id
            break
        case let .driverFinancialSupport(order_id,amount,_,id_no,mobile,verification_code):
            parmameters["order_id"] = order_id
            parmameters["amount"] = amount
            parmameters["id_no"] = id_no
            parmameters["mobile"] = mobile
            parmameters["verification_code"] = verification_code
            break
        case let .driverFinancialSupportDetails(order_id):
            parmameters["order_id"] = order_id
            break
        case let .driverAcceptFinancialSupport(order_id,status):
            parmameters["order_id"] = order_id
            parmameters["status"] = status
            break
        case let .driverArrived(order_id):
            parmameters["order_id"] = order_id
            break
        case let .driverFinishOrder(order_id):
            parmameters["order_id"] = order_id
            break
        case let .driverRateOrder(order_id,rate):
            parmameters["order_id"] = order_id
            parmameters["rate"] = rate
            break
        case let .reOrder(order_id):
            parmameters["order_id"] = order_id
            break
        case let .completeOrder(order_id):
            parmameters["order_id"] = order_id
            break
        case let .driverAddOrderIssue(order_id,type,text):
            parmameters["order_id"] = order_id
            parmameters["type"] = type?.rawValue
            parmameters["text"] = text
            break
        case let .paymentInitCheckout(order_id,amount,type,operation):
            parmameters["order_id"] = order_id
            parmameters["total_debit"] = amount
            parmameters["type"] = type?.rawValue
            parmameters["operation"] = operation?.rawValue
            break
        case let .paymentCheck(order_id,type,transaction_id,operation):
            parmameters["order_id"] = order_id
            parmameters["type"] = type?.rawValue
            parmameters["transaction_id"] = transaction_id
            parmameters["operation"] = operation?.rawValue
            break
        case let .driverPurchaseDone(order_id):
            parmameters["order_id"] = order_id
            break
        }
        return parmameters

    }
//    override var requestObject : Any {
//        return nil
//    }
    override var type : BaseRequestHTTPMethod {
        switch self.route {
        case .offersHistory,.list,.paymentsWays,.offers,.getOffer,.driverNewOrders,.driverOrdersOffers,.driverGetOffer,.driverGetOrder,.driverList,.orderSummary,.driverFinancialSupportDetails:
            return .get
        case .add,.rejectOffer,.cancelOrder,.acceptOffer,.driverCancelOffer,.driverSubmitOffer,.driverRejectOrder,.sendMessage,.driverOnTheWay,.driverArrivedToProvider,.driverChangeDeliveryOffer,.driverAddInvoice,.checkCoupon,.acceptInvoice,.driverFinancialSupport,.driverAcceptFinancialSupport,.driverArrived,.driverFinishOrder,.driverRateOrder,.reOrder,.completeOrder,.driverAddOrderIssue,.paymentInitCheckout,.paymentCheck,.driverPurchaseDone:
            return .post
        }
    }
//    override var responseReplacing: Dictionary<String, String>?{
//        return ["data":"users"]
//    }
    override var multiPartFiles: [BaseRequestFile] {
        switch self.route {
            case let .add(_,_,audio,_,_,_,_,_):
                if let dataImage = audio {
                    return [BaseRequestFile(fileData: dataImage, parameterName: "audio", fileName: "audio.mp3")]
                }
                break
            case let .sendMessage(_,type,media,_):
                if let dataImage = media {
                    var mediaFileName = "media.mp3"
                    if type == .voice {
                        mediaFileName = "media.mp3"
                    }else if type == .photo {
                        mediaFileName = "media.png"
                    }else if type == .file {
                        mediaFileName = "media.pdf"
                    }
                    return [BaseRequestFile(fileData: dataImage, parameterName: "media", fileName: mediaFileName)]
                }
                break
            case let .driverAddInvoice(_,_,image,_):
            if let dataImage = image?.jpegData(compressionQuality: 0.25) {
                    return [BaseRequestFile(fileData: dataImage, parameterName: "invoice_photo", fileName: "invoice_photo.png")]
                }
                break
            case let .driverFinancialSupport(_,_,face_photo,_,_,_):
            if let dataImage = face_photo?.jpegData(compressionQuality: 0.25) {
                    return [BaseRequestFile(fileData: dataImage, parameterName: "face_photo", fileName: "face_photo.png")]
                }
                break
            default:
                break
        }
        return []
    }
    override var customHeadrs: [String : String]?{
//        switch self.route {
//            case let .add(_,address,_,_,_,_,_,_,_,_):
//                var parmameters:[String : String] = [:]
//                parmameters["lat"] = address?.s_lat
//                parmameters["long"] = address?.s_long
//                return parmameters
//            default:
//                break
//        }
        return nil
    }
}
