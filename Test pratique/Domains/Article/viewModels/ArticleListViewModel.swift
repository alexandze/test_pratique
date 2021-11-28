//
//  ArticleViewModel.swift
//  Test pratique
//
//  Created by Alexandre Andze Kande on 2021-11-28.
//

import Foundation
import RxSwift

class ArticleListViewModel {
    let articleGetRecentPublicationsInteractor: ArticleGetRecentPublicationsInteractor
    
    init(articleGetRecentPublicationsInteractor: ArticleGetRecentPublicationsInteractor) {
        self.articleGetRecentPublicationsInteractor = articleGetRecentPublicationsInteractor
    }
    
    func getRecentPublication() -> Observable<[Article]> {
        articleGetRecentPublicationsInteractor.getArticles()
    }
}
