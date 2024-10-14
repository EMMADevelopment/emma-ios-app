//
//  NativeAdView.swift
//  EmmaExampleApp
//
//  Created by Salva Moreno on 14/10/24.
//

import SwiftUI

struct NativeAdView: View {
    // MARK: - Properties -
    @StateObject private var nativeAdViewModel: NativeAdViewModel = NativeAdViewModel()
    
    // MARK: - Main -
    var body: some View {
        Group {
            if nativeAdViewModel.isLoading {
                loadingView
            } else {
                let content = nativeAdViewModel.nativeAdReceived?.nativeAdContent as? [String:AnyObject]
                let title = content?["Title"] as? String
                let image = content?["Main picture"] as? String
                let cta = content?["CTA"] as? String
                
                VStack {
                    Text(title ?? "No hay título")
                    Text(image ?? "No hay imagen")
                    Text(cta ?? "No hay cta")
                }
            }
        }
        .onAppear(perform: {
            nativeAdViewModel.callForGettingNativeAds()
        })
    }
}

private var loadingView: some View {
    ZStack {
        Color.emmaMedium.ignoresSafeArea()
        
        ProgressView()
            .controlSize(.large)
    }
}

#Preview {
    NativeAdView()
}
