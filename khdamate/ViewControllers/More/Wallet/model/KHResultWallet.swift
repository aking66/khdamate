//
//  KHResult.swift
//
//  Created by Ahmed ios on 08/12/2022
//  Copyright (c) . All rights reserved.
//

import Foundation

struct KHResultWallet: Codable {

  enum CodingKeys: String, CodingKey {
    case currency
    case totalProfit = "total_profit"
    case totalPrice = "total_price"
    case totalOrders = "total_orders"
    case logs
  }

  var currency: String?
  var totalProfit: String?
  var totalPrice: String?
  var totalOrders: Int?
  var logs: KHLogs?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    if let value = try? container.decode(Int.self, forKey:.currency) {                       
currency = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.currency) {
 currency = value                                                                                     
}
    if let value = try? container.decode(Int.self, forKey:.totalProfit) {                       
totalProfit = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.totalProfit) {
 totalProfit = value                                                                                     
}
    if let value = try? container.decode(Int.self, forKey:.totalPrice) {                       
totalPrice = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.totalPrice) {
 totalPrice = value                                                                                     
}
    if let value = try? container.decode(String.self, forKey:.totalOrders) {
 totalOrders = Int(value)                                                                                     
} else if let value = try? container.decode(Int.self, forKey:.totalOrders) {
totalOrders = value 
}
    logs = try container.decodeIfPresent(KHLogs.self, forKey: .logs)
  }

}
