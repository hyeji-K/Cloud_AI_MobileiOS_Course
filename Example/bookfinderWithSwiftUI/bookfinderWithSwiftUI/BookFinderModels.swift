//
//  BookFinderModels.swift
//  bookfinderWithSwiftUI
//
//  Created by Khyeji on 2021/11/16.
//

import Foundation

struct Book: Codable, Hashable {
    var title: String
    var publisher: String
    var authors: [String]
    var thumbnail: String
    var url: String
    var price: Int
}

struct SResult: Codable {
    var books: [Book]
    
    enum CodingKeys: String, CodingKey {
        case books = "documents"
    }
}
