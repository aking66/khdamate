/************************* Mo’min J.Abusaada *************************/

import Foundation

#if canImport(RestKit)

@objc(TOffer)
public class TOffer: _TOffer {
}

@objc(TOfferObject)
public class TOfferObject: _TOfferObject {
}


#elseif canImport(Alamofire)

@objc(TOfferObject)
public class TOfferObject: _TOfferObject {
}


#endif
/************************* Mo’min J.Abusaada *************************/