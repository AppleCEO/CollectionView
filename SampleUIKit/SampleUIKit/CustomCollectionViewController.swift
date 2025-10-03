//
//  ViewController.swift
//  SampleUIKit
//
//  Created by 도미닉 on 10/3/25.
//

import UIKit

private enum Const {
    static let cellWidth: CGFloat = 100.0
    static let cellHeight: CGFloat = 100.0
    
    static let lineSpacing: CGFloat = 10.0
    static let itemSpacing: CGFloat = 10.0
    
    static let sectionInsetLeft: CGFloat = 20.0
    static let sectionInsetRight: CGFloat = 20.0
}

class CustomCollectionViewController: UIViewController {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = .init(width: Const.cellWidth, height: Const.cellHeight)
        layout.minimumLineSpacing = Const.lineSpacing
        layout.minimumInteritemSpacing = Const.itemSpacing
        layout.sectionInset = .init(
            top: 0.0,
            left: Const.sectionInsetLeft,
            bottom: 0.0,
            right: Const.sectionInsetRight
        )
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .blue.withAlphaComponent(0.2)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
}

extension CustomCollectionViewController: UICollectionViewDataSource {
    
}

extension CustomCollectionViewController: UICollectionViewDelegateFlowLayout {
    
}
