//
//  DetailController.swift
//  testproject-ios
//
//  Created by Joash Tubaga on 2/4/20.
//  Copyright © 2020 Joash Tubaga. All rights reserved.
//

import LBTATools

class DetailController: UIViewController {
  
  let titleLabel = UILabel(text: "Title", font: .boldSystemFont(ofSize: 15), numberOfLines: 0)
  let albumImageView = UIImageView(image: nil, contentMode: .scaleAspectFill)
  

  override func viewDidLoad() {
    view.backgroundColor = .white
    
    albumImageView.layer.cornerRadius = 5
    
    view.stack(albumImageView.withWidth(60).withHeight(60),
           titleLabel,
           spacing: 16).withMargins(.init(top: 4, left: 16, bottom: 4, right: 16))
  
  }
  
}
