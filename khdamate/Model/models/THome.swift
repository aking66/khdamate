/************************* Mo’min J.Abusaada *************************/

import Foundation

#if canImport(RestKit)

@objc(THome)
public class THome: _THome {
}

@objc(THomeObject)
public class THomeObject: _THomeObject {
}


#elseif canImport(Alamofire)

@objc(THomeObject)
public class THomeObject: _THomeObject {
}


#endif
/************************* Mo’min J.Abusaada *************************/