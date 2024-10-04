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
            
            // HEADER
            header
                .ignoresSafeArea()
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
    .frame(height: 275)
}

#Preview {
    HomeView()
}
