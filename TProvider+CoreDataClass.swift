/************************* Mo’min J.Abusaada *************************/


import Foundation

@objc(TProvider)
public class TProvider: NSManagedObject {

}
#if canImport(RestKit)

@objc(TProvider)
public class TProvider: _TProvider {
}

@objc(TProviderObject)
public class TProviderObject: _TProviderObject {
}


#elseif canImport(Alamofire)
@objc(TProviderObject)
public class TProviderObject: _TProviderObject {
}


#endif
/************************* Mo’min J.Abusaada *************************/

