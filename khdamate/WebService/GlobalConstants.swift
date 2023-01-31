/************************* Mo’min J.Abusaada *************************/
//
//  GlobalConstants.swift
//  khdamate
//
//  Created by Mo'min J.Abusaada on 28/09/2021.
//


import Foundation

public let KDefaultImageName = "DefaultImage"

struct GlobalConstants {
    static let DataBaseName: String = "AppCoreData"
    static let APIUrl: String = ""
    static let API_Param_PageNumber = "PageNumber"
    static let API_Param_pagesize = "PageSize"
    static let API_PageSize: Int = 30
    static let API_Base_Controller: String = "http://proservice-app.com/public/api/v1.0/"//"http://khadamat.techno2030.com/public/api/v1.0/"

    
    ///////////////////// Start OrderRequest ///////////////////////////
    static let API_Order_Controller: String = API_Base_Controller + "order/"
    static let API_Order_Pickup_Driver_Controller: String = API_Base_Controller + "orderPickup/"
    static let API_Order_Delivey_Driver_Controller: String = API_Base_Controller + "orderDelivey/"
    static let API_Order_Driver_Controller: String = API_Base_Controller + "driver/"
    static let API_Order_Payment_Controller: String = API_Base_Controller + "orderPayment/"
    static let API_Order_offersHistory_Controller: String = API_Order_Controller + "getOrderOffersHistory"
    static let API_Order_list_Controller: String = API_Order_Controller + "getOrders"
    static let API_Order_paymentsWays_Controller: String = API_Order_Controller + "getPaymentsWays"
    static let API_Order_add_Controller: String = API_Order_Controller + "addOrder"
    static let API_Order_offers_Controller: String = API_Order_Controller + "getOrderOffers"
    static let API_Order_rejectOffer_Controller: String = API_Order_Controller + "rejectOffer"
    static let API_Order_cancelOrder_Controller: String = API_Order_Controller + "cancelOrder"
    static let API_Order_acceptOffer_Controller: String = API_Order_Controller + "acceptOffer"
    static let API_Order_getOffer_Controller: String = API_Order_Controller + "getOffer"
    static let API_Order_driverNewOrders_Controller: String = API_Order_Driver_Controller + "getNewOrders"
    static let API_Order_driverOrdersOffers_Controller: String = API_Order_Driver_Controller + "getOrdersOffers"
    static let API_Order_driverCancelOffer_Controller: String = API_Order_Driver_Controller + "cancelOffer"
    static let API_Order_driverGetOffer_Controller: String = API_Order_Driver_Controller + "getOffer"
    static let API_Order_driverGetOrder_Controller: String = API_Order_Driver_Controller + "getOrder"
    static let API_Order_driverRejectOrder_Controller: String = API_Order_Driver_Controller + "rejectOrder"
    static let API_Order_driverSubmitOffer_Controller: String = API_Order_Driver_Controller + "acceptOrder"
    static let API_Order_driverList_Controller: String = API_Order_Driver_Controller + "getOrders"
    static let API_Order_orderSummary_Controller: String = API_Order_Controller + "getOrderSummary"
    static let API_Order_sendMessage_Controller: String = API_Order_Controller + "sendMessage"
    static let API_Order_driverOnTheWay_Controller: String = API_Order_Pickup_Driver_Controller + "onTheWayDelivery"
    static let API_Order_driverArrivedToProvider_Controller: String = API_Order_Pickup_Driver_Controller + "arrived"
    static let API_Order_driverChangeDeliveryOffer_Controller: String = API_Order_Driver_Controller + "changeDeliveryOffer"
    static let API_Order_driverAddInvoice_Controller: String = API_Order_Pickup_Driver_Controller + "addInvoice"
    static let API_Order_checkCoupon_Controller: String = API_Order_Pickup_Driver_Controller + "checkCoupon"
    static let API_Order_acceptInvoice_Controller: String = API_Order_Pickup_Driver_Controller + "acceptInvoice"
    static let API_Order_driverFinancialSupport_Controller: String = API_Order_Pickup_Driver_Controller + "financialSupport"
    static let API_Order_driverFinancialSupportDetails_Controller: String = API_Order_Pickup_Driver_Controller + "getFinancialSupport"
    static let API_Order_driverAcceptFinancialSupport_Controller: String = API_Order_Pickup_Driver_Controller + "acceptFinancialSupport"
    static let API_Order_driverArrived_Controller: String = API_Order_Delivey_Driver_Controller + "arrived"
    static let API_Order_driverFinishOrder_Controller: String = API_Order_Delivey_Driver_Controller + "finishOrder"
    static let API_Order_driverRateOrder_Controller: String = API_Order_Delivey_Driver_Controller + "rate"
    static let API_Order_reOrder_Controller: String = API_Order_Controller + "reOrder"
    static let API_Order_completeOrder_Controller: String = API_Order_Delivey_Driver_Controller + "completeOrder"
    static let API_Order_driverAddOrderIssue_Controller: String = API_Order_Driver_Controller + "addOrderIssue"
    static let API_Order_paymentInitCheckout_Controller: String = API_Order_Payment_Controller + "initCheckout"
    static let API_Order_paymentCheck_Controller: String = API_Order_Payment_Controller + "checkPayment"
    static let API_Order_driverPurchaseDone_Controller: String = API_Order_Pickup_Driver_Controller + "purchaseCompleted"
    ///////////////////// END OrderRequest ///////////////////////////

    
    ///////////////////// Start NotificationsRequest ///////////////////////////
    static let API_Notifications_updateRegistrationId_Controller: String = API_Base_Controller + "notifications/updateRegistrationId"
    static let API_Notifications_sendNotification_Controller: String = API_Base_Controller + "notifications/sendNotification"
    static let API_Notifications_testNotification_Controller: String = API_Base_Controller + "notifications/testNotification"
    static let API_Notifications_notifications_Controller: String = API_Base_Controller + "notifications/notifications"
    ///////////////////// END NotificationsRequest ///////////////////////////
    
    ///////////////////// Start UserRequest ///////////////////////////
    static let API_User_login_Controller: String = API_Base_Controller + "user/login"
    static let API_User_verifyUser_Controller: String = API_Base_Controller + "user/verifyUser"
    static let API_User_guestLogin_Controller: String = API_Base_Controller + "user/guestLogin"
    static let API_User_resetPassword_Controller: String = API_Base_Controller + "user/resetPassword"
    static let API_User_changeMobileNumber_Controller: String = API_Base_Controller + "user/changeMobileNumber"
    static let API_User_changePassword_Controller: String = API_Base_Controller + "user/changePassword"
    static let API_User_signUp_Controller: String = API_Base_Controller + "user/signUp"
    static let API_User_sendVerificationCode_Controller: String = API_Base_Controller + "user/sendVerificationCode"
    static let API_User_logout_Controller: String = API_Base_Controller + "user/logout"
    static let API_User_editProfile_Controller: String = API_Base_Controller + "user/editProfile"
    static let API_User_editProfilePhoto_Controller: String = API_Base_Controller + "user/editProfilePhoto"
    static let API_User_getProfile_Controller: String = API_Base_Controller + "user/getProfile"
    static let API_User_providerSignUp_Controller: String = API_Base_Controller + "user/providerSignUp"
//    static let API_User_getProfilePhoto_Controller: String = API_Base_Controller + "user/getProfilePhoto"
    ///////////////////// END UserRequest ///////////////////////////
    
    ///////////////////// Start ServiceDetailsRequest ///////////////////////////
    static let API_ServiceDetails_getServiceDetails_Controller: String = API_Base_Controller + "serviceDetails/getServiceDetails"
    static let API_ServiceDetails_getFavorite_Controller: String = API_Base_Controller + "serviceDetails/getFavorite"
    static let API_ServiceDetails_addRomoveFavorite_Controller: String = API_Base_Controller + "serviceDetails/addRomoveFavorite"
    static let API_ServiceDetails_searchServices_Controller: String = API_Base_Controller + "serviceDetails/searchServices"
    ///////////////////// END ServiceDetailsRequest ///////////////////////////
    
    ///////////////////// Start ConstantsRequest ///////////////////////////
    static let API_Constants_getContactReasons_Controller: String = API_Base_Controller + "getContactReasons"
    static let API_Constants_getCancelOrderReasons_Controller: String = API_Base_Controller + "getCancelOrderReasons"
    static let API_Constants_getServices_Controller: String = API_Base_Controller + "getServices"
    static let API_Constants_getServiceDetails_Controller: String = API_Base_Controller + "getServiceDetails"
    static let API_Constants_getTermsAndConditions_Controller: String = API_Base_Controller + "getTermsAndConditions"
    static let API_Constants_getPrivacyPolicy_Controller: String = API_Base_Controller + "getPrivacyPolicy"
    static let API_Constants_getAboutUs_Controller: String = API_Base_Controller + "getAboutUs"
    static let API_Constants_getWalkthrough_Controller: String = API_Base_Controller + "getWalkthrough"
    static let API_Constants_getComplaintTypes_Controller: String = API_Base_Controller + "getComplaintTypes"
    static let API_Constants_getSocailLinks_Controller: String = API_Base_Controller + "getSocailLinks"
    ///////////////////// END ConstantsRequest ///////////////////////////
    
    
    ///////////////////// Start ContactRequest ///////////////////////////
    static let API_Contact_sendMessage_Controller: String = API_Base_Controller + "contact/sendMessage"
    static let API_Contact_getContactInfo_Controller: String = API_Base_Controller + "contact/getContactInfo"
    static let API_Contact_home_Controller: String = API_Base_Controller + "home"
    ///////////////////// END ContactRequest ///////////////////////////
 
    
    ///////////////////// Start OrderRequest ///////////////////////////
    static let API_Order_addOrder_Controller: String = API_Base_Controller + "order/addOrder"
    static let API_Order_payOrder_Controller: String = API_Base_Controller + "order/payOrder"
    static let API_Order_confirmOrder_Controller: String = API_Base_Controller + "order/confirmOrder"
    static let API_Order_addOrderIssue_Controller: String = API_Base_Controller + "order/addOrderIssue"
    static let API_Order_getOrder_Controller: String = API_Base_Controller + "order/getOrder"
    static let API_Order_rate_Controller: String = API_Base_Controller + "order/rate"
    static let API_Order_getOrders_Controller: String = API_Base_Controller + "order/getOrders"
    static let API_Order_checkLocation_Controller: String = API_Base_Controller + "order/checkLocation"
    static let API_Order_getOrdersByDate_Controller: String = API_Base_Controller + "order/getOrdersByDate"
    static let API_Order_getOrdersByMonth_Controller: String = API_Base_Controller + "order/getOrdersByMonth"
    static let API_paymentMethods_Controller: String = API_Base_Controller + "order/getPaymentsWays"
    static let API_addCoupon_Controller: String = API_Base_Controller + "order/addCoupon"
    static let API_reOrder_Controller: String = API_Base_Controller + "order/reOrder"
    static let API_getOrdersOffers_Controller: String = API_Base_Controller + "order/getOrdersOffers"
    static let API_getOrderOffers_Controller: String = API_Base_Controller + "order/getOrderOffers"
    static let API_rejectOffer_Controller: String = API_Base_Controller + "order/rejectOffer"
    static let API_acceptOffer_Controller: String = API_Base_Controller + "order/acceptOffer"
    static let API_answerFinalPrice_Controller: String = API_Base_Controller + "order/answerFinalPrice"
    static let API_answerWorkTime_Controller: String = API_Base_Controller + "order/answerWorkTime"
    static let API_confirmFinishOrder_Controller: String = API_Base_Controller + "order/confirmFinishOrder"
    static let API_getPaymentUrl_Controller: String = API_Base_Controller + "order/getPaymentUrl"
    static let API_checkPayment_Controller: String = API_Base_Controller + "order/checkPayment"
    
    ///////////////////// END OrderRequest ///////////////////////////
   
    ///////////////////// Start ServiceProviderRequest ///////////////////////////
    static let API_Provider_getProviders_Controller: String = API_Base_Controller + "providers/providers"

    static let API_Provider_getProvider_Controller: String = API_Base_Controller + "providers"

   
    ///////////////////// END OrderRequest ///////////////////////////
    ///
    ///
///////////////////// Start ServiceProviderRequest ///////////////////////////
    static let API_ServiceProvider_getNewOrders_Controller: String = API_Base_Controller + "serviceProvider/getNewOrders"
    static let API_ServiceProvider_getOrders_Controller: String = API_Base_Controller + "serviceProvider/getOrders"
    static let API_ServiceProvider_sendFinalPrice_Controller: String = API_Base_Controller + "serviceProvider/sendFinalPrice"
    static let API_ServiceProvider_processOrder_Controller: String = API_Base_Controller + "serviceProvider/processOrder"
    static let API_ServiceProvider_finishOrder_Controller: String = API_Base_Controller + "serviceProvider/finishOrder"
    static let API_ServiceProvider_rejectOrder_Controller: String = API_Base_Controller + "serviceProvider/rejectOrder"
    static let API_ServiceProvider_changeStatus_Controller: String = API_Base_Controller + "serviceProvider/changeStatus"
    static let API_ServiceProvider_enableNotifications_Controller: String = API_Base_Controller + "serviceProvider/enableNotifications"
    static let API_ServiceProvider_acceptOrder_Controller: String = API_Base_Controller + "serviceProvider/acceptOrder"
    static let API_sendOffer_Controller: String = API_Base_Controller + "serviceProvider/sendOffer"
    static let API_sendFinalPrice_Controller: String = API_Base_Controller + "serviceProvider/sendFinalPrice"
    static let API_sendWorkTime_Controller: String = API_Base_Controller + "serviceProvider/sendWorkTime"
    static let API_askToPay_Controller: String = API_Base_Controller + "serviceProvider/askToPay"
    ///////////////////// END ServiceProviderRequest ///////////////////////////
 
    
    ///////////////////// Start HyperPayRequest ///////////////////////////
    static let API_Hyper_initCheckout_Controller: String = API_Base_Controller + "orderPayment/initCheckout"
    static let API_Hyper_checkStatus_Controller: String = API_Base_Controller + "orderPayment/checkPayment"
    ///////////////////// END HyperPayRequest ///////////////////////////
}
