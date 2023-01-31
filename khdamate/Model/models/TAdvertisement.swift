/************************* Mo’min J.Abusaada *************************/

import Foundation

#if canImport(RestKit)

@objc(TAdvertisement)
public class TAdvertisement: _TAdvertisement {
}

@objc(TAdvertisementObject)
public class TAdvertisementObject: _TAdvertisementObject {
}


#elseif canImport(Alamofire)

@objc(TAdvertisementObject)
public class TAdvertisementObject: _TAdvertisementObject {
}


#endif
/************************* Mo’min J.Abusaada *************************/