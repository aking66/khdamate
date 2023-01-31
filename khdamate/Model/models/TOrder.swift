/************************* Mo’min J.Abusaada *************************/

import Foundation

#if canImport(RestKit)

@objc(TOrder)
public class TOrder: _TOrder {
}

@objc(TOrderObject)
public class TOrderObject: _TOrderObject {
}


#elseif canImport(Alamofire)
//enum OrderStatus:String {
//    case submitted
//    case accepted
//    case wating_confirm
//    case confirmed
//    case completed
//    case cancelled
//    case deleted_by_admin
//    case cancelled_by_driver
//    case rejected_by_customer
//    case rejected
//    case ready_to_complete
//    
//    var isRejected:Bool{
//        if self == .cancelled ||
//            self == .deleted_by_admin ||
//            self == .cancelled_by_driver ||
//            self == .rejected_by_customer ||
//            self == .rejected {
//            return true
//        }else{
//            return false
//        }
//    }
//}
//enum OrderType:String {
//    case regular
//    case barq
//    case meshwar
//    case parcels
//    
//    var s_title:String {
//        switch self {
//            case .regular:
//                return "OrderCreateVC_lblVCTypeTitle_text_Regular".localize_
//            case .barq:
//                return "OrderCreateVC_lblVCTypeTitle_text_Barq".localize_
//            case .meshwar:
//                return "OrderCreateVC_lblVCTypeTitle_text_Mashawerk".localize_
//            case .parcels:
//                return "OrderCreateVC_lblVCTypeTitle_text_Parcels".localize_
//        }
//    }
//    var s_icon:String {
//        switch self {
//            case .regular:
//                return "ic_category_default"
//            case .barq:
//                return "ic_tabbar_barq"
//            case .meshwar:
//                return "ic_home_mashawerk"
//            case .parcels:
//                return "ic_home_parcels"
//        }
//    }
//}
//enum AppProfitType:String {
//    case rate
//    case value
//}

@objc(TOrderObject)
public class TOrderObject: _TOrderObject {
//    var e_type:OrderType{
//        return OrderType(rawValue: self.s_type ?? OrderType.regular.rawValue) ?? .regular
//    }
//    var e_status:OrderStatus{
//        return OrderStatus(rawValue: self.s_status ?? OrderStatus.submitted.rawValue) ?? .submitted
//    }
//    var e_app_profit_type:AppProfitType{
//        return AppProfitType(rawValue: self.s_app_profit_type ?? AppProfitType.rate.rawValue) ?? .rate
//    }
}


#endif
/************************* Mo’min J.Abusaada *************************/
