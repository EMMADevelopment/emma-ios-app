//
//  RouteView.swift
//  EmmaExampleApp
//
//  Created by Salva Moreno on 14/10/24.
//

import SwiftUI

struct RouteView: View {
    // MARK: - Properties -
    @EnvironmentObject var routeViewModel: RouteViewModel
    
    // MARK: - Main -
    var body: some View {
        switch routeViewModel.screen {
            case .splash:
                SplashView()
            case .home:
                HomeView()
            case .nativeAd:
                NativeAdView()
        }
    }
}

#Preview {
    RouteView()
        .environmentObject(RouteViewModel())
}
