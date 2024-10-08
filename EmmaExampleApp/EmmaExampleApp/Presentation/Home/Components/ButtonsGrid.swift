//
//  ButtonsGrid.swift
//  EmmaExampleApp
//
//  Created by Salva Moreno on 8/10/24.
//

import SwiftUI

struct ButtonsGrid: View {
    
    var buttons: [ButtonModel]
    let numberOfColumns = 2
    let onClick: (String) -> Void
    
    var body: some View {
        VStack(spacing: 4) {
            ForEach(buttons.chunked(into: numberOfColumns), id: \.self) { rowItems in
                HStack(spacing: 4) {
                    ForEach(rowItems, id: \.self) { item in
                        EmmaButton(
                            active: item.active,
                            text: item.title
                        ) { onClick(item.title) }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    VStack(spacing: 16) {
        ButtonsGrid(
            buttons: [
                .init(title: "Start session", active: false)
            ]
        ) {_ in }
        ButtonsGrid(
            buttons: [
                .init(title: "Start session", active: false),
                .init(title: "Register user", active: true),
            ]
        ) {_ in }
        ButtonsGrid(
            buttons: [
                .init(title: "Start order", active: false),
                .init(title: "Add product", active: true),
                .init(title: "Track order", active: true),
            ]
        ) {_ in }
        ButtonsGrid(
            buttons: [
                .init(title: "Show adball", active: true),
                .init(title: "Show startview", active: true),
                .init(title: "Show strip", active: true),
                .init(title: "Show native ad", active: true),
            ]
        ) {_ in }
    }
}
