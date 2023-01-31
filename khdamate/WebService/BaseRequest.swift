/************************* Mo’min J.Abusaada *************************/
//
//  BaseRequest.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//

import UIKit

public enum BaseRequestHTTPMethod: String {
    case get
    case post
    case put
    case delete
}

class BaseRequest: NSObject {
    public var url : String {
        return ""
    }
    public var params : Dictionary<AnyHashable, Any>!{
        return nil
    }
    public var requestObject : Any! {
        return nil
    }
    public var type : BaseRequestHTTPMethod {
        return .get
    }
    public var responseReplacing : Dictionary<String, String>?{
        return nil
    }
    public var multiPartFiles : [BaseRequestFile] {
        return [BaseRequestFile]()
    }
    public var customHeadrs : [String:String]? {
        return nil
    }
}


class BaseRequestFile: NSObject {
    var fileData: Data
    var parameterName: String
    var fileName: String
    var mimeType: String
    init(fileData: Data, parameterName: String, fileName: String, mimeType: String? = nil) {
        self.fileData = fileData
        self.parameterName = parameterName
        self.fileName = fileName
        self.mimeType = mimeType ?? fileData.mimeType
        super.init()
    }
}
