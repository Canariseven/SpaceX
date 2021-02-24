//
//  DownloadImage.swift
//  SpaceX
//
//  Created by Carmelo Ruymán Quintana Santana on 24/2/21.
//

import Foundation
import SwiftUI
import Combine

class DownloadImage {
    
    var subscribers: Set<AnyCancellable> = Set<AnyCancellable>()
    
    func download(url: URL, content: Binding<Image>) {
        URLSession.shared.dataTaskPublisher(for: url).sink { (result) in
            switch result {
            case .finished:
                debugPrint("Image \(url.lastPathComponent) Downloaded")
            case .failure(let error):
                debugPrint(error)
            }
        } receiveValue: { (value) in
            if let image = UIImage(data: value.data) {
                content.wrappedValue = Image(uiImage: image)
            }
        }.store(in: &subscribers)
    }
    
}
