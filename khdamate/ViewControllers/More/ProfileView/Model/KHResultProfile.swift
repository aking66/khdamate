//
//  KHResult.swift
//
//  Created by Ahmed ios on 08/12/2022
//  Copyright (c) . All rights reserved.
//

import Foundation

struct KHResultProfile: Codable {

  enum CodingKeys: String, CodingKey {
    case isOnline = "is_online"
    case email
    case licensePhoto = "license_photo"
    case balance
    case id
    case name
    case mobileIntro = "mobile_intro"
    case works
    case status
    case totalCompletedOrder = "total_completed_order"
    case isNew
    case rateCount = "rate_count"
    case serviceIds = "service_ids"
    case serviceNames = "service_names"
    case mobile
    case enableNotifications = "enable_notifications"
    case idno
    case rate
    case comments
    case profileImageUrl
    case address
    case rates
  }

  var isOnline: Int?
  var email: String?
  var licensePhoto: String?
  var balance: Int?
  var id: Int?
  var name: String?
  var mobileIntro: String?
  var works: [KHWorks]?
  var status: Int?
  var totalCompletedOrder: Int?
  var isNew: Int?
  var rateCount: Int?
  var serviceIds: [Int]?
  var serviceNames: [String]?
  var mobile: String?
  var enableNotifications: Int?
  var idno: String?
  var rate: Int?
  var comments: [KHComments]?
  var profileImageUrl: String?
  var address: String?
  var rates: [KHRates]?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    if let value = try? container.decode(String.self, forKey:.isOnline) {
 isOnline = Int(value)                                                                                     
} else if let value = try? container.decode(Int.self, forKey:.isOnline) {
isOnline = value 
}
    if let value = try? container.decode(Int.self, forKey:.email) {                       
email = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.email) {
 email = value                                                                                     
}
    if let value = try? container.decode(Int.self, forKey:.licensePhoto) {                       
licensePhoto = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.licensePhoto) {
 licensePhoto = value                                                                                     
}
    if let value = try? container.decode(String.self, forKey:.balance) {
 balance = Int(value)                                                                                     
} else if let value = try? container.decode(Int.self, forKey:.balance) {
balance = value 
}
    if let value = try? container.decode(String.self, forKey:.id) {
 id = Int(value)                                                                                     
} else if let value = try? container.decode(Int.self, forKey:.id) {
id = value 
}
    if let value = try? container.decode(Int.self, forKey:.name) {                       
name = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.name) {
 name = value                                                                                     
}
    if let value = try? container.decode(Int.self, forKey:.mobileIntro) {                       
mobileIntro = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.mobileIntro) {
 mobileIntro = value                                                                                     
}
    works = try container.decodeIfPresent([KHWorks].self, forKey: .works)
    if let value = try? container.decode(String.self, forKey:.status) {
 status = Int(value)                                                                                     
} else if let value = try? container.decode(Int.self, forKey:.status) {
status = value 
}
    if let value = try? container.decode(String.self, forKey:.totalCompletedOrder) {
 totalCompletedOrder = Int(value)                                                                                     
} else if let value = try? container.decode(Int.self, forKey:.totalCompletedOrder) {
totalCompletedOrder = value 
}
    if let value = try? container.decode(String.self, forKey:.isNew) {
 isNew = Int(value)                                                                                     
} else if let value = try? container.decode(Int.self, forKey:.isNew) {
isNew = value 
}
    if let value = try? container.decode(String.self, forKey:.rateCount) {
 rateCount = Int(value)                                                                                     
} else if let value = try? container.decode(Int.self, forKey:.rateCount) {
rateCount = value 
}
      serviceIds = try container.decodeIfPresent([Int].self, forKey: .serviceIds)

      serviceNames = try container.decodeIfPresent([String].self, forKey: .serviceNames)

    if let value = try? container.decode(Int.self, forKey:.mobile) {                       
mobile = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.mobile) {
 mobile = value                                                                                     
}
    if let value = try? container.decode(String.self, forKey:.enableNotifications) {
 enableNotifications = Int(value)                                                                                     
} else if let value = try? container.decode(Int.self, forKey:.enableNotifications) {
enableNotifications = value 
}
    if let value = try? container.decode(Int.self, forKey:.idno) {                       
idno = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.idno) {
 idno = value                                                                                     
}
    if let value = try? container.decode(String.self, forKey:.rate) {
 rate = Int(value)                                                                                     
} else if let value = try? container.decode(Int.self, forKey:.rate) {
rate = value 
}
    comments = try container.decodeIfPresent([KHComments].self, forKey: .comments)
    if let value = try? container.decode(Int.self, forKey:.profileImageUrl) {                       
profileImageUrl = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.profileImageUrl) {
 profileImageUrl = value                                                                                     
}
    if let value = try? container.decode(Int.self, forKey:.address) {                       
address = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.address) {
 address = value                                                                                     
}
    rates = try container.decodeIfPresent([KHRates].self, forKey: .rates)
  }

}
