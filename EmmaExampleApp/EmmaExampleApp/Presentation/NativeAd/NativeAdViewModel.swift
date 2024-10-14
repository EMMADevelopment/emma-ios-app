//
//  NativeAdViewModel.swift
//  EmmaExampleApp
//
//  Created by Salva Moreno on 14/10/24.
//

import Foundation
import EMMA_iOS

final class NativeAdViewModel: NSObject, ObservableObject, EMMAInAppMessageDelegate {
    // MARK: - Properties -
    @Published var isLoading = false
    @Published var nativeAdReceived: EMMANativeAd? = nil
    
    // MARK: - Functions -
    func callForGettingNativeAds() {
        defer {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) { [weak self] in
                self?.isLoading = false
            }
        }
        isLoading = true
        DispatchQueue.global().async { [weak self] in
            self?.getNativeAd(templateId: "template2")
            print("getNativeAd called")
        }
    }
    
    func getNativeAd(templateId: String) {
        let nativeAdRequest = EMMANativeAdRequest()
        nativeAdRequest.templateId = templateId
        EMMA.inAppMessage(request: nativeAdRequest, withDelegate: self)
    }
    
    func getBatchNativeAd(templateId: String) {
        let nativeAdRequest = EMMANativeAdRequest()
        nativeAdRequest.templateId = templateId
        nativeAdRequest.isBatch = true
        EMMA.inAppMessage(request: nativeAdRequest, withDelegate: self)
    }
    
    func onReceived(_ nativeAd: EMMANativeAd!) {
        let content = nativeAd.nativeAdContent as? [String:AnyObject]
        if let title = content?["Title"] as? String {
            print("Received NativeAd with Title: \(title)")
            // Draw NativeAd and Send Impression
            EMMA.sendImpression(campaignType: .campaignNativeAd, withId: String(nativeAd.idPromo))
        }
        DispatchQueue.main.async { [weak self] in
            self?.nativeAdReceived = nativeAd
        }
    }
    
    func onBatchNativeAdReceived(_ nativeAds: [EMMANativeAd]!) {
        nativeAds.forEach { nativeAd in
            if let tag = nativeAd.tag {
                print("Received batch NativeAd with tag: \(tag)")
            }
        }
    }
    
    func openNativeAd(nativeAd: EMMANativeAd) {
        // This method executes CTA Action and sends NativeAd Click
        EMMA.openNativeAd(campaignId: String(nativeAd.idPromo))
    }
    
    func sendNativeAdClick(nativeAd: EMMANativeAd) {
        // Send manual click. Useful if we want to override CTA action
        EMMA.sendClick(campaignType: .campaignNativeAd, withId: String(nativeAd.idPromo))
    }
    
    func onShown(_ campaign: EMMACampaign!) {
        print("Método onShown invocado")
    }
    
    func onHide(_ campaign: EMMACampaign!) {
        print("Método onHide invocado")
    }
    
    func onClose(_ campaign: EMMACampaign!) {
        print("Método onClose invocado")
    }
}
