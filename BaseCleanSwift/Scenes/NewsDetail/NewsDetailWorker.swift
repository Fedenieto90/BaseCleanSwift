//
//  NewsDetailWorker.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 18/08/2021.
//

import UIKit

protocol NewsDetailWorkerLogic {
    
    func doSomeWork(completion: (() -> Void)?)
}

// MARK: - WorkerLogic
class NewsDetailWorker: NewsDetailWorkerLogic {

    func doSomeWork(completion: (() -> Void)?) {
        
        completion?()
    }
}
