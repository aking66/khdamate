//
//  KHRates.swift
//
//  Created by Ahmed ios on 02/12/2022
//  Copyright (c) . All rights reserved.
//

import Foundation

struct KHRates: Codable {

  enum CodingKeys: String, CodingKey {
    case text
    case rate
    case date
    case customerName = "customer_name"
  }

  var text: String?
  var rate: Float?
  var date: String?
  var customerName: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    if let value = try? container.decode(Int.self, forKey:.text) {                       
text = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.text) {
 text = value                                                                                     
}
    if let value = try? container.decode(String.self, forKey:.rate) {
 rate = Float(value)
} else if let value = try? container.decode(Float.self, forKey:.rate) {
rate = value 
}
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
  }

}
