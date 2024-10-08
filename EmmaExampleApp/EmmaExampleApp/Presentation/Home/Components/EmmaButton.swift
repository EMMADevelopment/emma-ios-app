//
//  EmmaButton.swift
//  EmmaExampleApp
//
//  Created by Salva Moreno on 8/10/24.
//

import SwiftUI

struct EmmaButton: View {
    
    var active: Bool
    var text: String
    let onClick: () -> Void
    
    var body: some View {
        Button(action: {
            onClick()
        }) {
            ZStack {
                Text(text)
                    .textCase(.uppercase)
                    .foregroundStyle(Color.white)
                    .bold()
            }
            .frame(height: 44)
            .frame(maxWidth: .infinity)
            .background(active ? Color.emmaDark : Color.emmaLight)
        }
        .disabled(!active)
    }
}

#Preview {
    VStack {
        EmmaButton(
            active: true,
            text: "Start session"
        ) {}
        EmmaButton(
            active: false,
            text: "Register user"
        ) {}
    }
}
