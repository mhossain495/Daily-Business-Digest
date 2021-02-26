//
//  Article.swift
//  Daily Business Digest
//
//  Created by Mohammed Hossain on 2/24/21.
//

import Foundation

struct Article: Codable {
    let title: String?
    let articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: Date?
    let content: String?

    // Map JSON keys to custom property names
    enum CodingKeys: String, CodingKey {
        case title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}
