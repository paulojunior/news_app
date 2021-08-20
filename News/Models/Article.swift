//
//  Article.swift
//  News
//
//  Created by Junior Ferreira on 19/08/21.
//

import Foundation

struct ArticlesList: Decodable {
    let articles: [Article]
}

extension ArticlesList {
    static var all: Resource<ArticlesList> = {
       let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=42c9f103af864d26b78d8c8e7c17196a")
        return Resource(url: url)
    }()
}

struct Article: Decodable {
    let title: String
    let description: String
}
