//
//  KHServices.swift
//
//  Created by Ahmed ios on 02/12/2022
//  Copyright (c) . All rights reserved.
//

import Foundation

struct KHServices: Codable {

  enum CodingKeys: String, CodingKey {
    case id
    case name
  }

  var id: Int?
  var name: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
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
  }

}
