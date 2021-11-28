//
//  ArticleHeaderCollectionReusableView.swift
//  Test pratique
//
//  Created by Alexandre Andze Kande on 2021-11-28.
//

import UIKit

class ArticleHeaderCollectionReusableView: UICollectionReusableView {
    
    let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.sizeToFit()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    func setTitle(_ text: String) {
        title.text = text
    }
    
    private func configTitle() {
        addSubview(title)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
