/************************* Mo’min J.Abusaada *************************/

import Foundation

#if canImport(RestKit)

@objc(TNotification)
public class TNotification: _TNotification {
}

@objc(TNotificationObject)
public class TNotificationObject: _TNotificationObject {
}


#elseif canImport(Alamofire)

@objc(TNotificationObject)
public class TNotificationObject: _TNotificationObject {
}


#endif
/************************* Mo’min J.Abusaada *************************/