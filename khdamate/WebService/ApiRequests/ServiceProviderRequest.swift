//
//  ServiceProviderRequest.swift
//  khdamate
//
//  Created by Yaser on 12/12/2021.
//

import Foundation

class ServiceProviderRequest: BaseRequest {
    
    var order_id: String?
    
    public enum Route {
        case getNewOrders
        case getOrders(status: String?)
        case acceptOrder
        case processOrder(order_id: Int?)
        case finishOrder(order_id: Int?)
        case askToPay(order_id: Int?)
        case rejectOrder
        case changeStatus
        case enableNotifications
        case sendOffer(order_id: Int?, price: Int?, notes: String?)
        case sendFinalPrice(order_id: Int?, price: Int?)
        case sendWorkTime(order_id: Int?, date: String?, time: String?)
    }
    
    private var route: Route
    
    private let paramKey_status: String = "status"
    private let paramKey_order_id: String = "order_id"
    private let paramKey_price: String = "price"
    private let paramKey_notes: String = "notes"
    
    init(_ route:Route) {
        self.route = route
    }
    
    override var url: String {
        switch self.route {
        case .getNewOrders:
            return GlobalConstants.API_ServiceProvider_getNewOrders_Controller
        case .getOrders:
            return GlobalConstants.API_ServiceProvider_getOrders_Controller
        case .acceptOrder:
            return GlobalConstants.API_ServiceProvider_acceptOrder_Controller
        case .processOrder:
            return GlobalConstants.API_ServiceProvider_processOrder_Controller
        case .finishOrder:
            return GlobalConstants.API_ServiceProvider_finishOrder_Controller
        case .rejectOrder:
            return GlobalConstants.API_ServiceProvider_rejectOrder_Controller
        case .changeStatus:
            return GlobalConstants.API_ServiceProvider_changeStatus_Controller
        case .enableNotifications:
            return GlobalConstants.API_ServiceProvider_enableNotifications_Controller
        case .sendOffer:
            return GlobalConstants.API_sendOffer_Controller
        case .sendFinalPrice:
            return GlobalConstants.API_sendFinalPrice_Controller
        case .sendWorkTime:
            return GlobalConstants.API_sendWorkTime_Controller
        case .askToPay:
            return GlobalConstants.API_askToPay_Controller
        }
    }
    
    override var params: Dictionary<AnyHashable, Any> {
        var parmameters: Dictionary<AnyHashable, Any> = [:]
        switch self.route {
            
        case .getOrders(let status):
            parmameters[paramKey_status] = status
            break
        case .acceptOrder:
            parmameters[paramKey_order_id] = order_id
            break
        case .processOrder(let order_id):
            parmameters[paramKey_order_id] = order_id
            break
        case .finishOrder(let order_id):
            parmameters[paramKey_order_id] = order_id
            break
        case .rejectOrder:
            parmameters[paramKey_order_id] = order_id
            break
        case .getNewOrders, .enableNotifications, .changeStatus:
            break
        case let .sendOffer(order_id, price, notes):
            parmameters[paramKey_order_id] = order_id
            parmameters[paramKey_price] = price
            parmameters[paramKey_notes] = notes
            break
        case .sendFinalPrice(order_id: let order_id, price: let price):
            parmameters[paramKey_order_id] = order_id
            parmameters[paramKey_price] = price
            break
            
        case . sendWorkTime(order_id: let order_id, date: let date, time: let time):
            parmameters["date"] = date
            parmameters["time"] = time
            parmameters[paramKey_order_id] = order_id

            break
        case .askToPay(order_id: let order_id):
            parmameters[paramKey_order_id] = order_id
            break
        }
        return parmameters
    }
    
    override var type: BaseRequestHTTPMethod {
        switch self.route {
        case .getNewOrders:
            return .get
        case .getOrders:
            return .get
        case .acceptOrder:
            return .post
        case .processOrder:
            return .post
        case .finishOrder:
            return .post
        case .rejectOrder:
            return .post
        case .changeStatus:
            return .post
        case .enableNotifications:
            return .post
        case .sendOffer:
            return .post
        case .sendFinalPrice:
            return .post
        case .sendWorkTime:
            return .post
        case .askToPay:
            return .post
        }
    }
    
    override var multiPartFiles: [BaseRequestFile] {
        let files = [BaseRequestFile]()
        switch self.route {
            
        case .getNewOrders, .getOrders, .acceptOrder, .processOrder, .finishOrder, .rejectOrder, .changeStatus, .enableNotifications, .sendOffer, .sendFinalPrice,.sendWorkTime, .askToPay:
            break
        }
        return files
    }
}

