//
//  NativeAdView.swift
//  EmmaExampleApp
//
//  Created by Salva Moreno on 14/10/24.
//

import SwiftUI

struct NativeAdView: View {
    // MARK: - Properties -
    @EnvironmentObject private var routeViewModel: RouteViewModel
    @StateObject private var nativeAdViewModel: NativeAdViewModel = NativeAdViewModel()
    
    // MARK: - Main -
    var body: some View {
        NavigationStack {
            Group {
                if nativeAdViewModel.isLoading {
                    loadingView
                } else {
                    let content = nativeAdViewModel.nativeAdReceived?.nativeAdContent as? [String:AnyObject]
                    let title = content?["Title"] as? String
                    let image = content?["Main picture"] as? String
                    let cta = content?["CTA"] as? String
                    
                    NavigationStack {
                        VStack {
                            Text(title ?? "No hay título")
                            Text(image ?? "No hay imagen")
                            Text(cta ?? "No hay cta")
                        }
                        .navigationTitle("NativeAds")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button(action: {
                                    routeViewModel.screen = .home
                                }, label: {
                                    HStack(spacing: 5) {
                                        Image(systemName: "chevron.left")
                                            .fontWeight(.medium)
                                        Text("Back")
                                    }
                                })
                            }
                        }
                    }
                }
            }
            .onAppear(perform: {
                nativeAdViewModel.callForGettingNativeAds()
            })
        }
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
