//
//  NewsListViewController.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 18/08/2021.
//

import UIKit

protocol NewsListDisplayLogic: BaseDisplayLogic {

    func displaySomething(viewModel: NewsList.Something.ViewModel)
    func displayArticles(viewModel: [NewsList.Something.ArticleViewModel])
    func displayAlert(message: String)
}

class NewsListViewController: UIViewController {

    var interactor: NewsListBusinessLogic?
    var router: (NewsListRoutingLogic & NewsListDataPassing)?

    private let sceneView = NewsListView()

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
        let interactor = NewsListInteractor()
        let presenter = NewsListPresenter()
        let router = NewsListRouter()
        let worker = NewsListWorker(container: container)
        
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
        fetchArticles()
        setTitle()
    }
}

// MARK: - Requests
extension NewsListViewController {
    
    func setTitle() {
        title = "News List"
    }

    func doSomething() {
        
        let request = NewsList.Something.Request()
        interactor?.doSomething(request: request)
        
    }
    
    func fetchArticles() {
        let request = NewsList.Something.Request()
        interactor?.fetchArticles(request: request)
    }
}

// MARK: - Display
extension NewsListViewController: NewsListDisplayLogic {
    
    func showProgressHUD() {
        
        showProgress()
    }
    
    func removeProgressHUD() {
        hideProgress()
    }
    
    
    func displayArticles(viewModel: [NewsList.Something.ArticleViewModel]) {
        sceneView.setData(articles: viewModel)
    }
    
    func displayAlert(message: String) {
        showAlert()
    }
    

    func displaySomething(viewModel: NewsList.Something.ViewModel) {

//        sceneView.setData()
    }
}

// MARK: - ViewDelegate
extension NewsListViewController: NewsListViewDelegate {

//    func handleButtonPress() { }
    
    func handleArticleSelected() {
        router?.routeToArticleDetail()
    }
    
    func handleRefreshArticles() {
        let request = NewsList.Something.Request()
        interactor?.fetchArticles(request: request)
    }
}
