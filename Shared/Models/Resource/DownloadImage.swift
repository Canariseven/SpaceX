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

    var readWrite: ReadWriteLock = ReadWriteLock(label: "DownloadImageQueue")
    var subscribers: Set<AnyCancellable> = Set<AnyCancellable>()

    func download(url: URL, content: Binding<Image?>) {
        if let image = CacheService.getImage(url: url, queue: readWrite) {
            content.wrappedValue = Image(uiImage: image)
            return
        }
        URLSession.shared.dataTaskPublisher(for: url).subscribe(on: DispatchQueue.global()).receive(on: RunLoop.main).sink { (result) in
            switch result {
            case .finished:
                debugPrint("Image \(url.lastPathComponent) Downloaded")
            case .failure(let error):
                debugPrint(error)
            }
        } receiveValue: { (value) in
            if let image = UIImage(data: value.data) {
                CacheService.saveImage(url: url, image: image, queue: self.readWrite)
                content.wrappedValue = Image(uiImage: image)
            }
        }.store(in: &subscribers)
    }

}
