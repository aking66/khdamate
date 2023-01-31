/************************* Mo’min J.Abusaada *************************/

import Foundation

#if canImport(RestKit)

@objc(TWalkthrough)
public class TWalkthrough: _TWalkthrough {
}

@objc(TWalkthroughObject)
public class TWalkthroughObject: _TWalkthroughObject {
}


#elseif canImport(Alamofire)

@objc(TWalkthroughObject)
public class TWalkthroughObject: _TWalkthroughObject {
}


#endif
/************************* Mo’min J.Abusaada *************************/