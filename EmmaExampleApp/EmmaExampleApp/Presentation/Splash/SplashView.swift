//
//  SplashView.swift
//  EmmaExampleApp
//
//  Created by Salva Moreno on 16/10/24.
//

import SwiftUI

struct SplashView: View {
    // MARK: - Properties -
    @EnvironmentObject private var routeViewModel: RouteViewModel
    @State private var isAnimating = false
    
    // MARK: - Main -
    var body: some View {
        ZStack {
            Color.emmaDark.ignoresSafeArea()
            
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .scaleEffect(isAnimating ? 1.5 : 0.5)
                .rotationEffect(.degrees(isAnimating ? 0 : 1800))
                .animation(.easeInOut(duration: 1.5), value: isAnimating)
                .onAppear {
                    isAnimating = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        routeViewModel.screen = .home
                    }
                }
        }
    }
}

#Preview {
    SplashView()
        .environmentObject(RouteViewModel())
}
