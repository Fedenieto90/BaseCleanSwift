//
//  NewsAPI+Articles.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 19/08/2021.
//

import Foundation
import Alamofire

enum NewsAPILanguageCountry: String {
    case us = "us"
    case ar = "ar"
}

extension NewsAPI {
    
    fileprivate struct Constants {
        struct path {
            static let topHeadlines = "/top-headlines?country=\(Locale.current.getLanguageCode())&apiKey="
        }
    }
    
    func getArticles(completion: @escaping GetArticlesCompletionHandler) {
        
        let topHeadlinesPath = Constants.path.topHeadlines
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
