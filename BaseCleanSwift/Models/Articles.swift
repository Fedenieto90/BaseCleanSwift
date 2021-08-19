//
//  Articles.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 18/08/2021.
//

import Foundation

struct ArticlesResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
}

