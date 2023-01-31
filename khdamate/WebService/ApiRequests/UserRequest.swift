/************************* Mo’min J.Abusaada *************************/
//
//  UserRequest.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//


import UIKit
enum VerificationCodeType: String {
    case login = "login"
    case reset_password = "reset password"
    case change_mobile = "change mobile"
    case support = "support"
    case registeration = "registeration"
}

class UserRequest : BaseRequest {
    
    public enum Route {
        case sendVerificationCode (mobile: String?, mobile_intro: String?, password: String?, type:VerificationCodeType)
        case verifyUser (mobile: String?, mobile_intro: String?, verification_code: String?)
        case login(mobile: String?, mobile_intro: String?, password: String?, verification_code: String?)
        case guestLogin(udid: String?)
        case resetPassword(mobile: String?, mobileIntro: String?, password: String?, verificationCode: String?)
        case changeMobileNumber(mobile: String?, mobileIntro: String?, verificationCode: String?)
        case changePassword(oldPassword: String?, newPassword: String?, confirmPassword: String?)
        case signUp(mobile: String?, mobileIntro:String?, password:String?, fullName: String?, address: String?, lat: String?, long: String?)
        case logout
        case editProfile(name: String?, image: UIImage?, address: String?, lat: String?, long: String?, email: String?, idNo: String?, service_ids: [Int32]?, license_photo: UIImage?)
        case getProfile
        case providerSignUp(mobile: String?, mobileIntro: String?, password: String?, fullName: String?, idno: String?, license_photo: UIImage?, service_ids: [Int32]?, address: String?, lat: String?, long: String?)
    }
    
    private var route:Route
    
    private let paramKey_mobile: String = "mobile"
    private let paramKey_mobile_intro: String = "mobile_intro"
    private let paramKey_password: String = "password"
    private let paramKey_verification_code: String = "verification_code"
    private let paramKey_udid: String = "udid"
    private let paramKey_old_password: String = "old_password"
    private let paramKey_new_password: String = "new_password"
    private let paramKey_confirm_password: String = "confirm_password"
    private let paramKey_full_name: String = "full_name"
    private let paramKey_operation: String = "operation"
    private let paramKey_name: String = "name"
    private let paramKey_city_id: String = "city_id"
    private let paramKey_address: String = "address"
    private let paramKey_lat: String = "lat"
    private let paramKey_long: String = "long"
    private let paramKey_email: String = "email"
    private let paramKey_service_id: String = "service_id"
    private let paramKey_service_ids: String = "service_ids"
    private let paramKey_image: String = "image"
    private let paramKey_idno: String = "idno"
    private let paramKey_job: String = "job_id"
    private let paramKey_license_photo: String = "license_photo"
    private let paramKey_id_photo: String = "id_photo"
    private let paramKey_profile_image: String = "profile_image"
    private let paramKey_types: String = "type"
    
    init(_ route:Route) {
        self.route = route
    }
    
    override var url : String {
        switch self.route {
        case .sendVerificationCode:
            return GlobalConstants.API_User_sendVerificationCode_Controller
        case .login:
            return GlobalConstants.API_User_login_Controller
        case .guestLogin:
            return GlobalConstants.API_User_guestLogin_Controller
        case .resetPassword:
            return GlobalConstants.API_User_resetPassword_Controller
        case .changeMobileNumber:
            return GlobalConstants.API_User_changeMobileNumber_Controller
        case .changePassword:
            return GlobalConstants.API_User_changePassword_Controller
        case .signUp:
            return GlobalConstants.API_User_signUp_Controller
        case .logout:
            return GlobalConstants.API_User_logout_Controller
        case .editProfile:
            return GlobalConstants.API_User_editProfile_Controller
        case .getProfile:
            return GlobalConstants.API_User_getProfile_Controller
        case .providerSignUp:
            return GlobalConstants.API_User_providerSignUp_Controller
        case .verifyUser:
            return GlobalConstants.API_User_verifyUser_Controller
        }
    }
    
    override var params : Dictionary<AnyHashable, Any> {
        var parmameters : Dictionary<AnyHashable, Any> = [:]
        switch self.route {
        case let .sendVerificationCode(mobile, mobile_intro, password, type):
            parmameters[paramKey_mobile] = mobile
            parmameters[paramKey_mobile_intro] = mobile_intro?.replacingOccurrences(of: "+", with: "")
            parmameters[paramKey_password] = password
            parmameters[paramKey_operation] = type.rawValue
            break
            
        case let .login(mobile, mobile_intro, password, verificationCode):
            parmameters[paramKey_mobile] = mobile
            parmameters[paramKey_mobile_intro] = mobile_intro?.replacingOccurrences(of: "+", with: "")
            parmameters[paramKey_password] = password
            parmameters[paramKey_verification_code] = verificationCode
            break
        case let .guestLogin(udid):
            parmameters[paramKey_udid] = udid
            break
        case let .resetPassword(mobile, mobileIntro, password, verificationCode):
            parmameters[paramKey_mobile] = mobile
            parmameters[paramKey_mobile_intro] = mobileIntro?.replacingOccurrences(of: "+", with: "")
            parmameters[paramKey_password] = password
            parmameters[paramKey_verification_code] = verificationCode
            break
        case .changeMobileNumber:
            break
        case let .changePassword(oldPassword, newPassword, confirmPassword):
            parmameters[paramKey_old_password] = oldPassword
            parmameters[paramKey_new_password] = newPassword
            parmameters[paramKey_confirm_password] = confirmPassword
            break
        case let .signUp(mobile, mobileIntro, password, fullName, address ,lat ,long):
            parmameters[paramKey_mobile] = mobile
            parmameters[paramKey_mobile_intro] = mobileIntro?.replacingOccurrences(of: "+", with: "")
            parmameters[paramKey_password] = password
            parmameters[paramKey_full_name] = fullName
            parmameters[paramKey_address] = address
            parmameters["latitude"] = lat
            parmameters["longitude"] = long

            break
        case .logout:
            break
        case let .editProfile(name, _, address,lat,long, email, idNo, service_ids, _):
            parmameters[paramKey_name] = name
            parmameters[paramKey_address] = address
            parmameters[paramKey_email] = email
            parmameters[paramKey_idno] = idNo
            parmameters["latitude"] = lat
            parmameters["longitude"] = long
            guard let services = service_ids else { break }
            for (i,service_) in services.enumerated() {
                parmameters[paramKey_service_ids + "[\(i)]"] = service_
            }
            break
        case .getProfile:
            break
        case let .providerSignUp(mobile, mobileIntro, password, fullName, idno, _, service_ids,address,lat,long):
            parmameters[paramKey_mobile] = mobile
            parmameters[paramKey_mobile_intro] = mobileIntro?.replacingOccurrences(of: "+", with: "")
            parmameters[paramKey_password] = password
            parmameters[paramKey_full_name] = fullName
            parmameters[paramKey_idno] = idno
            parmameters[paramKey_address] = address
            parmameters["latitude"] = lat
            parmameters["latitude"] = lat
            parmameters["with_otp"] = "1"

            guard let services = service_ids else { break }
            for (i,service_) in services.enumerated() {
                parmameters[paramKey_service_ids + "[\(i)]"] = service_
            }
            break
        case .verifyUser(mobile: let mobile, mobile_intro: let mobile_intro, verification_code: let verification_code):
            parmameters[paramKey_mobile] = mobile
            parmameters[paramKey_mobile_intro] = mobile_intro?.replacingOccurrences(of: "+", with: "")
            parmameters[paramKey_verification_code] = verification_code
            break
        }
        return parmameters
        
    }
    //    override var requestObject : Any {
    //        return nil
    //    }
    override var type : BaseRequestHTTPMethod {
        switch self.route {
        case .login,.sendVerificationCode:
            return .post
        case .guestLogin:
            return .post
        case .resetPassword:
            return .post
        case .changeMobileNumber:
            return .post
        case .changePassword:
            return .post
        case .signUp:
            return .post
        case .logout:
            return .post
        case .editProfile:
            return .post
        case .getProfile:
            return .get
        case .providerSignUp:
            return .post
        case .verifyUser:
            return .post
        }
    }
    //    override var responseReplacing: Dictionary<String, String>?{
    //        return ["data":"users"]
    //    }
    override var multiPartFiles: [BaseRequestFile] {
        //        if let dataImage = UIImageJPEGRepresentation(#imageLiteral(resourceName: "img.png"),1) {
        //            return [BaseRequestFile(fileData: dataImage, parameterName: "a_file", fileName: "image")]
        //        }else{
        switch self.route {
        case .editProfile(_, let image, _, _, _, _, _, _,let license_photo):
            var array: [BaseRequestFile] = []
            if let dataImage = image?.jpegData(compressionQuality: 0) {
                array.append(BaseRequestFile(fileData: dataImage, parameterName: "image", fileName: "image.png"))
            }
            if let dataImage1 = license_photo?.jpegData(compressionQuality: 0) {
                array.append(BaseRequestFile(fileData: dataImage1, parameterName: "license_photo", fileName: "license_photo.png"))
            }
            
//            guard let dataImage = image?.jpegData(compressionQuality: 1) else { return [] }
//            guard let dataImage1 = license_photo?.jpegData(compressionQuality: 1) else { return [] }
            
            return array
            
        case .providerSignUp(_,_,_,_,_, let license_photo, _,_,_,_):
            if let dataImage = license_photo?.jpegData(compressionQuality: 0) {
                return [BaseRequestFile(fileData: dataImage, parameterName: "license_photo", fileName: "license_photo.png")]
            }
        default:
            return []
        }
        return []
        //        }
    }
    //    override var customHeadrs: [String : String]?{
    //        return nil
    //    }
}
