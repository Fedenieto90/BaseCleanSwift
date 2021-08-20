//
//  NewsDetailInteractorTests.swift
//  BaseCleanSwiftTests
//
//  Created by Federico Nieto on 20/08/2021.
//

@testable import BaseCleanSwift
import XCTest
import Swinject

class NewsListDetailInteractorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testShowArticleDetailShouldAskPresenterToDisplayArticleDetail() {
        // Interactor
        let newsDetailInteractor = NewsDetailInteractor()
        let newsDetailInteractorSpy = NewsDetailInteractorOutputSpy()
        newsDetailInteractor.presenter = newsDetailInteractorSpy
        
        newsDetailInteractor.article = Article(author: "Author Test", title: "Title Test", description: "Description Test", urlToImage: "urlToImage Test")
        newsDetailInteractor.showArticleDetail()
        
        
        XCTAssertTrue(newsDetailInteractorSpy.showArticleDetailCalled, "Show article detail should ask presenter to display article detail")
    }

}

