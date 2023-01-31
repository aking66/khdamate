/************************* Mo’min J.Abusaada *************************/

import Foundation

#if canImport(RestKit)

@objc(TChat)
public class TChat: _TChat {
}

@objc(TChatObject)
public class TChatObject: _TChatObject {
}


#elseif canImport(Alamofire)
enum ChatCategory:String {
    case regular
    case invoice
    case support
    case rate
    case send_final_price
    case asked_to_pay
    case rate_request
    case ready_to_complete
    case order_finished
    case send_working_time
    case answer_working_time
    case invoice_payed
}
enum ChatType:String {
    case mixed
    case text
    case voice
    case photo
    case file

    var s_cell_id:String{
        switch self {
        case .mixed:
            return "ChatOrderTextTableViewCell"
        case .text:
            return "ChatOrderTextTableViewCell"
        case .voice:
            return "ChatOrderVoiceTableViewCell"
        case .photo:
            return "ChatImageTableViewCell"
        case .file:
            return "ChatOrderAttachmentTableViewCell"
        }
    }
}
@objc(TChatObject)
public class TChatObject: _TChatObject {
    var e_category: ChatCategory{
        print("e_category:\(self.category)")

        return ChatCategory(rawValue: self.category ?? ChatCategory.regular.rawValue) ?? .regular
    }
    var e_type: ChatType{
        return ChatType(rawValue: self.types ?? ChatType.mixed.rawValue) ?? .mixed
    }
    var b_answered: NSNumber?{
        return self.s_answered 
    }
    var prev_total_price:NSNumber?
    var coupon_discount:NSNumber?
    var total_price:NSNumber?
    var b_dateIsHidden:NSNumber?
    
    var duration:Float?
    var currentDuration:Float?

    var s_total_calcolated:String{
        if (self.coupon_discount?.doubleValue ?? 0) > 0 && (self.total_price?.doubleValue ?? 0) > 0 {
            return "\("ChatOrderAddInvoiceVC_lblInvoiceTotalPrice_text".localize_) : \(self.prev_total_price?.formatedNumber ?? "0") \("SAR".localize_)\n\("ChatOrderAddInvoiceVC_lblCouponDiscount_text".localize_) : \(self.coupon_discount?.formatedNumber ?? "0") \("SAR".localize_)\n\("ChatOrderAddInvoiceVC_lblTotalPrice_text".localize_) : \(self.total_price?.formatedNumber ?? "0") \("SAR".localize_)"
        }else{
            return "\("ChatOrderAddInvoiceVC_lblInvoiceTotalPrice_text".localize_) : \(self.s_total_price ?? "0") \("SAR".localize_)"
        }
    }
}


#endif
/************************* Mo’min J.Abusaada *************************/
