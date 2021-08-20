//
//  NewsDetailModels.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 18/08/2021.
//

import UIKit

enum NewsDetail {

    enum Something {

        struct Request {
        }

        struct Response {
        }

        struct ViewModel {
        }
        
        struct ArticleDetailViewModel {
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
            var author: String? {
                article.author
            }
        }
    }
}
