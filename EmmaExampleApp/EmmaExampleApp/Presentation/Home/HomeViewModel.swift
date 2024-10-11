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
    
    // MARK: - INIT -
    init() {
        getUserId()
        getDeviceId()
        getUserInfo()
    }
    
    // MARK: - Functions -
    // Recuperar el identificador interno de EMMA
    private func getUserId() {
        EMMA.getUserId { userId in
            guard let uid = userId else {
                print("Error getting user id")
                return
            }
            print("Our EMMA USER ID is \(uid)")
        }
    }
    
    // Obtener el identificador del dispositivo (tipo UUID V4)
    private func getDeviceId() {
        print("Our EMMA DEVICE ID is \(EMMA.deviceId())")
    }
    
    // Recuperar el perfil del usuario desde la aplicación
    private func getUserInfo() {
        EMMA.getUserInfo { userProfile in
            guard let profile = userProfile else {
                print("Error getting user profile")
                return
            }
            print("Retrieved user profile: \(profile)")
        }
    }
    
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
    
    // Enriquecer el perfil del usuario con información almacenada mediante Clave / Valor a la que le llamamos tags de usuario
    func addUserTag(tags: [String:String]) {
        EMMA.trackExtraUserInfo(info: tags)
    }
    
    func getStartView() {
        let startViewinAppRequest = EMMAInAppRequest(type: .Startview)
        EMMA.inAppMessage(request: startViewinAppRequest)
    }
    
    func getAdBall() {
        let adballRequest = EMMAInAppRequest(type: .Adball)
        EMMA.inAppMessage(request: adballRequest)
    }
    
    func getStrip() {
        let stripRequest = EMMAInAppRequest(type: .Strip)
        EMMA.inAppMessage(request: stripRequest)
    }
    
    // Permiso para rastrear o acceder al Identificador de anunciantes (IDFA)
    func trackWithIdfa() {
        if #available(iOS 14.0, *) {
            EMMA.requestTrackingWithIdfa()
        }
    }
}
