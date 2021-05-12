//
//  DetailViewController.swift
//  tabling
//
//  Created by joon-ho kil on 2021/05/12.
//

import UIKit

class DetailViewController: UIViewController {
  @IBOutlet var imageView: UIImageView!
  var imageURL: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    if let imageURL = imageURL {
      self.downloadImage(from: imageURL)
    }
  }
  
  private func downloadImage(from url: String) {
    let url = URL(string: url)
    
    DispatchQueue.global().async {
      let data = try? Data(contentsOf: url!)
      DispatchQueue.main.async {
        self.imageView.image = UIImage(data: data!)
      }
    }
  }
}
