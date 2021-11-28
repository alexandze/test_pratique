//
//  Article.swift
//  Test pratique
//
//  Created by Alexandre Andze Kande on 2021-11-28.
//

import Foundation

struct Article: Decodable {
    
    var title: String?
    var description: String?
    var urlToImage: String?
    var source: Source?
    
    init(title: String?, description: String?, urlToImage: String?, source: Source?) {
        self.title = title
        self.description = description
        self.urlToImage = urlToImage
        self.source = source
    }
    
    init(from decoder: Decoder) throws {
        let containerKey = try decoder.container(keyedBy: ArticleCodingKeys.self)
        title = try? containerKey.decode(String.self, forKey: .title)
        description = try? containerKey.decode(String.self, forKey: .description)
        urlToImage = try? containerKey.decode(String.self, forKey: .urlToImage)
        source = try? containerKey.decode(Source.self, forKey: .source)
    }
    
    enum ArticleCodingKeys: String, CodingKey {
        case title
        case description
        case urlToImage
        case source
    }
}

struct ArticleResponse: Decodable {
    var articles: [Article]?
    
    init(from decoder: Decoder) throws {
        let containerKey = try decoder.container(keyedBy: ArticleResponseCodingKeys.self)
        articles = try? containerKey.decode([Article].self, forKey: .articles)
    }
    
    enum ArticleResponseCodingKeys: String, CodingKey {
        case articles
    }
}
