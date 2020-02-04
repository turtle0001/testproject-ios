//
//  DetailController.swift
//  testproject-ios
//
//  Created by Joash Tubaga on 2/4/20.
//  Copyright © 2020 Joash Tubaga. All rights reserved.
//

import LBTATools
import SDWebImage

class DetailController: UIViewController {
  
  var viewModel: DetailViewModel!
  
  let titleLabel = UILabel(text: "Title", font: .boldSystemFont(ofSize: 18), numberOfLines: 0)
  let albumImageView = UIImageView(image: nil, contentMode: .scaleAspectFill)

  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
    contentBinder()
  }
  
  private func setupView() {
    view.backgroundColor = .white
    
    albumImageView.layer.cornerRadius = 5
    albumImageView.backgroundColor = .darkText
    
    view.stack(albumImageView.withHeight(300),
               view.stack(titleLabel.withHeight(60), UIView()),
               spacing: 4).withMargins(.allSides(16))
  }
  
  private func contentBinder() {
    titleLabel.text = viewModel.getTitle()
    albumImageView.sd_setImage(with: viewModel.getUrl())
  }
  
}
