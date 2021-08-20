//
//  NewsListPresenter.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 18/08/2021.
//

import UIKit

protocol NewsListPresentationLogic: BasePresentationLogic {

    func presentSomething(response: NewsList.Something.Response)
    func displayArticles(response: [Article])
    func presentArticleDetail()
    func displayAlert(message: String)
}

// MARK: - PresentationLogic
class NewsListPresenter: NewsListPresentationLogic {

    weak var viewController: NewsListDisplayLogic?
    
    func showProgress() {
        viewController?.showProgressHUD()
    }
    
    func removeProgress() {
        viewController?.removeProgressHUD()
    }

    func presentSomething(response: NewsList.Something.Response) {
        
        let viewModel = NewsList.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
    
    func displayArticles(response: [Article]) {
        let articlesViewModel = response.map { article in
            NewsList.Something.ArticleViewModel(article)
        }
        viewController?.displayArticles(viewModel: articlesViewModel)
    }
    
    func displayAlert(message: String) {
        viewController?.displayAlert(message: message)
    }
    
    func presentArticleDetail() {
        viewController?.displayArticleDetail()
    }
}
