//
//  CollectionViewCell.swift
//  tabling
//
//  Created by joon-ho kil on 2021/05/12.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
  @IBOutlet var imageView: UIImageView!
  var imageURL: String?
  
  override func prepareForReuse() {
    self.imageView.image = nil
  }
  
  func downloadImage(from url: String) {
      let url = URL(string: url)

      DispatchQueue.global().async {
          let data = try? Data(contentsOf: url!)
          DispatchQueue.main.async {
            self.imageView.image = UIImage(data: data!)
          }
      }
  }
}
