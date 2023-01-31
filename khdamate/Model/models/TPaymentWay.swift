/************************* Mo’min J.Abusaada *************************/

import Foundation

#if canImport(RestKit)

@objc(TPaymentWay)
public class TPaymentWay: _TPaymentWay {
}

@objc(TPaymentWayObject)
public class TPaymentWayObject: _TPaymentWayObject {
}


#elseif canImport(Alamofire)
enum TPaymentWayType:String {
    case apple_pay
    case cash
    case stc
    case visa
    case mada
}
@objc(TPaymentWayObject)
public class TPaymentWayObject: _TPaymentWayObject {
    var e_type:TPaymentWayType{
        return TPaymentWayType(rawValue: self.s_type ?? TPaymentWayType.cash.rawValue) ?? .cash
    }
}


#endif
/************************* Mo’min J.Abusaada *************************/
