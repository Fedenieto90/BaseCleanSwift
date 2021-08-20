//
//  NewsListPresenter.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 18/08/2021.
//

import UIKit

protocol NewsListPresentationLogic: BasePresentationLogic {

    func displayArticles(response: NewsList.ShowArticles.Response)
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
    
    func displayArticles(response: NewsList.ShowArticles.Response) {
        let viewModel = response.articles.map { article in
            NewsList.ShowArticles.ArticleViewModel(article)
        }
        viewController?.displayArticles(viewModel: viewModel)
    }
    
    func displayAlert(message: String) {
        viewController?.displayAlert(message: message)
    }
    
    func presentArticleDetail() {
        viewController?.displayArticleDetail()
    }
}
