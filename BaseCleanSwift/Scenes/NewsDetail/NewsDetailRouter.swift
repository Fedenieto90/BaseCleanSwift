//
//  NewsDetailRouter.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 18/08/2021.
//

import UIKit

protocol NewsDetailRoutingLogic {
    
    func routeToSomewhere()
}

protocol NewsDetailDataPassing {
    
    var dataStore: NewsDetailDataStore? { get }
}

// MARK: - Router
class NewsDetailRouter: NewsDetailDataPassing {
    
    weak var viewController: NewsDetailViewController?
    
    var dataStore: NewsDetailDataStore?
}

// MARK: - RoutingLogic
extension NewsDetailRouter: NewsDetailRoutingLogic {
    
    func routeToSomewhere() {
        
//        let destinationVC = NewsDetailViewController()
//        if let sourceDS = dataStore, let destinationDS = destinationVC.router?.dataStore {
//            passData(from: sourceDS, to: destinationDS)
//        }
//
//        viewController?.present(destinationVC, animated: true, completion: nil)
    }
}

// MARK: - PassData
extension NewsDetailRouter {
    
//    /// Provide the destination dataStore with data from the source dataStore.
//    func passData(from source: NewsDetailDataStore, to destination: NewsDetailDataStore) {
//
//        destination.name = source.name
//    }
}
