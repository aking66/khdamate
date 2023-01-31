//
//  KHComments.swift
//
//  Created by Ahmed ios on 02/12/2022
//  Copyright (c) . All rights reserved.
//

import Foundation

struct KHComments: Codable {

  enum CodingKeys: String, CodingKey {
    case customerName = "customer_name"
    case date
    case text
  }

  var customerName: String?
  var date: String?
  var text: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    if let value = try? container.decode(Int.self, forKey:.customerName) {                       
customerName = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.customerName) {
 customerName = value                                                                                     
}
    if let value = try? container.decode(Int.self, forKey:.date) {                       
date = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.date) {
 date = value                                                                                     
}
    if let value = try? container.decode(Int.self, forKey:.text) {                       
text = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.text) {
 text = value                                                                                     
}
  }

}
