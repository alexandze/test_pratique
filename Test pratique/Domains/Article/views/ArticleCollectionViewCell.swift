//
//  ArticleCollectionViewCell.swift
//  Test pratique
//
//  Created by Alexandre Andze Kande on 2021-11-27.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {
    
    
    let imageView: UIImageView = {
        let uiImage = UIImageView()
        uiImage.translatesAutoresizingMaskIntoConstraints = false
        uiImage.contentMode = .scaleAspectFill
        uiImage.clipsToBounds = true
        let image = UIImage(named: "test-image")
        let imageResized = image?.resizeImage(targetSize: CGSize(width: 100, height: 100))
        uiImage.image = imageResized
        return uiImage
    }()
    
    let source: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Source 1"
        label.textColor = .red
        return label
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "My title"
        label.textColor = .red
        return label
    }()
    
    let subTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "My sub title"
        label.textColor = .red
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
        ])
    }
    
    private func positionDescription() {
        NSLayoutConstraint.activate([
            subTitle.topAnchor.constraint(equalTo: title.bottomAnchor),
            subTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
}
