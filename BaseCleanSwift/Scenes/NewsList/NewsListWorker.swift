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
    
    init(container: Container) {
        self.container = container
    }

    func doSomeWork(completion: (() -> Void)?) {
        
        completion?()
    }
    
    func fetchArticles(completion: @escaping GetArticlesCompletionHandler) {
        let newsAPI = container.resolve(ArticleRepository.self)!
        newsAPI.getArticles(completion: completion)
    }
}
