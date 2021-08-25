//
//  WebService.swift
//  BaseMVPProject
//
//  Created by Federico Nieto on 13/10/2020.
//  Copyright © 2020 Rocket Insights. All rights reserved.
//

import UIKit

typealias GetArticlesCompletionHandler = (_ articles: Result<[Article], Error>) -> Void

protocol ArticleRepository {
    func getArticles(completion: @escaping GetArticlesCompletionHandler)
    func searchArticles(query: String, completion: @escaping GetArticlesCompletionHandler)
}

class NewsAPI: ArticleRepository {
    
    fileprivate struct Constants {
        struct keys {
            static let apiKey = "09e526b26846490991d2bea65155d945"
        }
        struct url {
            static let baseUrl = "https://newsapi.org/v2"
        }
    }
    
    var baseUrl = Constants.url.baseUrl
    var apiKey = Constants.keys.apiKey
    
}
