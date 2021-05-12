//
//  ViewController.swift
//  tabling
//
//  Created by joon-ho kil on 2021/05/12.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet var collectionView: UICollectionView!
  let collectionViewDataSource = CollectionViewDataSource()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.collectionViewLayout = makeLayout()
    self.collectionView.dataSource = collectionViewDataSource
    parsingAPI()
  }
  
  private func makeLayout() -> UICollectionViewLayout {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = .init(width: view.bounds.width / 2, height: view.bounds.width / 2)
    layout.minimumLineSpacing = .zero
    layout.minimumInteritemSpacing = .zero
    return layout
  }
  
  private func parsingAPI() {
    let session = URLSession.shared
    let urlString = "https://picsum.photos/v2/list"
    guard let url = URL(string: urlString) else {
      return
    }
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    let task = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
      guard let data = data else {
        print("load data failed")
        return
      }
      do {
        self.collectionViewDataSource.model = try JSONDecoder().decode(Model.self, from: data)
        DispatchQueue.main.async {
          self.collectionView.reloadData()
        }
      } catch {
        print(error.localizedDescription)
      }
    })
    task.resume()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let nextViewController: DetailViewController = segue.destination as? DetailViewController, let cell: CollectionViewCell = sender as? CollectionViewCell else {
      return
    }
    
    nextViewController.imageURL = cell.imageURL
  }
}
