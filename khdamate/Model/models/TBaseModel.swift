/************************* Mo’min J.Abusaada *************************/

import Foundation

#if canImport(RestKit)

@objc(TBaseModel)
public class TBaseModel: _TBaseModel {
}

@objc(TBaseModelObject)
public class TBaseModelObject: _TBaseModelObject {
}


#elseif canImport(Alamofire)

@objc(TBaseModelObject)
public class TBaseModelObject: _TBaseModelObject {
}


#endif
/************************* Mo’min J.Abusaada *************************/