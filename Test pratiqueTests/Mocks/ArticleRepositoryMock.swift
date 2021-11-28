//
//  ArticleRepositoryMock.swift
//  Test pratiqueTests
//
//  Created by Alexandre Andze Kande on 2021-11-28.
//

import Foundation
import RxSwift
@testable import Test_pratique

class ArticleRepositoryMock: ArticleRepositoryProtocol {
    
    static let ARTICLE_MOCK: [Article] = [
        Article(title: "title 1", description: "description 1", urlToImage: "my url 1", source: Source(name: "source 1")),
        Article(title: "title 2", description: "description 2", urlToImage: "my url 2", source: Source(name: "source 2"))
    ]
    
    func getArticles() -> Observable<[Article]> {
        Observable.of(ArticleRepositoryMock.ARTICLE_MOCK)
    }
}
