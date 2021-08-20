//
//  NewsListInteractorTests.swift
//  BaseCleanSwiftTests
//
//  Created by Federico Nieto on 20/08/2021.
//

@testable import BaseCleanSwift
import XCTest
import Swinject

class NewsListInteractorTests: XCTestCase {

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
        let newsListInteractor = NewsListInteractor()
        
        // Mock DI Container
        let container = Container() { container in
            container.register(ArticleRepository.self) { _ in
                NewsMockAPI(success: true)
            }
        }
        
        // Given
        let newsListInteractorSpy = NewsListInteractorOutputSpy()
        newsListInteractor.presenter = newsListInteractorSpy
        newsListInteractor.worker = NewsListWorker(container: container)
        let request = NewsList.ShowArticles.Request()
         
        // When
        newsListInteractor.fetchArticles(request: request)
     
        // Then ...
        XCTAssertTrue(newsListInteractorSpy.displayArticlesCalled, "Fetch articles should ask presenter to display articles")
        XCTAssertTrue(newsListInteractorSpy.showProgressCalled, "Fetch articles should ask presenter to display progress")
        XCTAssertTrue(newsListInteractorSpy.showProgressCalled, "Fetch articles should ask presenter to remove progress")
    }
    
    func testFetchArticlesShouldAskPresenterToDisplayAlert() {
        // Interactor
        let newsListInteractor = NewsListInteractor()
        
        // Mock DI Container
        let container = Container() { container in
            container.register(ArticleRepository.self) { _ in
                NewsMockAPI(success: false)
            }
        }
        
        // Given
        let newsListInteractorSpy = NewsListInteractorOutputSpy()
        newsListInteractor.presenter = newsListInteractorSpy
        newsListInteractor.worker = NewsListWorker(container: container)
        let request = NewsList.ShowArticles.Request()
         
        // When
        newsListInteractor.fetchArticles(request: request)
     
        // Then ...
        XCTAssertTrue(newsListInteractorSpy.displayAlertCalled, "Fetch articles error should ask presenter to display an alert")
        XCTAssertTrue(newsListInteractorSpy.showProgressCalled, "Fetch articles should ask presenter to display progress")
        XCTAssertTrue(newsListInteractorSpy.showProgressCalled, "Fetch articles should ask presenter to remove progress")
    }
    
    func testHandleArticleSelectedShouldAskPresenterToPresentArticleDetail() {
        // Interactor
        let newsListInteractor = NewsListInteractor()
        
        // Given
        let newsListInteractorSpy = NewsListInteractorOutputSpy()
        newsListInteractor.presenter = newsListInteractorSpy
         
        // When
        newsListInteractor.handleArticleSelected()
     
        // Then ...
        XCTAssertTrue(newsListInteractorSpy.presentArticleDetailCalled, "Handle article selected should ask presenter to go to article detail")
    }

}
