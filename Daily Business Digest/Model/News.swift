//
//  File.swift
//  Daily Business Digest
//
//  Created by Mohammed Hossain on 2/24/21.
//

import Foundation

// Data model for JSON
struct News: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}



