//
//  MainItemData.swift
//  EmmaExampleApp
//
//  Created by Salva Moreno on 8/10/24.
//

import Foundation

struct MainItemData: Identifiable {
    let id: String = UUID().uuidString
    
    let title: String
    let description: String?
    let statusInfo: String?
    let buttons: [ButtonModel]?
}

let mainData: [MainItemData] = [
    .init(
        title: "Register User",
        description: nil,
        statusInfo: nil,
        buttons: [
            .init(title: "Register user", active: true)
        ]
    ),
    .init(
        title: "Log in User",
        description: nil,
        statusInfo: nil,
        buttons: [
            .init(title: "Log in user", active: true)
        ]
    ),
    .init(
        title: "Events and Extras",
        description: "These buttons do not have UI feedback.",
        statusInfo: nil,
        buttons: [
            .init(title: "Track event", active: true),
            .init(title: "Add user tag 'tag'", active: true),
        ]
    ),
    .init(
        title: "In-App Communication",
        description: "Try our in-app communications.",
        statusInfo: nil,
        buttons: [
            .init(title: "Show adball", active: true),
            .init(title: "Show startview", active: true),
            .init(title: "Show strip", active: true),
            .init(title: "Show native ad", active: true),
        ]
    ),
    .init(
        title: "Orders and Products",
        description: "Track your orders.",
        statusInfo: nil,
        buttons: [
            .init(title: "Start order", active: true),
            .init(title: "Add product", active: true),
            .init(title: "Track order", active: true),
            .init(title: "Cancel order", active: true),
        ]
    ),
    .init(
        title: "IDFA and iOS",
        description: "Request tracking with IDFA for iOS devices.",
        statusInfo: nil,
        buttons: [
            .init(title: "Request idfa tracking", active: true)
        ]
    ),
    .init(
        title: "Learn More",
        description: "Read the docs to discover what to do next:",
        statusInfo: nil,
        buttons: nil
    ),
]
