import Foundation
import Networker
import Combine

public class ArtifactApi {
  internal static let baseUrl: URL = URL(string: "https://playartifact.com")!

  private let dispatcher: Dispatcher

  internal init(dispatcher: Dispatcher) {
    self.dispatcher = dispatcher
  }

  public convenience init() {
    self.init(dispatcher: createDispatcher())
  }

  public func fetchCardSetCdnInfo(_ setId: CardSetId) -> AnyPublisher<CardSetCdnInfo, Error> {
    let path = RequestPath(pattern: "/cardset/{id}",
                           parameters: ["id": setId])

    let request: ArtifactRequest<CardSetCdnInfo> = ArtifactApi.request(path: path,
                                                                       httpMethod: HttpMethod.get)
    return dispatcher.dispatch(request)
  }

  public func fetchCards(from setInfo: CardSetCdnInfo) -> AnyPublisher<CardSet, Error>{
    return Publishers.Just(setInfo)
      .tryMap { setInfo -> ArtifactRequest<CardSetResponse> in
        ArtifactApi.request(baseUrl: setInfo.cdnRoot,
                            path: try RequestPath(dynamicPattern: setInfo.relativePath),
                            httpMethod: .get)
      }
      .flatMap { request in self.dispatcher.dispatch(request) }
      .map { $0.card_set }
      .eraseToAnyPublisher()
  }

  internal static func request<Success>(baseUrl: URL = baseUrl,
                                        path: RequestPath,
                                        urlParams: [String: RawRequestValueConvertible?]? = nil,
                                        httpMethod: HttpMethod,
                                        body: RequestBody? = nil,
                                        headers: [String: RawRequestValueConvertible]? = nil) -> ArtifactRequest<Success>
    where Success: Decodable
  {
    Request(baseUrl: baseUrl,
            path: path,
            urlParams: urlParams,
            httpMethod: httpMethod,
            body: body,
            headers: headers,
            timeout: 30,
            cachePolicy: .useProtocolCachePolicy)
  }
}
