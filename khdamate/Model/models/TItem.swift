/************************* Mo’min J.Abusaada *************************/

import Foundation

#if canImport(RestKit)

@objc(TItem)
public class TItem: _TItem {
}

@objc(TItemObject)
public class TItemObject: _TItemObject {
}


#elseif canImport(Alamofire)

@objc(TItemObject)
public class TItemObject: _TItemObject {
}


#endif
/************************* Mo’min J.Abusaada *************************/