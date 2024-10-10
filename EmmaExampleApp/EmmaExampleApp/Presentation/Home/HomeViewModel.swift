//
//  HomeViewModel.swift
//  EmmaExampleApp
//
//  Created by Salva Moreno on 10/10/24.
//

import Foundation
import EMMA_iOS

final class HomeViewModel: ObservableObject {
    // MARK: - Properties -
    @Published var deeplink: String = ""
    
    // MARK: - Functions -
    func register(userId: String, mail: String) {
        EMMA.registerUser(userId: userId, forMail: mail, andExtras: nil)
    }
}
