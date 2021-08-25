//
//  NewsListSearchRouter.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 23/08/2021.
//

import UIKit

protocol NewsListSearchRoutingLogic {
    
    func routeToArticleDetail()
}

protocol NewsListSearchDataPassing {
    
    var dataStore: NewsListSearchDataStore? { get }
}

// MARK: - Router
class NewsListSearchRouter: NewsListSearchDataPassing {
    
    weak var viewController: NewsListSearchViewController?
    
    var dataStore: NewsListSearchDataStore?
}

// MARK: - RoutingLogic
extension NewsListSearchRouter: NewsListSearchRoutingLogic {
    
    func routeToArticleDetail() {
        
        let destinationVC = NewsDetailViewController()
        if let sourceDS = dataStore, let destinationDS = destinationVC.router?.dataStore {
            passData(from: sourceDS, to: destinationDS)
        }

        viewController?.present(destinationVC, animated: true, completion: nil)
    }
}

// MARK: - PassData
extension NewsListSearchRouter {
    
//    /// Provide the destination dataStore with data from the source dataStore.
    func passData(from source: NewsListSearchDataStore, to destination: NewsDetailDataStore) {
        let selectedRow = (viewController?.view as? NewsListSearchView)?.tableView.indexPathForSelectedRow?.row
        let selectedArticle = source.articles[selectedRow!]
        destination.article = selectedArticle
    }
}
