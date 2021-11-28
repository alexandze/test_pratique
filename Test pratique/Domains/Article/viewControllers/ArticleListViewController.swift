//
//  ArticleViewController.swift
//  Test pratique
//
//  Created by Alexandre Andze Kande on 2021-11-27.
//

import UIKit

class ArticleListViewController: UIViewController {
    
    let test = ["a","B", "", "", "", ""]
    
    let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ArticleCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .black
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        positionCollectionView()
    }
    
    private func positionCollectionView() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: view.frame.width/2)
        ])
    }
    
    private func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension ArticleListViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        test.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ArticleCollectionViewCell else {
            return ArticleCollectionViewCell()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
             let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? SectionHe
             sectionHeader.label.text = "TRENDING"
             return sectionHeader
        } else { //No footer in this case but can add option for that
             return UICollectionReusableView()
        }
    }
    
}
