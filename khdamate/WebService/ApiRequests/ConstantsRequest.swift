//
//  ConstantsRequest.swift
//  khdamate
//
//  Created by Yaser on 08/12/2021.
//

import Foundation
import UIKit


class ConstantsRequest: BaseRequest {
    
    var city_id: String?
    
    public enum Route {
        case getContactReasons
        case getCancelOrderReasons
        case getServices
        case getServiceDetails(service_id: NSNumber?)
        case getTermsAndConditions
        case getPrivacyPolicy
        case getAboutUs
        case getWalkthrough
        case getComplaintTypes
        case getSocailLinks
    }
    
    private var route: Route
    
    private let paramKey_service_id: String = "service_id"
    
    init(_ route:Route) {
        self.route = route
    }
    
    override var url: String {
        switch self.route {
        case .getContactReasons:
            return GlobalConstants.API_Constants_getContactReasons_Controller
        case .getCancelOrderReasons:
            return GlobalConstants.API_Constants_getCancelOrderReasons_Controller
        case .getServices:
            return GlobalConstants.API_Constants_getServices_Controller
        case .getServiceDetails:
            return GlobalConstants.API_Constants_getServiceDetails_Controller
        case .getTermsAndConditions:
            return GlobalConstants.API_Constants_getTermsAndConditions_Controller
        case .getPrivacyPolicy:
            return GlobalConstants.API_Constants_getPrivacyPolicy_Controller
        case .getAboutUs:
            return GlobalConstants.API_Constants_getAboutUs_Controller
        case .getWalkthrough:
            return GlobalConstants.API_Constants_getWalkthrough_Controller
        case .getComplaintTypes:
            return GlobalConstants.API_Constants_getComplaintTypes_Controller
        case .getSocailLinks:
            return GlobalConstants.API_Constants_getSocailLinks_Controller
        }
    }
    
    override var params: Dictionary<AnyHashable, Any> {
        var parmameters: Dictionary<AnyHashable, Any> = [:]
        switch self.route {
            
        case .getServices:
            break
        case let .getServiceDetails(service_id):
            parmameters[paramKey_service_id] = service_id
            break
        case .getWalkthrough, .getContactReasons, .getAboutUs, .getPrivacyPolicy, .getTermsAndConditions, .getCancelOrderReasons, .getComplaintTypes, .getSocailLinks:
            break
        }
        return parmameters
    }
    
    override var type: BaseRequestHTTPMethod {
        switch self.route {
        case .getContactReasons:
            return .get
        case .getCancelOrderReasons:
            return .get
        case .getServices:
            return .get
        case .getServiceDetails:
            return .get
        case .getTermsAndConditions:
            return .get
        case .getPrivacyPolicy:
            return .get
        case .getAboutUs:
            return .get
        case .getWalkthrough:
            return .get
        case .getComplaintTypes:
            return .get
        case .getSocailLinks:
            return .get
        }
    }
    
    override var multiPartFiles: [BaseRequestFile] {
        var files = [BaseRequestFile]()
        switch self.route {
            
        case .getContactReasons, .getCancelOrderReasons, .getServices, .getServiceDetails, .getTermsAndConditions, .getPrivacyPolicy, .getAboutUs, .getWalkthrough, .getComplaintTypes, .getSocailLinks:
            break
        }
        return files
    }
}
