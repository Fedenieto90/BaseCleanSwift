//
//  NewsListSearchInteractorTests.swift
//  BaseCleanSwiftTests
//
//  Created by Federico Nieto on 25/08/2021.
//

@testable import BaseCleanSwift
import XCTest
import Swinject

class NewsListSearchInteractorTests: XCTestCase {

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
    
    func testFetchArticlesShouldAskPresenterToDisplayArticles() {
        // Interactor
        let newsListSearchInteractor = NewsListSearchInteractor()
        
        // Mock DI Container
        let container = Container() { container in
            container.register(ArticleRepository.self) { _ in
                NewsMockAPI(success: true)
            }
        }
        
        // Given
        let newsListSearchInteractorSpy = NewsListSearchInteractorOutputSpy()
        newsListSearchInteractor.presenter = newsListSearchInteractorSpy
        newsListSearchInteractor.worker = NewsListSearchWorker(container: container)
        let request = NewsListSearch.Search.SearchArticlesRequest(query: "")
         
        // When
        newsListSearchInteractor.searchArticles(request: request)
     
        // Then ...
        XCTAssertTrue(newsListSearchInteractorSpy.presentArticlesCalled, "Search articles should ask presenter to display articles")
        XCTAssertTrue(newsListSearchInteractorSpy.showProgressCalled, "Search articles should ask presenter to display progress")
        XCTAssertTrue(newsListSearchInteractorSpy.showProgressCalled, "Search articles should ask presenter to remove progress")
    }

}
