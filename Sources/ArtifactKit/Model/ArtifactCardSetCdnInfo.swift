import Foundation

public struct ArtifactCardSetCdnInfo: Decodable {
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

extension ArtifactCardSetCdnInfo {
  public func url() throws -> URL {
    if let url = URL(string: relativePath, relativeTo: cdnRoot) {
      return url
    }
    else {
      throw Error.cannotResolveSetUrl
    }
  }
}
