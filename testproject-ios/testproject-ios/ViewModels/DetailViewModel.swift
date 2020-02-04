//
//  DetailViewModel.swift
//  testproject-ios
//
//  Created by Joash Tubaga on 2/4/20.
//  Copyright © 2020 Joash Tubaga. All rights reserved.
//

import Foundation

class DetailViewModel {
  
  private var album: Album
  
  init(album: Album) {
    self.album = album
  }
  
  func getTitle() -> String {
    return album.title
  }
  
  func getUrl() -> URL {
    return URL(string: album.url)!
  }
  
}
