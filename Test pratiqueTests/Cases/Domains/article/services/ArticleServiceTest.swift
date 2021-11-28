//
//  ArticleServiceTest.swift
//  Test pratiqueTests
//
//  Created by Alexandre Andze Kande on 2021-11-28.
//

import Foundation
import XCTest
import RxTest
import RxBlocking
import RxSwift
@testable import Test_pratique

class ArticleServiceTest: XCTestCase {
    var sut: ArticleService!
    
    override func setUpWithError() throws {
        self.sut = ArticleService(articleRepository: ArticleRepositoryMock())
    }
    
    override func tearDownWithError() throws {
        self.sut = nil
    }
    
    func testService_WhenGetArticles_articleCountEqualToTwo() throws {
        let articles = try self.sut.getArticles().toBlocking(timeout: 5).first()
        XCTAssertEqual(articles!.count, 2)
    }
    
    func testService_WhenGetArticlez_articleTitleEqualToArticleTitleMock() throws {
        let articles = try self.sut.getArticles().toBlocking(timeout: 5).first()
        
        (0..<articles!.count).forEach { index in
            XCTAssertEqual(articles![index].title, ArticleRepositoryMock.ARTICLE_MOCK[index].title)
        }
    }
}
