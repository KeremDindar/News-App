//
//  ViewModel.swift
//  NewsApp
//
//  Created by Kerem on 25.07.2024.
//

import Foundation
import SwiftUI

class NewsViewModel: ObservableObject {
    
    let apiKey = "9492c7802ac0463780e3f92630ae384e"
    let query = "bitcoin"
    
    @Published var articles: [Article] = []

    
    
    @MainActor
    func fetchNews() async {
        let urlString = "https://newsapi.org/v2/everything?q=\(query)&apiKey=\(apiKey)"
        guard let url = URL(string: urlString) else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
            self.articles = decodedResponse.articles
        } catch {
            print("Decoding error: \(error)")
        }
    }
}


