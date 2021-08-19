//
//  NewsDetailPresenter.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 18/08/2021.
//

import UIKit

protocol NewsDetailPresentationLogic {

    func presentSomething(response: NewsDetail.Something.Response)
    func showArticleDetail(article: NewsList.Something.ArticleViewModel)
}

// MARK: - PresentationLogic
class NewsDetailPresenter: NewsDetailPresentationLogic {

    weak var viewController: NewsDetailDisplayLogic?

    func presentSomething(response: NewsDetail.Something.Response) {
        
        let viewModel = NewsDetail.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
    
    func showArticleDetail(article: NewsList.Something.ArticleViewModel) {
        viewController?.displayArticleDetail(article: article)
    }
}
