/************************* Mo’min J.Abusaada *************************/

import Foundation

#if canImport(RestKit)

@objc(TOrderActions)
public class TOrderActions: _TOrderActions {
}

@objc(TOrderActionsObject)
public class TOrderActionsObject: _TOrderActionsObject {
}


#elseif canImport(Alamofire)

@objc(TOrderActionsObject)
public class TOrderActionsObject: _TOrderActionsObject {
}


#endif
/************************* Mo’min J.Abusaada *************************/