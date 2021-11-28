//
//  ArticleGetRecentPublicationsInteractor.swift
//  Test pratique
//
//  Created by Alexandre Andze Kande on 2021-11-28.
//

import Foundation
import RxSwift


class ArticleGetRecentPublicationsInteractor {
    
    private let articleService: ArticleService
    
    init(articleService: ArticleService) {
        self.articleService = articleService
    }
    
    func getArticles() -> Observable<[Article]> {
        articleService.getArticles()
    }
}
