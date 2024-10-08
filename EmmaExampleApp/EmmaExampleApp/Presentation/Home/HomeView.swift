//
//  HomeView.swift
//  EmmaExampleApp
//
//  Created by Salva Moreno on 4/10/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.white.ignoresSafeArea()
            
            NavigationView {
                ScrollView(.vertical) {
                    LazyVStack {
                        // HEADER
                        header
                        
                        // FOOTER
                        footer
                    }
                    .background(Color.white)
                }
                .scrollIndicators(.hidden)
                .ignoresSafeArea()
                .background(Color.emmaDark)
            }
        }
    }
}

private var header: some View {
    ZStack {
        Color.emmaDark
        
        ZStack {
            Image("Logo")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 200)
                .padding()
                .scaleEffect(1.9)
                .opacity(0.2)
                .offset(x: 9, y: 8)
                .padding(.top, 42)
                .clipped()
            VStack(
                alignment: .center,
                spacing: -5
            ) {
                Text("Welcome to")
                Text("EMMA")
            }
            .padding(.top, 80)
            .foregroundStyle(Color.white)
            .font(.system(size: 45, weight: .bold))
            .lineLimit(1)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

private var footer: some View {
    VStack(spacing: 0) {
        ForEach(learnMoreData) {
            LearnMoreItem(
                title: $0.title,
                description: $0.description,
                link: $0.link
            )
        }
    }
    .padding(.horizontal, 30)
    .padding(.vertical, 6)
}

#Preview {
    HomeView()
}
