import Foundation

public struct CardSetCdnInfo: Decodable {
  public enum Error: Swift.Error {
    case cannotResolveSetUrl
  }
  public let cdnRoot: URL
  public let relativePath: String
  public let expireTime: Date  

  private enum CodingKeys: String, CodingKey {
    case cdnRoot = "cdn_root"
    case relativePath = "url"
    case expireTime = "expire_time"
  }
}

extension CardSetCdnInfo {
  public func url() throws -> URL {
    if let url = URL(string: relativePath, relativeTo: cdnRoot) {
      return url
    }
    else {
      throw Error.cannotResolveSetUrl
    }
  }
}
