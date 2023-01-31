/************************* Mo’min J.Abusaada *************************/

import Foundation

#if canImport(RestKit)

@objc(TOrderOffer)
public class TOrderOffer: _TOrderOffer {
}

@objc(TOrderOfferObject)
public class TOrderOfferObject: _TOrderOfferObject {
}


#elseif canImport(Alamofire)

@objc(TOrderOfferObject)
public class TOrderOfferObject: _TOrderOfferObject {
}


#endif
/************************* Mo’min J.Abusaada *************************/