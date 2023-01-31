//
//  ContactRequest.swift
//  khdamate
//
//  Created by Yaser on 09/12/2021.
//


import Foundation

class ContactRequest: BaseRequest {
    
    public enum Route {
        case sendMessage(title: String?, contact_reason_id: Int?, message: String?, mobile: String?)
        case getContactInfo
    }
    
    private var route: Route
    
    private let paramKey_contact_reason_id: String = "contact_reason_id"
    private let paramKey_title: String = "title"
    private let paramKey_message: String = "message"
    private let paramKey_mobile: String = "mobile"
    
    init(_ route:Route) {
        self.route = route
    }
    
    override var url: String {
        switch self.route {
        case .sendMessage:
            return GlobalConstants.API_Contact_sendMessage_Controller
        case .getContactInfo:
            return GlobalConstants.API_Contact_getContactInfo_Controller
        }
    }
    
    override var params: Dictionary<AnyHashable, Any> {
        var parmameters: Dictionary<AnyHashable, Any> = [:]
        switch self.route {
            
        case let .sendMessage(title, contact_reason_id, message, mobile):
            parmameters[paramKey_contact_reason_id] = contact_reason_id
            parmameters[paramKey_title] = title
            parmameters[paramKey_message] = message
            parmameters[paramKey_mobile] = mobile
            break
        case .getContactInfo:
            break
        }
        return parmameters
    }
    
    override var type: BaseRequestHTTPMethod {
        switch self.route {
        case .sendMessage:
            return .post
        case .getContactInfo:
            return .get
        }
    }
    
    override var multiPartFiles: [BaseRequestFile] {
        var files = [BaseRequestFile]()
        switch self.route {
            
        case .sendMessage, .getContactInfo:
            break
        }
        return files
    }
}
