//
//  HomeController.swift
//  testproject-ios
//
//  Created by Joash Tubaga on 2/4/20.
//  Copyright © 2020 Joash Tubaga. All rights reserved.
//

import UIKit
import Alamofire
import JGProgressHUD
import SDWebImage

class HomeController: UITableViewController {
  
  var albums = [Album]()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Test Project"
    
    fetchAlbums()
  }
  
  @objc fileprivate func fetchAlbums() {
    let hud = JGProgressHUD(style: .dark)
    hud.show(in: view)
    
    let url = "https://jsonplaceholder.typicode.com/photos"
    Alamofire.request(url)
      .validate(statusCode: 200..<300)
      .responseData { (dataResp) in
        
        hud.dismiss()
        
        if let err = dataResp.error {
          print("Failed to fetch posts:", err)
          return
        }
        
        guard let data = dataResp.data else { return }
        do {
          let albums = try JSONDecoder().decode([Album].self, from: data)
          self.albums = albums
          self.tableView.reloadData()
        } catch {
          print(error)
        }
        
        self.dismiss(animated: true)
    }
  }
}

extension HomeController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return albums.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = AlbumCell(style: .subtitle, reuseIdentifier: nil)
    let album = albums[indexPath.row]
    
    cell.albumImageView.sd_setImage(with: URL(string: album.thumbnailUrl))
    cell.titleLabel.text = album.title
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let album = albums[indexPath.row]
    guard let image = album.url
    
    let detailController = DetailController()
    navigationController?.pushViewController(detailController, animated: true)
  }
}
