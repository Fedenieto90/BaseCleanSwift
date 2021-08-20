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

    }
}
