/************************* Mo’min J.Abusaada *************************/

import Foundation

#if canImport(RestKit)

@objc(TConstant)
public class TConstant: _TConstant {
}

@objc(TConstantObject)
public class TConstantObject: _TConstantObject {
}


#elseif canImport(Alamofire)

@objc(TConstantObject)
public class TConstantObject: _TConstantObject {
}


#endif
/************************* Mo’min J.Abusaada *************************/