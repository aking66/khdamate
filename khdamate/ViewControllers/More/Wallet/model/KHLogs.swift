//
//  KHLogs.swift
//
//  Created by Ahmed ios on 08/12/2022
//  Copyright (c) . All rights reserved.
//

import Foundation

struct KHLogs: Codable {

  enum CodingKeys: String, CodingKey {
    case data
    case pagination
  }

  var data: [KHData]?
  var pagination: KHPagination?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    data = try container.decodeIfPresent([KHData].self, forKey: .data)
    pagination = try container.decodeIfPresent(KHPagination.self, forKey: .pagination)
  }

}
