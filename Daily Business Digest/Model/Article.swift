//
//  Article.swift
//  Daily Business Digest
//
//  Created by Mohammed Hossain on 2/24/21.
//

import Foundation

// Data model for JSON array
struct Article: Codable {
    let author: String?
    let title: String?
    let articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

    // Map JSON keys to custom property names
    enum CodingKeys: String, CodingKey {
        case author
        case title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
 
 
}
