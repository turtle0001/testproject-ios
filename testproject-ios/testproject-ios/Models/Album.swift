//
//  Album.swift
//  testproject-ios
//
//  Created by Joash Tubaga on 2/4/20.
//  Copyright © 2020 Joash Tubaga. All rights reserved.
//

import Foundation

struct Album: Decodable {
  let id: Int
  let title: String
  let url: String
  let thumbnailUrl: String
}
