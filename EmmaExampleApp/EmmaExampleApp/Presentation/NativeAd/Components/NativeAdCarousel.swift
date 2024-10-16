//
//  NativeAdCarousel.swift
//  EmmaExampleApp
//
//  Created by Salva Moreno on 15/10/24.
//

import SwiftUI
import EMMA_iOS

struct NativeAdCarousel: View {
    let nativeAds: [EMMANativeAd]
    let onClick: (Int) -> Void
    
    var xDistance: Int = 150
        
    @State private var snappedItem = 0.0
    @State private var draggingItem = 1.0
    @State private var activeIndex: Int = 0
    
    var body: some View {
        ZStack {
            ForEach(0..<nativeAds.count, id: \.self) { index in
                let content = nativeAds[index].nativeAdContent as? [String:AnyObject]
                let title = content?["Title"] as? String
                let subtitle = content?["Subtitle"] as? String
                let image = content?["Main picture"] as? String
                
                CardContent(id: index, title: title ?? "Title", subtitle: subtitle ?? "Subtitle", imageUrl: image ?? "", onClick: {
                    onClick(index)
                })
                .scaleEffect(1.0 - abs(distance(index)) * 0.2)
                .opacity(1.0 - abs(distance(index)) * 0.3)
                .offset(x: getOffset(index), y: 0)
                .zIndex(1.0 - abs(distance(index)) * 0.1)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    draggingItem = snappedItem + value.translation.width / 400
                }
                .onEnded { value in
                    withAnimation {
                        draggingItem = snappedItem + value.predictedEndTranslation.width / 400
                        draggingItem = round(draggingItem).remainder(dividingBy: Double(nativeAds.count))
                        snappedItem = draggingItem
                        self.activeIndex = nativeAds.count + Int(draggingItem)
                        if self.activeIndex > nativeAds.count || Int(draggingItem) >= 0 {
                            self.activeIndex = Int(draggingItem)
                        }
                    }
                }
        )
        
    }
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item).remainder(dividingBy: Double(nativeAds.count)))
    }
    
    func getOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(nativeAds.count) * distance(item)
        return sin(angle) * Double(xDistance)
        
    }
}

struct CardContent: View {
    let id: Int
    let title: String
    let subtitle: String
    let imageUrl: String
    let onClick: () -> Void
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: imageUrl)) { image in
                image
                    .resizable()
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
            .clipped()

            ZStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .padding(.top, 6)
                    
                    Text(subtitle)
                        .font(.system(size: 13))
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .padding(.top, 2)
                }
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .frame(width: 300, height: 500)
        .background(Color.clear)
        .cornerRadius(10)
        .shadow(radius: 6)
        .onTapGesture {
            onClick()
        }
    }
}

#Preview {
    ScrollView {
        VStack {
            CardContent(id: 1, title: "Title", subtitle: "Subtitle", imageUrl: "") {
                // Action
            }
            CardContent(id: 1, title: "Title", subtitle: "Subtitle", imageUrl: "https://picsum.photos/200/300") {
                // Action
            }
        }
    }
    .scrollIndicators(.hidden)
}
