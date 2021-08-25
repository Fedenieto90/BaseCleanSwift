//
//  NewsListSearchPresenter.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 23/08/2021.
//

import UIKit

protocol NewsListSearchPresentationLogic: BasePresentationLogic {

    func presentArticles(response: NewsListSearch.Search.Response)
    func presentArticleDetail()
}

// MARK: - PresentationLogic
class NewsListSearchPresenter: NewsListSearchPresentationLogic {
    
    func presentArticleDetail() {
        viewController?.displayArticleDetail()
    }
    
    
    func showProgress() {
        viewController?.showProgressHUD()
    }
    
    func removeProgress() {
        viewController?.removeProgressHUD()
    }
    
    
    weak var viewController: NewsListSearchDisplayLogic?
    
    func presentArticles(response: NewsListSearch.Search.Response) {
        let viewModel = response.articles.map { article in
            NewsListSearch.Search.ArticleViewModel(article)
        }
        viewController?.displayArticles(viewModel: NewsListSearch.Search.ArticlesListViewModel(viewModel))
    }
}
