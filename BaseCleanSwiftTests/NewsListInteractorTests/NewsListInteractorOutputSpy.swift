//
//  NewsListInteractorOutputSpy.swift
//  BaseCleanSwiftTests
//
//  Created by Federico Nieto on 20/08/2021.
//

@testable import BaseCleanSwift

class NewsListInteractorOutputSpy: NewsListPresentationLogic {
    
    var displayArticlesCalled = false
    var showProgressCalled = false
    var removeProgressCalled = false
    var presentArticleDetailCalled = false
    var displayAlertCalled = false
    
    func displayArticles(response: NewsList.ShowArticles.Response) {
        displayArticlesCalled = true
    }
    
    func presentArticleDetail() {
        presentArticleDetailCalled = true
    }
    
    func displayAlert(message: String) {
        displayAlertCalled = true
    }
    
    func showProgress() {
        showProgressCalled = true
    }
    
    func removeProgress() {
        removeProgressCalled = true
    }
}
