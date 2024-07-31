//
//  HomeView.swift
//  NewsApp
//
//  Created by Kerem on 25.07.2024.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel = NewsViewModel()

    var body: some View {
        NavigationStack {
                    List(viewModel.articles) { article in
                        NavigationLink(destination: DetailView(article: article)) {
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
                                }
                               
                                
                                if let description = article.description {
                                    Text(description)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                
                                if let author = article.author {
                                    Text("By \(author)")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                
                                if let publishedAt = article.publishedAt {
                                    Text(publishedAt)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding()
                        }
                    }
                    .navigationTitle("Bitcoin News")
                }
                .onAppear {
                    Task {
                        await  viewModel.fetchNews()
                    }
                 
                }
            }
        }

#Preview {
    HomeView()
}
