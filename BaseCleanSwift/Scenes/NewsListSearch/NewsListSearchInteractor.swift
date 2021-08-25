//
//  NewsListSearchInteractor.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 23/08/2021.
//

import UIKit

protocol NewsListSearchBusinessLogic {
    
    func searchArticles(request: NewsListSearch.Search.SearchArticlesRequest)
    func handleArticleSelected()
}

protocol NewsListSearchDataStore: AnyObject {
    
//    var name: String { get set }
    var articles: [Article] { get set }
}

// MARK: - DataStore
class NewsListSearchInteractor: NewsListSearchDataStore {
    
    var presenter: NewsListSearchPresentationLogic?
    var worker: NewsListSearchWorkerLogic?
    
//    var name: String = ""
    var articles: [Article] = []
}

// MARK: - BusinessLogic
extension NewsListSearchInteractor: NewsListSearchBusinessLogic {

    func searchArticles(request: NewsListSearch.Search.SearchArticlesRequest) {
        self.presenter?.showProgress()
        worker?.searchArticles(query: request.query, completion: { response in
            self.presenter?.removeProgress()
            switch response {
            case .success(let articles):
                self.articles = articles
                let response = NewsListSearch.Search.Response(articles: articles)
                self.presenter?.presentArticles(response: response)
            case .failure:
                ()
            }
        })
    }
    
    func handleArticleSelected() {
        self.presenter?.presentArticleDetail()
    }
}
