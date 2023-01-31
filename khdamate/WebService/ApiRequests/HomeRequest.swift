//
//  HomeRequest.swift
//  khdamate
//
//  Created by Yaser on 08/12/2021.
//

import Foundation

class HomeRequest: BaseRequest {
    
    
    public enum Route {
        case home
        case search(search: String?)
    }
    
    private var route: Route
    
    private let paramKey_search: String = "search"
    
    init(_ route:Route) {
        self.route = route
    }
    
    override var url: String {
        switch self.route {
        case .home:
            return GlobalConstants.API_Contact_home_Controller
        case .search:
            return GlobalConstants.API_Contact_home_Controller
        }
    }
    
    override var params: Dictionary<AnyHashable, Any> {
        var parmameters: Dictionary<AnyHashable, Any> = [:]
        switch self.route {
        case .home:
            break
        case let .search(search):
            parmameters[paramKey_search] = search
            break
        }
        return parmameters
    }
    
    override var type: BaseRequestHTTPMethod {
        switch self.route {
        case .home:
            return .get
        case .search:
            return .get
        }
    }
    
    override var multiPartFiles: [BaseRequestFile] {
        var files = [BaseRequestFile]()
        switch self.route {
        case .home, .search:
            break
        }
        return files
    }
}
