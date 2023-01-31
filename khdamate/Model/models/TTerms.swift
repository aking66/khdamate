/************************* Mo’min J.Abusaada *************************/

import Foundation

#if canImport(RestKit)

@objc(TTerms)
public class TTerms: _TTerms {
}

@objc(TTermsObject)
public class TTermsObject: _TTermsObject {
}


#elseif canImport(Alamofire)

@objc(TTermsObject)
public class TTermsObject: _TTermsObject {
}


#endif
/************************* Mo’min J.Abusaada *************************/