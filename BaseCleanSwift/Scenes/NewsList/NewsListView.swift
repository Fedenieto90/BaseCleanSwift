//
//  NewsListView.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 18/08/2021.
//

import UIKit

protocol NewsListViewDelegate: AnyObject {

    func handleArticleSelected()
    func handleRefreshArticles()
    func setSearchBar(searchController: UISearchController?)
}

class NewsListView: UIView {
    
    private struct ViewTraits {
    
        static let margin: CGFloat = 16
        static let estimatedRowHeight: CGFloat = 300
    }
    
    // MARK: Views
    
    let tableView = UITableView()
    private var searchController: UISearchController?
    private let refreshControl = UIRefreshControl()
    private var articlesListViewModel: NewsList.ShowArticles.ArticlesListViewModel?
    
    // MARK: Parameters

    public weak var viewDelegate: NewsListViewDelegate?
    
    // MARK: Init
    override init(frame: CGRect) {
    
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {

        super.init(coder: coder)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupSearchBar()
    }
    
    // MARK: Display
    
    func setData(viewModel: NewsList.ShowArticles.ArticlesListViewModel) {
        self.articlesListViewModel = viewModel
        DispatchQueue.main.async {
            if self.refreshControl.isRefreshing {
                self.refreshControl.endRefreshing()
            }
            self.tableView.reloadData()
        }
    }
}

// MARK: - Setup
private extension NewsListView {

    func setup() {
        
        setupViews()
        setupViewHierarchy()
        setupViewConstraints()
    }
    
    // MARK: View setup
    func setupViews() {
        
        setupView()
        setupTableView()
    }

    func setupView() {
        backgroundColor = .white
    }
    
    func setupTableView() {
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: ArticleTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl = refreshControl
        tableView.estimatedRowHeight = ViewTraits.estimatedRowHeight
        tableView.rowHeight = UITableView.automaticDimension
        refreshControl.addTarget(self, action: #selector(refreshArticles), for: .valueChanged)
    }
    
    func setupSearchBar() {
        let searchResultsController = NewsListSearchViewController()
        searchController = UISearchController(searchResultsController: searchResultsController)
        searchController?.searchBar.searchBarStyle = .prominent
        searchController?.searchBar.placeholder = "NewsList_Search_Bar_Placeholder".localized
        searchController?.searchBar.sizeToFit()
        if let searchBarDelegate = searchResultsController.view as? UISearchBarDelegate {
            searchController?.searchBar.delegate = searchBarDelegate
            searchController?.delegate = searchResultsController
        }
        viewDelegate?.setSearchBar(searchController: searchController)
    }

    // MARK: View Hierarchy
    func setupViewHierarchy() {
        addSubview(tableView)
    }

    // MARK: View Constraints
    func setupViewConstraints() {
        
        NSLayoutConstraint.activate([
            tableView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - TableView
extension NewsListView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesListViewModel?.articleCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier, for: indexPath) as? ArticleTableViewCell else {
            return UITableViewCell()
        }
        
        let articleViewModel = articlesListViewModel?.articleAtIndex(indexPath: indexPath)
        cell.configure(viewModel: articleViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewDelegate?.handleArticleSelected()
    }
    
}

// MARK: - Refresh Control
extension NewsListView {
    
    @objc func refreshArticles() {
        viewDelegate?.handleRefreshArticles()
    }
    
}

// MARK: - SearchBar
extension NewsListView: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if let query = searchController.searchBar.text {
            //viewDelegate?.handleSearchBarInputText(query: query)
        }
    }
    
}
