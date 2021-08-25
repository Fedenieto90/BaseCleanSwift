//
//  NewsListSearchViewController.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 23/08/2021.
//

import UIKit

protocol NewsListSearchDisplayLogic: BaseDisplayLogic {

    func displayArticles(viewModel: NewsListSearch.Search.ArticlesListViewModel)
    func displayArticleDetail()
}

class NewsListSearchViewController: UIViewController {

    var interactor: NewsListSearchBusinessLogic?
    var router: (NewsListSearchRoutingLogic & NewsListSearchDataPassing)?

    private let sceneView = NewsListSearchView()

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
        let interactor = NewsListSearchInteractor()
        let presenter = NewsListSearchPresenter()
        let router = NewsListSearchRouter()
        let worker = NewsListSearchWorker(container: container)
        
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
    }
}

// MARK: - Requests
extension NewsListSearchViewController {

    func doSomething() {

        //let request = NewsListSearch.Something.Request()
        //interactor?.doSomething(request: request)
    }
}

// MARK: - Display
extension NewsListSearchViewController: NewsListSearchDisplayLogic {
    func displayArticles(viewModel: NewsListSearch.Search.ArticlesListViewModel) {
        sceneView.setData(articles: viewModel)
    }
    
    func displayArticleDetail() {
        router?.routeToArticleDetail()
    }
    
    func showProgressHUD() {
        
        showProgress()
    }
    
    func removeProgressHUD() {
        hideProgress()
    }
}

// MARK: - ViewDelegate
extension NewsListSearchViewController: NewsListSearchViewDelegate {
    
    func handleArticleSelected() {
        interactor?.handleArticleSelected()
    }
    
    
    func handleSearchBarInputText(query: String) {
        interactor?.searchArticles(request: NewsListSearch.Search.SearchArticlesRequest(query: query))
    }
    
}

// MARK: - UISearchControllerDelegate
extension NewsListSearchViewController: UISearchControllerDelegate {
    
    func willPresentSearchController(_ searchController: UISearchController) {
        DispatchQueue.main.async {
            searchController.searchResultsController?.view.isHidden = false
        }
    }
    
    func didPresentSearchController(_ searchController: UISearchController) {
        searchController.searchResultsController?.view.isHidden = false
    }
}


