//
//  NewsListRouter.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 18/08/2021.
//

import UIKit

protocol NewsListRoutingLogic {
    
    func routeToSomewhere()
}

protocol NewsListDataPassing {
    
    var dataStore: NewsListDataStore? { get }
}

// MARK: - Router
class NewsListRouter: NewsListDataPassing {
    
    weak var viewController: NewsListViewController?
    
    var dataStore: NewsListDataStore?
}

// MARK: - RoutingLogic
extension NewsListRouter: NewsListRoutingLogic {
    
    func routeToSomewhere() {
        
        let destinationVC = NewsDetailViewController()
        if let sourceDS = dataStore, let destinationDS = destinationVC.router?.dataStore {
            passData(from: sourceDS, to: destinationDS)
        }

        viewController?.present(destinationVC, animated: true, completion: nil)
    }
}

// MARK: - PassData
extension NewsListRouter {
    
    /// Provide the destination dataStore with data from the source dataStore.
    func passData(from source: NewsListDataStore, to destination: NewsListDataStore) {

        destination.article = source.article
    }
}
