//
//  HomeView.swift
//  EmmaExampleApp
//
//  Created by Salva Moreno on 4/10/24.
//

import SwiftUI
import EMMA_iOS

struct HomeView: View {
    // MARK: - Properties -
    @EnvironmentObject private var routeViewModel: RouteViewModel
    @StateObject private var homeViewModel: HomeViewModel = HomeViewModel()
    let sessionStarted: Bool = EMMA.isSessionStarted()
    
    
    // MARK: - Main -
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
                        otherSections(homeViewModel: homeViewModel, routeViewModel: routeViewModel)
                        
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

private func manageButtonClick(buttonTitle: String, homeViewModel: HomeViewModel, routeViewModel: RouteViewModel) {
    switch buttonTitle {
        case "Start session":
            print("START SESSION")
        case "Register user":
            print("REGISTER USER")
            homeViewModel.register(userId: "654321", mail: "testSalva@emma.io")
        case "Log in user":
            print("LOG IN USER")
            homeViewModel.login(userId: "654321", mail: "testSalva@emma.io")
        case "Track event":
            print("TRACK EVENT")
            let attributes: [String:String] = ["AttributeTest":"EventTestSalva"]
            homeViewModel.trackEvent(token: "a6638efafbe61f63ee3fe31d7db476d4", attributes: attributes)
        case "Add user tag 'tag'":
            print("ADD USER TAG 'TAG'")
            let tags: [String:String] = ["TAG": "TEST SALVA"]
            homeViewModel.addUserTag(tags: tags)
        case "Show adball":
            print("SHOW ADBALL")
            homeViewModel.getAdBall()
        case "Show startview":
            print("SHOW STARTVIEW")
            homeViewModel.getStartView()
        case "Show strip":
            print("SHOW STRIP")
            homeViewModel.getStrip()
        case "Show native ad":
            print("SHOW NATIVE AD")
            routeViewModel.screen = .nativeAd
        case "Start order":
            print("START ORDER")
            homeViewModel.startOrder(orderId: "<ORDER_ID_SALVA_TEST>", customerId: "<CUSTOMER_ID_SALVA_TEST", totalPrice: 13.03)
        case "Add product":
            print("ADD PRODUCT")
            homeViewModel.addProduct(productId: "<PRODUCT_ID_SALVA_TEST>", name: "<PRODUCT_NAME_SALVA_TEST>", qty: 1.0, price: 13.03)
        case "Track order":
            print("TRACK ORDER")
            homeViewModel.trackOrder()
        case "Cancel order":
            print("CANCEL ORDER")
            homeViewModel.cancelTransaction(orderId: "<ORDER_ID_SALVA_TEST>")
        case "Request idfa tracking":
            print("REQUEST IDFA TRACKING")
            homeViewModel.trackWithIdfa()
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
            onClick: {_ in print("EMMA is not initialized") }
        )
    }
}

private func otherSections(
    homeViewModel: HomeViewModel,
    routeViewModel: RouteViewModel
) -> some View {
    ForEach(mainData) {
        MainItem(
            title: $0.title,
            description: $0.description,
            statusInfo: $0.statusInfo,
            buttons: $0.buttons
        ) {
            manageButtonClick(buttonTitle: $0, homeViewModel: homeViewModel, routeViewModel: routeViewModel)
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
    HomeView()
        .environmentObject(RouteViewModel())
}
