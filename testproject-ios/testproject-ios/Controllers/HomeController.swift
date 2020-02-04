//
//  HomeController.swift
//  testproject-ios
//
//  Created by Joash Tubaga on 2/4/20.
//  Copyright © 2020 Joash Tubaga. All rights reserved.
//


import Alamofire
import JGProgressHUD
import SDWebImage
import UIKit

class HomeController: UITableViewController {
  
  var viewModel = HomeViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViews()
    fetchAlbums()
  }
  
  private func setupViews() {
    navigationItem.title = "Test Project"
  }
  
  private func fetchAlbums() {
    let hud = JGProgressHUD(style: .dark)
    hud.show(in: view)
    viewModel.fetchAlbums { (err) in
      hud.dismiss()
      if let err = err {
        print("Failed to fetch posts:", err)
      } else {
        self.tableView.reloadData()
      }
    }
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRowsInSection(section: section)
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return viewModel.tableView(tableView, cellForRowAt: indexPath)
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detailController = DetailController()
    let selectedAlbum = viewModel.getAlbum(at: indexPath)
    let detailVM = DetailViewModel(album: selectedAlbum)
    detailController.viewModel = detailVM
    navigationController?.pushViewController(detailController, animated: true)
  }
}
