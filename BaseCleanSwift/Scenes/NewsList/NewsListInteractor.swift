//
//  NewsListInteractor.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 18/08/2021.
//

import UIKit

protocol NewsListBusinessLogic {
    
    func doSomething(request: NewsList.Something.Request)
    func fetchArticles(request: NewsList.Something.Request)
}

protocol NewsListDataStore: AnyObject {
    
//    var name: String { get set }
    var articles: [NewsList.Something.ArticleViewModel] { get set }
}

// MARK: - DataStore
class NewsListInteractor: NewsListDataStore {
    
    var presenter: NewsListPresentationLogic?
    var worker: NewsListWorkerLogic?
    
//    var name: String = ""
    var articles: [NewsList.Something.ArticleViewModel] = []
}

// MARK: - BusinessLogic
extension NewsListInteractor: NewsListBusinessLogic {

    func doSomething(request: NewsList.Something.Request) {
        
        worker?.doSomeWork(completion: {

            let response = NewsList.Something.Response()
            self.presenter?.presentSomething(response: response)
        })
    }
    
    func fetchArticles(request: NewsList.Something.Request) {
        self.presenter?.showProgress()
        worker?.fetchArticles(completion: { response in
            self.presenter?.removeProgress()
            switch response {
            case .success(let articles):
                let articles = articles.map { article in
                    NewsList.Something.ArticleViewModel(article)
                }
                self.articles = articles
                self.presenter?.displayArticles(response: articles)
            case .failure:
                self.presenter?.displayAlert(message: "Error")
            }
        })
    }
}
