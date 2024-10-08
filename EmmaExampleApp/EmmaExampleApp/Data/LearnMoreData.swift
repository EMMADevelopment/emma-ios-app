//
//  LearnMoreData.swift
//  EmmaExampleApp
//
//  Created by Salva Moreno on 7/10/24.
//

import Foundation

struct LearnMoreData: Identifiable {
    let id: String = UUID().uuidString
    
    let title: String
    let description: String
    let link: String
}

let learnMoreData: [LearnMoreData] = [
    .init(
        title: "EMMA SDK",
        description: "Documentation & Support",
        link: "https://developer.emma.io/es/home"
    ),
    .init(
        title: "iOS",
        description: "EMMA SDK for iOS",
        link: "https://github.com/EMMADevelopment/eMMa-iOS-SDK"
    ),
    .init(
        title: "Android",
        description: "EMMA SDK for Android",
        link: "https://github.com/EMMADevelopment/emma-android-sdk"
    ),
    .init(
        title: "Cordova",
        description: "EMMA SDK for Cordova",
        link: "https://github.com/EMMADevelopment/Cordova-Plugin-EMMA-SDK"
    ),
    .init(
        title: "Ionic",
        description: "EMMA SDK for Ionic",
        link: "https://github.com/EMMADevelopment/EMMAIonicExample"
    ),
    .init(
        title: "Flutter",
        description: "EMMA SDK for Flutter",
        link: "https://github.com/EMMADevelopment/emma_flutter_sdk"
    ),
    .init(
        title: "Xamarin",
        description: "EMMA SDK for Xamarin",
        link: "https://github.com/EMMADevelopment/EMMA-Xamarin-SDK"
    ),
]
