//
//  PreviewMocks.swift
//  SpaceX
//
//  Created by Carmelo Ruymán Quintana Santana on 24/2/21.
//

import Combine
import Foundation
import SpaceXApi
import SpaceXClient

#if DEBUG
var httpFetcherPreview: HTTPFetcherTest = HTTPFetcherTest()

var clientPreview: Client {
    Client(fetcher: httpFetcherPreview)
}

var appContainerPreview: AppContainer = AppContainer(client: clientPreview)

final class HTTPFetcherTest: HTTPFetcher {

    var data: Data?
    var error: Error?

    func data(request: URLRequest) -> AnyPublisher<Data, Error> {
        Future<Data, Error> { promise in
            if let error = self.error {
                promise(.failure(error))
            }
            if let data = self.data {
                promise(.success(data))
            }
        }.eraseToAnyPublisher()
    }

}
#endif
