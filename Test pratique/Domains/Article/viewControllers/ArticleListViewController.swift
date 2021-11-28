//
//  ArticleViewController.swift
//  Test pratique
//
//  Created by Alexandre Andze Kande on 2021-11-27.
//

import UIKit
import RxSwift

class ArticleListViewController: UIViewController {
    
    var articles: [Article] = []
    let viewModel: ArticleListViewModel
    var disposableGetArticles: Disposable?
    
    let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.minimumLineSpacing = 0
        collectionViewLayout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ArticleCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .black
        
        return collectionView
    }()
    
    let titleSection: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.sizeToFit()
        label.text = "Parution Récentes"
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewModel: ArticleListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        positionTitleSection()
        positionCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getArticles()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        disposableGetArticles?.dispose()
    }
    
    private func positionCollectionView() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleSection.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: view.frame.width/2)
        ])
    }
    
    private func positionTitleSection() {
        view.addSubview(titleSection)
        
        NSLayoutConstraint.activate([
            titleSection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleSection.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor)
        ])
    }
    
    private func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func reloadData() {
        collectionView.reloadData()
    }
    
    private func getArticles() {
        disposableGetArticles = viewModel.getRecentPublication()
            .observe(on: Util.getSchedulerMain())
            .subscribe(onNext: { newArticles in
                self.articles = newArticles
                self.reloadData()
            })
    }
    
}

extension ArticleListViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 1.6, height: collectionView.frame.width / 1.8)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ArticleCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        initCell(cell, indexPath: indexPath)
        return cell
    }
    
    func initCell(_ cell: ArticleCollectionViewCell, indexPath: IndexPath) {
        let index = indexPath.row
        let article = articles[index]
        cell.setTitle(article.title)
        cell.setSource(article.source?.name)
        cell.setDescription(article.description)
        cell.setImageUrl(article.urlToImage)
    }
    
    
}
