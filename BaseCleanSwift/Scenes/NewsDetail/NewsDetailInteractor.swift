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
    var article: Article? { get set }
}

// MARK: - DataStore
class NewsDetailInteractor: NewsDetailDataStore {
    
    var presenter: NewsDetailPresentationLogic?
    var worker: NewsDetailWorkerLogic?
    
//    var name: String = ""
    var article: Article?
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
        if let article = article {
            self.presenter?.showArticleDetail(article: article)
        }
    }
}
