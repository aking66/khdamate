//
//  NotificationRequest.swift
//  khdamate
//
//  Created by Yaser on 08/12/2021.
//

import Foundation
import UIKit

class NotificationsRequest: BaseRequest {
    
    var registration_id: String?
    var message: String?
    var category: String?
    var reference_id: String?
    
    public enum Route {
        case updateRegistrationId
        case sendNotification
        case testNotification
        case notifications
    }
    
    private var route: Route
    
    private let paramKey_registration_id: String = "registration_id"
    private let paramKey_message: String = "message"
    private let paramKey_category: String = "category"
    private let paramKey_reference_id: String = "reference_id"
    
    init(_ route:Route) {
        self.route = route
    }
    
    override var url: String {
        switch self.route {
        case .updateRegistrationId:
            return GlobalConstants.API_Notifications_updateRegistrationId_Controller
        case .sendNotification:
            return GlobalConstants.API_Notifications_sendNotification_Controller
        case .testNotification:
            return GlobalConstants.API_Notifications_testNotification_Controller
        case .notifications:
            return GlobalConstants.API_Notifications_notifications_Controller
        }
    }
    
    override var params: Dictionary<AnyHashable, Any> {
        var parmameters: Dictionary<AnyHashable, Any> = [:]
        switch self.route {
            
        case .updateRegistrationId:
            parmameters[paramKey_registration_id] = registration_id
            break
        case .sendNotification:
            parmameters[paramKey_message] = message
            parmameters[paramKey_category] = category
            parmameters[paramKey_reference_id] = reference_id
            break
        case .testNotification:
            parmameters[paramKey_message] = message
            parmameters[paramKey_registration_id] = registration_id
            break
        case .notifications:
            break
        }
        return parmameters
    }
    
    override var type: BaseRequestHTTPMethod {
        switch self.route {
        case .updateRegistrationId:
            return .put
        case .sendNotification:
            return .post
        case .testNotification:
            return .post
        case .notifications:
            return .get
        }
    }
    
    override var multiPartFiles: [BaseRequestFile] {
        var files = [BaseRequestFile]()
        switch self.route {
            
        case .updateRegistrationId, .sendNotification, .testNotification, .notifications:
            break
        }
        return files
    }
}
