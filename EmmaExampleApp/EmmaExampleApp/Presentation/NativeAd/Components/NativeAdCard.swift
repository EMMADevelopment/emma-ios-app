//
//  NativeAdCard.swift
//  EmmaExampleApp
//
//  Created by Salva Moreno on 15/10/24.
//

import SwiftUI

struct NativeAdCard: View {
    // MARK: - Properties -
    let title: String
    let subtitle: String
    let imageUrl: String
    let onClick: () -> Void

    // MARK: - Main -
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.black.opacity(0.7), Color.clear]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
            } placeholder: {
                ZStack {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 125, height: 100)
                        .padding(.vertical, 16)
                        .padding(.horizontal, 16)
                        .scaledToFill()
                        .foregroundStyle(Color.emmaLight)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.emmaDark)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(0.7), Color.clear]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
            .frame(height: 175)
            .clipped()

            ZStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .padding(.horizontal, 16)
                        .padding(.top, 6)
                    
                    Text(subtitle)
                        .font(.system(size: 13))
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .padding(.horizontal, 16)
                        .padding(.top, 2)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 175)
        .background(Color.clear)
        .cornerRadius(10)
        .shadow(radius: 6)
        .onTapGesture {
            onClick()
        }
    }
}

#Preview {
    VStack {
        NativeAdCard(title: "Title 1", subtitle: "Subtitle 1", imageUrl: "", onClick: {})
        NativeAdCard(title: "Title 2", subtitle: "Subtitle 2", imageUrl: "https://picsum.photos/200/300", onClick: {})
        NativeAdCard(title: "Title 3", subtitle: "Subtitle 3", imageUrl: "https://picsum.photos/200/300", onClick: {})
    }
}
