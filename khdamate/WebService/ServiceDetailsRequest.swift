//
//  ServiceDetailsRequest.swift
//  khdamate
//
//  Created by Yaser on 11/12/2021.
//

import Foundation

class ServiceDetailsRequest: BaseRequest {
    
    var paging_count: String?
    var page: String?
    
    public enum Route {
        case getServiceDetails(service_id: NSNumber?, paging_count: NSNumber?, page: NSNumber?, search: String?)
        case getFavorite(paging_count: NSNumber?, page: NSNumber?, search: String?)
        case addRomoveFavorite(id: NSNumber?)
        case searchServices(text: String?)
    }
    
    private var route: Route
    
    private let paramKey_service_id: String = "service_id"
    private let paramKey_search: String = "search"
    private let paramKey_paging_count: String = "paging_count"
    private let paramKey_page: String = "page"
    private let paramKey_id: String = "id"
    private let paramKey_text: String = "text"
    
    init(_ route:Route) {
        self.route = route
    }
    
    override var url: String {
        switch self.route {
        case .getServiceDetails:
            return GlobalConstants.API_ServiceDetails_getServiceDetails_Controller
        case .getFavorite:
            return GlobalConstants.API_ServiceDetails_getFavorite_Controller
        case .addRomoveFavorite:
            return GlobalConstants.API_ServiceDetails_addRomoveFavorite_Controller
        case .searchServices:
            return GlobalConstants.API_ServiceDetails_searchServices_Controller
        }
    }
    
    override var params: Dictionary<AnyHashable, Any> {
        var parmameters: Dictionary<AnyHashable, Any> = [:]
        switch self.route {
            
        case let .getServiceDetails(service_id, paging_count, page, search):
            parmameters[paramKey_search] = search
            parmameters[paramKey_service_id] = service_id
            parmameters[paramKey_paging_count] = paging_count
            parmameters[paramKey_page] = page
            break
        case let .getFavorite(paging_count, page, search):
            parmameters[paramKey_paging_count] = paging_count
            parmameters[paramKey_page] = page
            parmameters["search"] = search
            break
        case let .addRomoveFavorite(id):
            parmameters[paramKey_id] = id
            break
        case .searchServices(text: let text):
            parmameters[paramKey_paging_count] = 100
            parmameters[paramKey_page] = 1
            parmameters[paramKey_text] = text
        }
        return parmameters
    }
    
    override var type: BaseRequestHTTPMethod {
        switch self.route {
        case .getServiceDetails:
            return .get
        case .getFavorite:
            return .get
        case .addRomoveFavorite:
            return .post
        case .searchServices:
            return .get
        }
    }
    
    override var multiPartFiles: [BaseRequestFile] {
        var files = [BaseRequestFile]()
        switch self.route {
            
        case .getServiceDetails, .getFavorite, .addRomoveFavorite, .searchServices:
            break
        }
        return files
    }
}

