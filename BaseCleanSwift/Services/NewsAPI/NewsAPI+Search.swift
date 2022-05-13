//
//  NewsAPI+Search.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 23/08/2021.
//

import Foundation
import Alamofire

extension NewsAPI {
    
    fileprivate struct Constants {
        struct path {
            static let searchFormat = "/everything?q=%@&apiKey="
        }
    }
    
    func searchArticles(query: String, completion: @escaping GetArticlesCompletionHandler) {
        
        let searchPath = String(format: Constants.path.searchFormat, query).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let searchUrl = URL(string: baseUrl+searchPath+apiKey)!
        
        AF.request(searchUrl).validate().responseDecodable(of: ArticlesResponse.self) { response in
            switch response.result {
            case .success(let articlesResponse):
                completion(.success(articlesResponse.articles))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
