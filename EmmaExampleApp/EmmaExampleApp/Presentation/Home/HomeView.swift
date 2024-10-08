//
//  HomeView.swift
//  EmmaExampleApp
//
//  Created by Salva Moreno on 4/10/24.
//

import SwiftUI

struct HomeView: View {
    
    let sessionStarted: Bool
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.white.ignoresSafeArea()
            
            NavigationView {
                ScrollView(.vertical) {
                    LazyVStack {
                        // HEADER
                        header
                        
                        // DEEPLINK
                        deeplinkSection
                        
                        // SESSION
                        sessionSection(sessionStarted: sessionStarted)
                        
                        // THE OTHER SECTIONS
                        otherSections
                        
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

private func manageButtonClick(buttonTitle: String) {
    switch buttonTitle {
        case "Start session":
            print("START SESSION")
        case "Register user":
            print("REGISTER USER")
        case "Log in user":
            print("LOG IN USER")
        case "Track event":
            print("TRACK EVENT")
        case "Add user tag 'tag'":
            print("ADD USER TAG 'TAG'")
        case "Show adball":
            print("SHOW ADBALL")
        case "Show startview":
            print("SHOW STARTVIEW")
        case "Show strip":
            print("SHOW STRIP")
        case "Show native ad":
            print("SHOW NATIVE AD")
        case "Start order":
            print("START ORDER")
        case "Add product":
            print("ADD PRODUCT")
        case "Track order":
            print("TRACK ORDER")
        case "Cancel order":
            print("CANCEL ORDER")
        case "Request idfa tracking":
            print("REQUEST IDFA TRACKING")
        default:
            print("Button not found!")
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

private var deeplinkSection: some View {
    MainItem(
        title: "Deeplink",
        description: "Received deeplink will be displayed here",
        statusInfo: "No deeplink",
        buttons: nil,
        onClick: {_ in }
    )
    .padding(.top, 16)
}

private func sessionSection(sessionStarted: Bool) -> some View {
    if sessionStarted {
        MainItem(
            title: "Session",
            description: "Session is required. Usually, it should be triggered when the App is ready.",
            statusInfo: "Session started",
            buttons: [
                .init(title: "Start session", active: false)
            ],
            onClick: {_ in }
        )
    } else {
        MainItem(
            title: "Session",
            description: "Session is required. Usually, it should be triggered when the App is ready.",
            statusInfo: "Session not started",
            buttons: [
                .init(title: "Start session", active: true)
            ],
            onClick: {_ in print("Click on START SESSION when EMMA is not initialized") }
        )
    }
}

private var otherSections: some View {
    ForEach(mainData) {
        MainItem(
            title: $0.title,
            description: $0.description,
            statusInfo: $0.statusInfo,
            buttons: $0.buttons
        ) {
            manageButtonClick(buttonTitle: $0)
        }
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
    HomeView(sessionStarted: true)
}
