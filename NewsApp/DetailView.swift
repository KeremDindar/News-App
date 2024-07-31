//
//  DetailView.swift
//  NewsApp
//
//  Created by Kerem on 25.07.2024.
//

import SwiftUI

import SwiftUI

struct DetailView: View {
    let article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                }
                if let title = article.title {
                    Text(title)
                        .font(.headline)
                        .padding(.bottom, 2)
                }
               
                
                if let author = article.author {
                    Text("By \(author)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom, 2)
                }
                
                if let publishedAt = article.publishedAt {
                    Text(publishedAt)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.bottom, 2)
                }
                
                if let description = article.description {
                    Text(description)
                        .font(.body)
                        .padding(.bottom, 2)
                }
                
                if let content = article.content {
                    Text(content)
                        .font(.body)
                        .padding(.bottom, 2)
                }
                
                if let url = article.url, let articleUrl = URL(string: url) {
                    Link("Read full article", destination: articleUrl)
                        .padding(.top, 10)
                        .foregroundColor(.blue)
                }
            }
            .padding()
        }
        .navigationTitle("Article Details")
    }
}


