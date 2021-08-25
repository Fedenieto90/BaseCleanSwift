//
//  NewsListSearchInteractorOutputSpy.swift
//  BaseCleanSwiftTests
//
//  Created by Federico Nieto on 25/08/2021.
//

@testable import BaseCleanSwift

class NewsListSearchInteractorOutputSpy: NewsListSearchPresentationLogic {
   
    var presentArticlesCalled = false
    var showProgressCalled = false
    var removeProgressCalled = false
    var presentArticleDetailCalled = false
    
    func presentArticles(response: NewsListSearch.Search.Response) {
        presentArticlesCalled = true
    }
    
    func presentArticleDetail() {
        presentArticleDetailCalled = true
    }
    
    func showProgress() {
        showProgressCalled = true
    }
    
    func removeProgress() {
        removeProgressCalled = false
    }
    
}
