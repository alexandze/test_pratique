//
//  ArticleCollectionViewCell.swift
//  Test pratique
//
//  Created by Alexandre Andze Kande on 2021-11-27.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {
    private let imageView: UIImageView = {
        let uiImage = UIImageView()
        uiImage.translatesAutoresizingMaskIntoConstraints = false
        return uiImage
    }()
    
    private let source: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .orange
        label.numberOfLines = 1
        return label
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .orange
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 1
        return label
    }()
    
    private let subTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .orange
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addAllViewInSubView()
        positionImageView()
        positionSource()
        positionTitle()
        positionDescription()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ text: String?) {
        self.title.text = text
    }
    
    func setDescription(_ text: String?) {
        self.subTitle.text = text
    }
    
    func setSource(_ text: String?) {
        self.source.text = text
    }
    
    func setImageUrl(_ url: String?) {
        if url == nil {
            imageView.image = Util.getDefaultImage()
            return
        }
        
        imageView.load(url: URL(string: url!)!)
    }
    
    private func addAllViewInSubView() {
        contentView.addSubview(imageView)
        imageView.addSubview(source)
        contentView.addSubview(title)
        contentView.addSubview(subTitle)
    }
    
    private func positionImageView() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo:  contentView.topAnchor)
        ])
    }
    
    private func positionSource() {
        NSLayoutConstraint.activate([
            source.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            source.topAnchor.constraint(equalTo: imageView.topAnchor)
        ])
    }
    
    private func positionTitle() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            title.bottomAnchor.constraint(equalTo: subTitle.topAnchor),
            title.widthAnchor.constraint(equalToConstant: 200),
            title.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    private func positionDescription() {
        NSLayoutConstraint.activate([
            subTitle.topAnchor.constraint(equalTo: title.bottomAnchor),
            subTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            subTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            subTitle.widthAnchor.constraint(equalToConstant: 200),
            subTitle.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}
