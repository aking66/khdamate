/************************* Mo’min J.Abusaada *************************/

import Foundation

#if canImport(RestKit)

@objc(TPaymentURL)
public class TPaymentURL: _TPaymentURL {
}

@objc(TPaymentURLObject)
public class TPaymentURLObject: _TPaymentURLObject {
}


#elseif canImport(Alamofire)

@objc(TPaymentURLObject)
public class TPaymentURLObject: _TPaymentURLObject {
}


#endif
/************************* Mo’min J.Abusaada *************************/