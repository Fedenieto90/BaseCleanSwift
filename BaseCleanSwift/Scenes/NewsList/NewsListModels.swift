//
//  NewsListModels.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 18/08/2021.
//

import UIKit

enum NewsList {

    enum ShowArticles {

        struct Request {
        }
        
        struct FetchArticlesRequest {
            var isRefreshing = false
            
            init(isRefreshing: Bool = false) {
                self.isRefreshing = isRefreshing
            }
        }

        struct Response {
            let articles: [Article]
        }

        struct ArticleViewModel {
            private let article: Article
            
            init(_ article: Article) {
                self.article = article
            }
            
            var title: String? {
                article.title
            }
            var description: String? {
                article.description
            }
            var urlToImage: String? {
                article.urlToImage
            }
        }

        struct ArticlesListViewModel {
            private let articles: [ArticleViewModel]
            
            init(_ articles: [ArticleViewModel]) {
                self.articles = articles
            }
            
            func articleCount() -> Int {
                return articles.count
            }
            
            func articleAtIndex(indexPath: IndexPath) -> ArticleViewModel {
                return articles[indexPath.row]
            }
        }

    }
}
