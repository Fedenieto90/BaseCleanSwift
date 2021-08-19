//
//  NewsListView.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 18/08/2021.
//

import UIKit

protocol NewsListViewDelegate: AnyObject {

//    func handleButtonPress()
    func handleArticleSelected(article: NewsList.Something.ArticleViewModel)
    func handleRefreshArticles()
}

class NewsListView: UIView {
    
    private struct ViewTraits {
    
        static let margin: CGFloat = 16
        static let estimatedRowHeight: CGFloat = 300
    }
    
    // MARK: Views
    
    private let tableView = UITableView()
    private let refreshControl = UIRefreshControl()
    private var articles = [NewsList.Something.ArticleViewModel]()
    
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
    
    // MARK: Display
    
    func setData(articles: [NewsList.Something.ArticleViewModel]) {
        self.articles = articles
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
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier, for: indexPath) as? ArticleTableViewCell else {
            return UITableViewCell()
        }
        let article = articles[indexPath.row]
        cell.article = article
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        viewDelegate?.handleArticleSelected(article: article)
    }
    
}

// MARK: - Refresh Control
extension NewsListView {
    
    @objc func refreshArticles() {
        viewDelegate?.handleRefreshArticles()
    }
    
}
