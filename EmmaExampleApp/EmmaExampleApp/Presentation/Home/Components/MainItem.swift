//
//  MainItem.swift
//  EmmaExampleApp
//
//  Created by Salva Moreno on 8/10/24.
//

import SwiftUI

struct MainItem: View {
    
    let title: String
    let description: String?
    let statusInfo: String?
    let buttons: [ButtonModel]?
    let onClick: (String) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(title)
                    .font(.system(size: 26, weight: .bold))
                Spacer()
                if let status = statusInfo {
                    Text(status)
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }
            }

            if let desc = description {
                Text(desc)
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
            }

            if let btns = buttons {
                ButtonsGrid(
                    buttons: btns,
                    onClick: onClick
                )
                .padding(.top, 4)
            }
        }
        .padding(.bottom, 16)
        .padding(.horizontal, 16)
    }
}

#Preview {
    LazyVStack {
        MainItem(
            title: "Deeplink",
            description: "Received deeplink will be displayed here.",
            statusInfo: "No deeplink",
            buttons: nil,
            onClick: {_ in }
        )
        MainItem(
            title: "Session",
            description: "Session is required. Usually, it should be triggered when the App is ready.",
            statusInfo: "Session started",
            buttons: [
                .init(title: "Start session", active: false)
            ],
            onClick: {_ in }
        )
        MainItem(
            title: "Register User",
            description: nil,
            statusInfo: nil,
            buttons: [
                .init(title: "Register user", active: true)
            ],
            onClick: {_ in }
        )
        MainItem(
            title: "Events and Extras",
            description: "These buttons do not have UI feedback",
            statusInfo: nil,
            buttons: [
                .init(title: "Tack event", active: true),
                .init(title: "Add user tag 'tag'", active: true)
            ],
            onClick: {_ in }
        )
        MainItem(
            title: "In-App Communication",
            description: "Try our in-app communications:",
            statusInfo: nil,
            buttons: [
                .init(title: "Show adball", active: true),
                .init(title: "Show startview", active: true),
                .init(title: "Show strip", active: true),
                .init(title: "Show native ad", active: true),
            ],
            onClick: {_ in }
        )
    }
}
