//
//  Data.swift
//  NewsApp
//
//  Created by Kerem on 25.07.2024.
//

import Foundation
import SwiftUI


struct Article:  Identifiable, Codable {
    var id: UUID { UUID() }  // Geçici bir ID, API'den gelen ID kullanılabilir
    let title: String?
    let name: String?
    let description: String?
    let urlToImage: String?
    let author: String?
    let url: String?
    let content: String?
    let publishedAt: String?

}

struct NewsResponse: Codable {
    let articles: [Article]
}



