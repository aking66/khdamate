/************************* Mo’min J.Abusaada *************************/
//
//  ResponseHandler.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//

import Foundation
import UIKit
public class ResponseHandler{
    
    fileprivate static let errorMSGTitle = "Error".localize_
    fileprivate static let errorMSGDetails = "An error occurred".localize_
    
    fileprivate static func showPopup(_ str:String){
        UIApplication.topViewController_()?.showPopAlert(title : ResponseHandler.errorMSGTitle, message : str)
    }
    
    public static func checkResponse(result:BaseResult,showMsg:Bool=true,handel:((BaseResponse)->Swift.Void)? = nil){
        switch result {
        case .responseSuccess(let response):
            handel!(response)
            break
        case .responseError(let response): do {
            if showMsg == true {
                if let errorMessage = response.status?.message {
                    self.showPopup(errorMessage)
                }else{
                    self.showPopup(ResponseHandler.errorMSGDetails)
                }
            }
            break
            }
        case .failure(let opareation,let error):
            do {
            if (error as NSError).code == -999 {
                //This error mean is the request was canceled
                return
            }
            if error.localizedDescription.count > 0 {
                self.showPopup(error.localizedDescription)
            }else{
                self.showPopup(ResponseHandler.errorMSGDetails)
            }
            break
            }
        case .emptyResponse: do {
            if showMsg == true {
                self.showPopup(ResponseHandler.errorMSGDetails)
            }
            break
            }
        }
    }
}
