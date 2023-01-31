/************************* Mo’min J.Abusaada *************************/

import Foundation

#if canImport(RestKit)

@objc(TSearchResult)
public class TSearchResult: _TSearchResult {
}

@objc(TSearchResultObject)
public class TSearchResultObject: _TSearchResultObject {
}


#elseif canImport(Alamofire)

@objc(TSearchResultObject)
public class TSearchResultObject: _TSearchResultObject {
}


#endif
/************************* Mo’min J.Abusaada *************************/