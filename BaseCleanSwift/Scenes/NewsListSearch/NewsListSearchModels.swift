//
//  NewsListSearchModels.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 23/08/2021.
//

import UIKit

enum NewsListSearch {

    enum Search {

        struct SearchArticlesRequest {
            var query = ""
            
            init(query: String) {
                self.query = query
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
