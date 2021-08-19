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

struct Article: Decodable {
    let title: String
    let description: String
}
