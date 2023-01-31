//
//  KHStatus.swift
//
//  Created by Ahmed ios on 02/12/2022
//  Copyright (c) . All rights reserved.
//

import Foundation

struct KHStatus: Codable {

  enum CodingKeys: String, CodingKey {
    case otherTxt
    case showMessage
    case success
    case messageCode
  }

  var otherTxt: String?
  var showMessage: Bool?
  var success: Bool?
  var messageCode: Int?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    if let value = try? container.decode(Int.self, forKey:.otherTxt) {                       
otherTxt = String(value)                                                                                     
}else if let value = try? container.decode(String.self, forKey:.otherTxt) {
 otherTxt = value                                                                                     
}
    showMessage = try container.decodeIfPresent(Bool.self, forKey: .showMessage)
    success = try container.decodeIfPresent(Bool.self, forKey: .success)
    if let value = try? container.decode(String.self, forKey:.messageCode) {
 messageCode = Int(value)                                                                                     
} else if let value = try? container.decode(Int.self, forKey:.messageCode) {
messageCode = value 
}
  }

}
