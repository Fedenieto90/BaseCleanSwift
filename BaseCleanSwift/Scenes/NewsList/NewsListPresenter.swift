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
    func displayAlert()
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
        let viewModel = response.articles.map { viewModel in
            NewsList.ShowArticles.ArticleViewModel(viewModel)
        }
        viewController?.displayArticles(viewModel: NewsList.ShowArticles.ArticlesListViewModel(viewModel))
    }
    
    func displayAlert() {
        viewController?.displayAlert()
    }
    
    func presentArticleDetail() {
        viewController?.displayArticleDetail()
    }
}
