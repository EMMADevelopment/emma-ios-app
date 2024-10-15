//
//  RouteViewModel.swift
//  EmmaExampleApp
//
//  Created by Salva Moreno on 14/10/24.
//

import Foundation

final class RouteViewModel: ObservableObject {
    // MARK: - Properties
    @Published var screen: RoutingStatus.Screen = .home
}
