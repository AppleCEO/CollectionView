//
//  CollectionViewDataSource.swift
//  tabling
//
//  Created by joon-ho kil on 2021/05/12.
//

import UIKit

class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
  var model = Model()
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    model.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
    cell.downloadImage(from: model[indexPath.row].downloadURL)
    cell.imageURL = model[indexPath.row].downloadURL
    return cell
  }
}
