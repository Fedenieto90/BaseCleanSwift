//
//  NewsMockAPI.swift
//  BaseCleanSwiftTests
//
//  Created by Federico Nieto on 20/08/2021.
//

@testable import BaseCleanSwift

class NewsMockAPI: ArticleRepository {
    
    var success = true
    
    init(success: Bool) {
        self.success = success
    }
    
    func getArticles(completion: @escaping GetArticlesCompletionHandler) {
        if success {
            completion(.success([Article(author: "Author Test", title: "Title Test", description: "Description Test", urlToImage: "urlToImage Test")]))
        } else {
            completion(.failure(BaseCleanSwiftError.unknown))
        }
    }
    
    func searchArticles(query: String, completion: @escaping GetArticlesCompletionHandler) {
        if success {
            completion(.success([Article(author: "Author Test", title: "Title Test", description: "Description Test", urlToImage: "urlToImage Test")]))
        } else {
            completion(.failure(BaseCleanSwiftError.unknown))
        }
    }
    
}
