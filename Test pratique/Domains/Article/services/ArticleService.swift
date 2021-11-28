//
//  ArticleService.swift
//  Test pratique
//
//  Created by Alexandre Andze Kande on 2021-11-28.
//

import Foundation
import RxSwift

class ArticleService {
    private let articleRepository: ArticleRepositoryProtocol
    
    init(articleRepository: ArticleRepositoryProtocol) {
        self.articleRepository = articleRepository
    }
    
    func getArticles() -> Observable<[Article]>  {
        articleRepository.getArticles()
    }
}
