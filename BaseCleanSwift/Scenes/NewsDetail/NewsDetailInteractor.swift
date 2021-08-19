//
//  NewsDetailInteractor.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 18/08/2021.
//

import UIKit

protocol NewsDetailBusinessLogic {
    
    func doSomething(request: NewsDetail.Something.Request)
    func showArticleDetail()
}

protocol NewsDetailDataStore: AnyObject {
    
//    var name: String { get set }
    var article: NewsList.Something.ArticleViewModel? { get set }
}

// MARK: - DataStore
class NewsDetailInteractor: NewsDetailDataStore {
    
    var presenter: NewsDetailPresentationLogic?
    var worker: NewsDetailWorkerLogic?
    
//    var name: String = ""
    var article: NewsList.Something.ArticleViewModel?
}

// MARK: - BusinessLogic
extension NewsDetailInteractor: NewsDetailBusinessLogic {

    func doSomething(request: NewsDetail.Something.Request) {
        
        worker?.doSomeWork(completion: {

            let response = NewsDetail.Something.Response()
            self.presenter?.presentSomething(response: response)
        })
    }
    
    func showArticleDetail() {
        guard let article = article else {
            return
        }
        self.presenter?.showArticleDetail(article: article)
    }
}
