/************************* Mo’min J.Abusaada *************************/

import Foundation

#if canImport(RestKit)

@objc(TFinancialSupport)
public class TFinancialSupport: _TFinancialSupport {
}

@objc(TFinancialSupportObject)
public class TFinancialSupportObject: _TFinancialSupportObject {
}


#elseif canImport(Alamofire)

@objc(TFinancialSupportObject)
public class TFinancialSupportObject: _TFinancialSupportObject {
}


#endif
/************************* Mo’min J.Abusaada *************************/