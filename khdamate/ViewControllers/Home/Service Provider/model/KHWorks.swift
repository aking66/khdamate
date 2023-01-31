//
//  KHWorks.swift
//
//  Created by Ahmed ios on 02/12/2022
//  Copyright (c) . All rights reserved.
//

import Foundation

struct KHWorks: Codable {

  enum CodingKeys: String, CodingKey {
    case date
    case customerName = "customer_name"
    case serviceDetailName = "service_detail_name"
    case serviceName = "service_name"
  }

  var date: String?
  var customerName: String?
  var serviceDetailName: String?
  var serviceName: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    if let value = try? container.decode(Int.self, forKey:.date) {                       
date = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.date) {
 date = value                                                                                     
}
    if let value = try? container.decode(Int.self, forKey:.customerName) {                       
customerName = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.customerName) {
 customerName = value                                                                                     
}
    if let value = try? container.decode(Int.self, forKey:.serviceDetailName) {                       
serviceDetailName = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.serviceDetailName) {
 serviceDetailName = value                                                                                     
}
    if let value = try? container.decode(Int.self, forKey:.serviceName) {                       
serviceName = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.serviceName) {
 serviceName = value                                                                                     
}
  }

}
