/************************* Mo’min J.Abusaada *************************/

import Foundation

#if canImport(RestKit)

@objc(TTabOrder)
public class TTabOrder: _TTabOrder {
}

@objc(TTabOrderObject)
public class TTabOrderObject: _TTabOrderObject {
}


#elseif canImport(Alamofire)

@objc(TTabOrderObject)
public class TTabOrderObject: _TTabOrderObject {
}


#endif
/************************* Mo’min J.Abusaada *************************/