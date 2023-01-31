//
//  KHWallet.swift
//
//  Created by Ahmed ios on 08/12/2022
//  Copyright (c) . All rights reserved.
//

import Foundation

struct KHWallet: Codable {

  enum CodingKeys: String, CodingKey {
    case status
    case result
  }

  var status: KHStatus?
  var result: KHResultWallet?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    status = try container.decodeIfPresent(KHStatus.self, forKey: .status)
    result = try container.decodeIfPresent(KHResultWallet.self, forKey: .result)
  }

}
