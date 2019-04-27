import Foundation
import Networker

internal func createDispatcher() -> Dispatcher {
  let dispatcher = URLSessionDispatcher(plugins: [])
  return dispatcher
}

internal typealias ArtifactRequest<Success: Decodable> = Request<Success, ArtifactApiDecoder>
