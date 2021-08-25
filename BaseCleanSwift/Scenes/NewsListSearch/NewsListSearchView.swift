//
//  NewsListSearchView.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 23/08/2021.
//

import UIKit

protocol NewsListSearchViewDelegate: AnyObject {
    func handleSearchBarInputText(query: String)
    func handleArticleSelected()
}

class NewsListSearchView: UIView {
    
    private struct ViewTraits {
    
        static let margin: CGFloat = 16
        static let estimatedRowHeight: CGFloat = 300
    }
    
    // MARK: Views
    
    let tableView = UITableView()
    var articlesListViewModel: NewsListSearch.Search.ArticlesListViewModel?
    
    
    // MARK: Parameters

    public weak var viewDelegate: NewsListSearchViewDelegate?
    
    // MARK: Init
    override init(frame: CGRect) {
    
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {

        super.init(coder: coder)
        setup()
    }
    
    // MARK: Display
    
    func setData(articles: NewsListSearch.Search.ArticlesListViewModel) {
        self.articlesListViewModel = articles
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - Setup
private extension NewsListSearchView {

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
//        backgroundColor = .white
    }
    
    func setupTableView() {
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ArticleSearchTableViewCell.self, forCellReuseIdentifier: ArticleSearchTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = ViewTraits.estimatedRowHeight
        tableView.rowHeight = UITableView.automaticDimension
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
extension NewsListSearchView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesListViewModel?.articleCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleSearchTableViewCell.identifier, for: indexPath) as? ArticleSearchTableViewCell else {
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

// MARK: - UISearchResultsUpdating
extension NewsListSearchView: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let query = searchBar.text {
            viewDelegate?.handleSearchBarInputText(query: query)
        }
    }
    
}
