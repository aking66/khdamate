//
//  ServiceProviderRequest.swift
//  khdamate
//
//  Created by Yaser on 12/12/2021.
//

import Foundation

class ProviderRequest: BaseRequest {
    
    var provider_id: String?
    
    public enum Route {
        case getProviders
        case getProvider(provider_id: NSNumber?)

    }
    
    private var route: Route
    
    private let paramKey_name: String = "name"
    private let paramKey_image: String = "image_url"
    private let paramKey_rate: String = "rate"
    private let paramKey_order_id: String = "order_id"

    init(_ route:Route) {
        self.route = route
    }
    
    override var url: String {
        switch self.route {
        case .getProviders:
            return GlobalConstants.API_Provider_getProviders_Controller
        case .getProvider:
            return GlobalConstants.API_Provider_getProvider_Controller + "/provider/\(provider_id ?? "error")"

        }
    }
    
    override var params: Dictionary<AnyHashable, Any> {
        var parmameters: Dictionary<AnyHashable, Any> = [:]
        switch self.route {
            
        case .getProviders:
            break
        case .getProvider(provider_id: _):
//            parmameters[paramKey_order_id] = provider_id
            break

        }
        return parmameters
    }
    
    override var type: BaseRequestHTTPMethod {
        switch self.route {
        case .getProviders:
            return .get
        case .getProvider(provider_id: _):
            return .get

        }
    }
    
    override var multiPartFiles: [BaseRequestFile] {
        let files = [BaseRequestFile]()
        switch self.route {
            
        case .getProviders:
            break
        case .getProvider(provider_id: _):
            break
        }
        return files
    }
}

