//
//  NewsDetailViewController.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 18/08/2021.
//

import UIKit

protocol NewsDetailDisplayLogic: AnyObject {

    func displaySomething(viewModel: NewsDetail.Something.ViewModel)
    func displayArticleDetail(article: NewsList.Something.ArticleViewModel)
}

class NewsDetailViewController: UIViewController {

    var interactor: NewsDetailBusinessLogic?
    var router: (NewsDetailRoutingLogic & NewsDetailDataPassing)?

    private let sceneView = NewsDetailView()

    // MARK: Init
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        setup()
    }

    // MARK: Setup
    private func setup() {

        let viewController = self
        let interactor = NewsDetailInteractor()
        let presenter = NewsDetailPresenter()
        let router = NewsDetailRouter()
        let worker = NewsDetailWorker()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    /// Creates the view that the controller manages.
    override func loadView() {
        
        view = sceneView
        
    }

    // MARK: View state
    override func viewDidLoad() {

        super.viewDidLoad()
        sceneView.viewDelegate = self
        
        doSomething()
        showArticleDetail()
    }
}

// MARK: - Requests
extension NewsDetailViewController {

    func doSomething() {

        let request = NewsDetail.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func showArticleDetail() {
        interactor?.showArticleDetail()
    }
}

// MARK: - Display
extension NewsDetailViewController: NewsDetailDisplayLogic {

    func displaySomething(viewModel: NewsDetail.Something.ViewModel) {

        //sceneView.setData()
    }
    
    func displayArticleDetail(article: NewsList.Something.ArticleViewModel) {
        sceneView.setData(article: article)
    }
}

// MARK: - ViewDelegate
extension NewsDetailViewController: NewsDetailViewDelegate {

//    func handleButtonPress() { }
}
