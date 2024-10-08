//
//  LearnMoreItem.swift
//  EmmaExampleApp
//
//  Created by Salva Moreno on 7/10/24.
//

import SwiftUI

struct LearnMoreItem: View {
    
    var title: String
    var description: String
    var link: String
    
    var body: some View {
        NavigationLink(destination: {
            if let url = URL(string: link) {
                WebView(url: url)
                    .navigationTitle(title)
                    .navigationBarTitleDisplayMode(.inline)
                    .edgesIgnoringSafeArea(.all)
            }
        }) {
            VStack(alignment: .leading, spacing: 0) {
                Divider()
                HStack(spacing: 0) {
                    Text(title)
                        .foregroundStyle(Color.emmaDark)
                        .layoutPriority(0.5)
                        .frame(maxWidth: 125, alignment: .leading)
                    Text(description)
                        .foregroundStyle(Color.gray)
                        .layoutPriority(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .font(.system(size: 17))
                .padding(.vertical, 16)
            }
        }
    }
}

#Preview {
    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0) {
        LearnMoreItem(
            title: "EMMA SDK",
            description: "Documentation & Support",
            link: "https://developer.emma.io/es/home"
        )
        LearnMoreItem(
            title: "iOS",
            description: "EMMA SDK for iOS",
            link: "https://developer.emma.io/es/home"
        )
        LearnMoreItem(
            title: "Android",
            description: "EMMA SDK for Android",
            link: "https://developer.emma.io/es/home"
        )
    }
}
