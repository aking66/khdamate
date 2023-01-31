//
//  KHProvider.swift
//
//  Created by Ahmed ios on 02/12/2022
//  Copyright (c) . All rights reserved.
//

import Foundation

struct KHProvider: Codable {

  enum CodingKeys: String, CodingKey {
    case result
    case status
  }

  var result: KHResult?
  var status: KHStatus?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    result = try container.decodeIfPresent(KHResult.self, forKey: .result)
    status = try container.decodeIfPresent(KHStatus.self, forKey: .status)
  }

}
