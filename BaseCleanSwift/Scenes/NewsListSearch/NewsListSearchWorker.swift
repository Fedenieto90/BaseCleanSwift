//
//  NewsListSearchWorker.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 23/08/2021.
//

import UIKit
import Swinject

protocol NewsListSearchWorkerLogic {
    
    func doSomeWork(completion: (() -> Void)?)
    func searchArticles(query: String, completion: @escaping GetArticlesCompletionHandler)
}

// MARK: - WorkerLogic
class NewsListSearchWorker: NewsListSearchWorkerLogic {
    
    private let container: Container
    private let newsAPI: ArticleRepository
    
    init(container: Container) {
        self.container = container
        self.newsAPI = container.resolve(ArticleRepository.self)!
    }

    func doSomeWork(completion: (() -> Void)?) {
        
        completion?()
    }
    
    func searchArticles(query: String, completion: @escaping GetArticlesCompletionHandler) {
        newsAPI.searchArticles(query: query, completion: completion)
    }
}
