//
//  KHResult.swift
//
//  Created by Ahmed ios on 02/12/2022
//  Copyright (c) . All rights reserved.
//

import Foundation

struct KHResult: Codable {

  enum CodingKeys: String, CodingKey {
    case comments
    case name
    case services
    case mobile
    case rates
    case latitude
    case imageUrl = "image_url"
    case rate
    case longitude
    case works
    case id
    case address
  }

  var comments: [KHComments]?
  var name: String?
  var services: [KHServices]?
  var mobile: String?
  var rates: [KHRates]?
  var latitude: String?
  var imageUrl: String?
    var address: String?
  var rate: Float?
  var longitude: String?
  var works: [KHWorks]?
  var id: Int?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    comments = try container.decodeIfPresent([KHComments].self, forKey: .comments)
      if let value = try? container.decode(Int.self, forKey:.address) {
  address = String(value)
  }else if let value = try? container.decode(String.self, forKey:.address) {
      address = value
  }
    if let value = try? container.decode(Int.self, forKey:.name) {                       
name = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.name) {
 name = value                                                                                     
}
    services = try container.decodeIfPresent([KHServices].self, forKey: .services)
    if let value = try? container.decode(Int.self, forKey:.mobile) {                       
mobile = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.mobile) {
 mobile = value                                                                                     
}
    rates = try container.decodeIfPresent([KHRates].self, forKey: .rates)
    if let value = try? container.decode(Int.self, forKey:.latitude) {                       
latitude = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.latitude) {
 latitude = value                                                                                     
}
    if let value = try? container.decode(Int.self, forKey:.imageUrl) {                       
imageUrl = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.imageUrl) {
 imageUrl = value                                                                                     
}
    if let value = try? container.decode(String.self, forKey:.rate) {
 rate = Float(value)
} else if let value = try? container.decode(Float.self, forKey:.rate) {
rate = value 
}
    if let value = try? container.decode(Int.self, forKey:.longitude) {                       
longitude = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.longitude) {
 longitude = value                                                                                     
}
    works = try container.decodeIfPresent([KHWorks].self, forKey: .works)
    if let value = try? container.decode(String.self, forKey:.id) {
 id = Int(value)                                                                                     
} else if let value = try? container.decode(Int.self, forKey:.id) {
id = value 
}
  }

}
