//
//  ArticleRepository.swift
//  Test pratique
//
//  Created by Alexandre Andze Kande on 2021-11-28.
//

import Foundation
import RxAlamofire
import RxSwift

class ArticleRepository: ArticleRepositoryProtocol {
    
    let URL_GET_NEW_BITCOIN = "https://newsapi.org/v2/everything?q=bitcoin&from=2021-11-01&sortBy=publishedAt&language=fr&apiKey=001ffe9acd62402ebfc99803cd5ce5e4"
    
    func getArticles() -> Observable<[Article]> {
        return RxAlamofire.string(.get, URL_GET_NEW_BITCOIN).map({ (response: String) -> [Article] in
            do {
                let decoder = JSONDecoder()
                let articleResponse = try decoder.decode(ArticleResponse.self, from:  response.data(using: .utf8)!)
                
                if let articles = articleResponse.articles {
                    return articles
                }
                
                throw ArticleRepositoryError.getError
            } catch {
                throw ArticleRepositoryError.getError
            }
        })
    }
}

enum ArticleRepositoryError: Error {
    case getError
}

protocol ArticleRepositoryProtocol {
    func getArticles() -> Observable<[Article]>
}
