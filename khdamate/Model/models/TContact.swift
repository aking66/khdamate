/************************* Mo’min J.Abusaada *************************/

import Foundation

#if canImport(RestKit)

@objc(TContact)
public class TContact: _TContact {
}

@objc(TContactObject)
public class TContactObject: _TContactObject {
}


#elseif canImport(Alamofire)

@objc(TContactObject)
public class TContactObject: _TContactObject {
}


#endif
/************************* Mo’min J.Abusaada *************************/