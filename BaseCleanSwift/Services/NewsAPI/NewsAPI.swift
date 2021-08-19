//
//  WebService.swift
//  BaseMVPProject
//
//  Created by Federico Nieto on 13/10/2020.
//  Copyright © 2020 Rocket Insights. All rights reserved.
//

import UIKit
import Alamofire

typealias GetArticlesCompletionHandler = (_ articles: Result<[Article], Error>) -> Void

protocol ArticleRepository {
    func getArticles(completion: @escaping GetArticlesCompletionHandler)
}

class NewsAPI: ArticleRepository {
    
    var baseUrl = "https://newsapi.org/v2"
    var apiKey = "09e526b26846490991d2bea65155d945"
    
    func getArticles(completion: @escaping GetArticlesCompletionHandler) {
        
        let topHeadlinesPath = "/top-headlines?country=us&apiKey="
        let topHeadlinesUrl = URL(string: baseUrl+topHeadlinesPath+apiKey)!
        
        AF.request(topHeadlinesUrl).validate().responseDecodable(of: ArticlesResponse.self) { response in
            switch response.result {
            case .success(let articlesResponse):
                completion(.success(articlesResponse.articles))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
