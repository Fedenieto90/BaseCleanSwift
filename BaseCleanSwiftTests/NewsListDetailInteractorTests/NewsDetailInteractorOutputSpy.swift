//
//  NewsDetailInteractorOutputSpy.swift
//  BaseCleanSwiftTests
//
//  Created by Federico Nieto on 20/08/2021.
//

@testable import BaseCleanSwift

class NewsDetailInteractorOutputSpy: NewsDetailPresentationLogic {
   
    var showArticleDetailCalled = false
    var presentSomethingCalled = false
    
    func presentSomething(response: NewsDetail.Something.Response) {
        presentSomethingCalled = true
    }
    
    func showArticleDetail(article: Article) {
        showArticleDetailCalled = true
    }
    
}
