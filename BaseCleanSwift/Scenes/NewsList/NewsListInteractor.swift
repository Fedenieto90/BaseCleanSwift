//
//  NewsListInteractor.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 18/08/2021.
//

import UIKit

protocol NewsListBusinessLogic {
    
    func fetchArticles(request: NewsList.ShowArticles.Request)
    func handleArticleSelected()
}

protocol NewsListDataStore: AnyObject {
    
    var articles: [Article] { get set }
}

// MARK: - DataStore
class NewsListInteractor: NewsListDataStore {
    
    var presenter: NewsListPresentationLogic?
    var worker: NewsListWorkerLogic?
    
    var articles: [Article] = []
}

// MARK: - BusinessLogic
extension NewsListInteractor: NewsListBusinessLogic {
    
    func fetchArticles(request: NewsList.ShowArticles.Request) {
        self.presenter?.showProgress()
        worker?.fetchArticles(completion: { response in
            self.presenter?.removeProgress()
            switch response {
            case .success(let articles):
                self.articles = articles
                let response = NewsList.ShowArticles.Response(articles: articles)
                self.presenter?.displayArticles(response: response)
            case .failure:
                self.presenter?.displayAlert(message: "Error")
            }
        })
    }
    
    func handleArticleSelected() {
        self.presenter?.presentArticleDetail()
    }
}
