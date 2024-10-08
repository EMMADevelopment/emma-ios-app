//
//  Extension+Array.swift
//  EmmaExampleApp
//
//  Created by Salva Moreno on 8/10/24.
//

import Foundation

// Extensión para dividir la lista en chunks (particiones) -> Se emplea en ButtonsGrid
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        var chunks: [[Element]] = []
        var currentIndex = 0
        
        while currentIndex < self.count {
            let chunk = Array(self[currentIndex..<Swift.min(currentIndex + size, self.count)])
            chunks.append(chunk)
            currentIndex += size
        }
        
        return chunks
    }
}
