//
//  CacheService.swift
//  
//
//  Created by Carmelo Ruyman on 4/1/21.
//

import Foundation
import Combine
import SwiftUI

struct CacheService {

    static let defaultCache = getCache()

    private static func getCache() -> NSCache<NSURL, UIImage> {
        let cache = NSCache<NSURL, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100
        return cache
    }

    static func getURL(name: String, extensionFile: String = "jpg") throws -> URL {
        let destinationURL = URL(string: "/images")
        let url = try FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: destinationURL, create: true)
        return url.appendingPathComponent(name).appendingPathExtension(extensionFile)
    }

    static func getImage(name: String, extensionFile: String = "jpg", queue: ReadWriteLock) -> Data? {
        var result: Data?
        queue.read {
            do {
                let temporaryFileURL =  try CacheService.getURL(name: name, extensionFile: extensionFile)
                result = try Data(contentsOf: temporaryFileURL)
            } catch {
                result =  nil
            }
        }
        return result
    }

    static func getImage(url: URL, queue: ReadWriteLock) -> UIImage? {
        var result: UIImage?
        queue.read {
            let cache = defaultCache
            result = cache.object(forKey: url as NSURL)
        }
        return result
    }

    static func saveImage(url: URL, image: UIImage, queue: ReadWriteLock) {
        queue.write {
            let cache = defaultCache
            cache.removeObject(forKey: url as NSURL)
            cache.setObject(image as UIImage, forKey: url as NSURL)
        }
    }

    static func saveImagePublisher(url: URL, image: UIImage, queue: ReadWriteLock) -> AnyPublisher<UIImage?, Never> {
        Future { promise in
            queue.write {
                let cache = defaultCache
                cache.removeObject(forKey: url as NSURL)
                cache.setObject(image as UIImage, forKey: url as NSURL)
                promise(.success(image))
            }
        }.eraseToAnyPublisher()
    }

    static func saveImagePublisher(name: String, extensionFile: String = "jpg", data: Data, queue: ReadWriteLock) -> AnyPublisher<UIImage?, Never> {
        Future { promise in
            queue.write {
                do {
                    let temporaryFileURL =  try CacheService.getURL(name: name, extensionFile: extensionFile)
                    try data.write(to: temporaryFileURL, options: .atomic)
                    promise(.success(UIImage(data: data)))
                } catch {
                    debugPrint(error)
                }
            }
        }.eraseToAnyPublisher()
    }

    static func saveImage(name: String, extensionFile: String = "jpg", data: Data, queue: ReadWriteLock) {
        queue.write {
            do {
                let temporaryFileURL =  try CacheService.getURL(name: name, extensionFile: extensionFile)
                try data.write(to: temporaryFileURL, options: .atomic)
            } catch {
                debugPrint(error)
            }
        }
    }

    static func removeImage(name: String, extensionFile: String = "jpg") {
        do {
            let temporaryFileURL =  try CacheService.getURL(name: name, extensionFile: extensionFile)
            try FileManager.default.removeItem(at: temporaryFileURL)
        } catch {
            debugPrint(error)
        }
    }

}
