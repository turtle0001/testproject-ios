//
//  AlbumCell.swift
//  testproject-ios
//
//  Created by Joash Tubaga on 2/4/20.
//  Copyright © 2020 Joash Tubaga. All rights reserved.
//

import LBTATools
import SDWebImage

class AlbumCell: UITableViewCell {
  
  var viewModel: AlbumCellViewModel! {
    didSet {
      contentBinder()
    }
  }
  
  let titleLabel = UILabel(text: "Title", font: .boldSystemFont(ofSize: 15), numberOfLines: 0)
  let albumImageView = UIImageView(image: nil, contentMode: .scaleAspectFill)
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    albumImageView.layer.cornerRadius = 5
    
    hstack(albumImageView.withWidth(60).withHeight(60),
           titleLabel,
           spacing: 16).withMargins(.init(top: 4, left: 16, bottom: 4, right: 16))
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  func contentBinder() {
    titleLabel.text = viewModel.getTitle()
    albumImageView.sd_setImage(with: viewModel.getThumbnailUrl())
  }
  
}

