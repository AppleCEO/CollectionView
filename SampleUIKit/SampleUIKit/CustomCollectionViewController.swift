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
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .blue.withAlphaComponent(0.2)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.id)
        collectionView.register(MyCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MyCollectionViewHeader.id)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupData()
        setupLayout()
    }
    
    var dataSource: [MyCellData] = []
    
    private func setupData() {
        for i in 0..<100 {
            dataSource.append(.init(title: "title \(i)"))
        }
    }
    
    private func setupLayout() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
}

extension CustomCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.id, for: indexPath) as? MyCollectionViewCell
        cell?.configure(title: dataSource[indexPath.row].title)
        return cell ?? .init()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MyCollectionViewHeader.id, for: indexPath) as? MyCollectionViewHeader
            headerView?.titleLabel.text = "헤더 \(indexPath.row)"
            return headerView ?? .init()
        default: return .init()
        }
    }
}

extension CustomCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = collectionView.bounds.width
        let height = 40.0
        
        return CGSize(width: width, height: height)
    }
}
