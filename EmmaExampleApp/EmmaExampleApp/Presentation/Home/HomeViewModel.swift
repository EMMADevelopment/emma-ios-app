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
    // Enviar información sobre los registros en la aplicación
    func register(userId: String, mail: String) {
        EMMA.registerUser(userId: userId, forMail: mail, andExtras: nil)
    }
    
    // Enviar información sobre los eventos login
    func login(userId: String, mail: String) {
        EMMA.loginUser(userId: userId, forMail: mail, andExtras: nil)
    }
    
    // Iniciar la transacción
    func startOrder(orderId: String, customerId: String, totalPrice: Float) {
        EMMA.startOrder(orderId: orderId, andCustomer: customerId, withTotalPrice: totalPrice, withExtras: nil, assignCoupon: nil)
    }
    
    // Una vez iniciada la transacción hay que añadir los productos a la misma
    func addProduct(productId: String, name: String, qty: Float, price: Float) {
        EMMA.addProduct(productId: productId, andName: name, withQty: qty, andPrice: price, withExtras: nil)
    }
    
    // Una vez tenemos todos los productos añadidos, ejecutamos la medición de la transacción
    func trackOrder() {
        EMMA.trackOrder()
    }
    
    // Cancelar el tracking de una transacción
    func cancelTransaction(orderId: String) {
        EMMA.cancelOrder(orderId: orderId)
    }
    
    // Enviar un evento propio de la aplicación
    func trackEvent(token: String, attributes: [String:String]?) {
        let eventRequest = EMMAEventRequest.init(token: token)
        if let attributes {
            eventRequest.attributes = attributes
        }
        
        EMMA.trackEvent(request: eventRequest)
    }
}
