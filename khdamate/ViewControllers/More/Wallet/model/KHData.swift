//
//  KHData.swift
//
//  Created by Ahmed ios on 08/12/2022
//  Copyright (c) . All rights reserved.
//

import Foundation

struct KHData: Codable {

  enum CodingKeys: String, CodingKey {
    case totalPrice = "total_price"
    case orderNo = "order_no"
    case serviceName = "service_name"
    case profit
    case serviceDetailName = "service_detail_name"
    case payDate = "pay_date"
  }

  var totalPrice: String?
  var orderNo: String?
  var serviceName: String?
  var profit: String?
  var serviceDetailName: String?
  var payDate: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    if let value = try? container.decode(Int.self, forKey:.totalPrice) {                       
totalPrice = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.totalPrice) {
 totalPrice = value                                                                                     
}
    if let value = try? container.decode(Int.self, forKey:.orderNo) {                       
orderNo = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.orderNo) {
 orderNo = value                                                                                     
}
    if let value = try? container.decode(Int.self, forKey:.serviceName) {                       
serviceName = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.serviceName) {
 serviceName = value                                                                                     
}
    if let value = try? container.decode(Int.self, forKey:.profit) {                       
profit = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.profit) {
 profit = value                                                                                     
}
    if let value = try? container.decode(Int.self, forKey:.serviceDetailName) {                       
serviceDetailName = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.serviceDetailName) {
 serviceDetailName = value                                                                                     
}
    if let value = try? container.decode(Int.self, forKey:.payDate) {                       
payDate = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.payDate) {
 payDate = value                                                                                     
}
  }

}
