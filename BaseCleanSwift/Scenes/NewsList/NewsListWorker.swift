//
//  NewsListWorker.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 18/08/2021.
//

import UIKit
import Swinject

protocol NewsListWorkerLogic {
    
    func doSomeWork(completion: (() -> Void)?)
    func fetchArticles(completion: @escaping GetArticlesCompletionHandler)
}

// MARK: - WorkerLogic
class NewsListWorker: NewsListWorkerLogic {
    
    private let container: Container
    private let newsAPI: ArticleRepository
    
    init(container: Container) {
        self.container = container
        self.newsAPI = container.resolve(ArticleRepository.self)!
    }

    func doSomeWork(completion: (() -> Void)?) {
        
        completion?()
    }
    
    func fetchArticles(completion: @escaping GetArticlesCompletionHandler) {
        newsAPI.getArticles(completion: completion)
    }
    
    func searchArticles(query: String, completion: @escaping GetArticlesCompletionHandler) {
        newsAPI.searchArticles(query: query, completion: completion)
    }
}
