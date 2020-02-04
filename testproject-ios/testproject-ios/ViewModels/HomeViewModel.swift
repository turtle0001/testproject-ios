//
//  HomeViewModel.swift
//  testproject-ios
//
//  Created by Joash Tubaga on 2/4/20.
//  Copyright © 2020 Joash Tubaga. All rights reserved.
//

import Alamofire
import Foundation

class HomeViewModel {
  
  private var albums = [Album]()
  
  func fetchAlbums(completion: @escaping (Error?) -> Void) {
    let url = "https://jsonplaceholder.typicode.com/photos"
    Alamofire.request(url)
      .validate(statusCode: 200..<300)
      .responseData { (dataResp) in
        
        if let err = dataResp.error {
          print("Failed to fetch posts:", err)
          completion(err)
          return
        }
        
        guard let data = dataResp.data else { return }
        do {
          let albums = try JSONDecoder().decode([Album].self, from: data)
          self.albums = albums
          completion(nil)
          
        } catch {
          completion(error)
        }
    }
  }
  
  func numberOfRowsInSection(section: Int) -> Int {
    return albums.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = AlbumCell(style: .subtitle, reuseIdentifier: nil)
    let album = albums[indexPath.row]
    let cellVM = AlbumCellViewModel(album: album)
    
    cell.viewModel = cellVM
    
    return cell
  }
  
  // Need to move to coordinator
  func getAlbum(at indexPath: IndexPath) -> Album {
    return albums[indexPath.row]
  }
  
}
