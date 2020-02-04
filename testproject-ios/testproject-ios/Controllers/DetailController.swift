//
//  DetailController.swift
//  testproject-ios
//
//  Created by Joash Tubaga on 2/4/20.
//  Copyright © 2020 Joash Tubaga. All rights reserved.
//

import LBTATools

class DetailController: UIViewController {
  
  let titleLabel = UILabel(text: "Title", font: .boldSystemFont(ofSize: 18), numberOfLines: 0)
//  let albumImageView = UIImageView(image: nil, contentMode: .scaleAspectFill)
  let albumImageView = UIImageView(backgroundColor: .gray)

  override func viewDidLoad() {
    view.backgroundColor = .white
    
    albumImageView.layer.cornerRadius = 5
    
    view.stack(albumImageView.withHeight(300),
               view.stack(titleLabel.withHeight(60), UIView()),
               spacing: 4).withMargins(.allSides(16))
    
    
  }
  
}
