//
//  AppDependency.swift
//  Test pratique
//
//  Created by Alexandre Andze Kande on 2021-11-28.
//

import Foundation
import Swinject

class AppDependency {
    
    static func septupContainer() -> Container {
        let container = Container()
        container.register(ArticleRepository.self) { _ in ArticleRepository() }
        container.register(ArticleService.self) { r in ArticleService(articleRepository:  r.resolve(ArticleRepository.self)!) }
        
        container.register(ArticleGetRecentPublicationsInteractor.self) { r in
            ArticleGetRecentPublicationsInteractor(articleService: r.resolve(ArticleService.self)!)
        }
        
        container
            .register(ArticleListViewModel.self) {
                r in ArticleListViewModel(articleGetRecentPublicationsInteractor: r.resolve(ArticleGetRecentPublicationsInteractor.self)!)
            }
        
        container.register(ArticleListViewController.self) { r in ArticleListViewController(viewModel: r.resolve(ArticleListViewModel.self)!) }
        
        return container
    }
}
