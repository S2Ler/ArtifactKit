import Foundation

internal enum ArtifactUrl {
  case cardSet(ArtifactCardSetId)
}

extension ArtifactUrl {
  internal var url: URL {
    switch self {
    case .cardSet(let cardSetId):
      return URL(string: "https://playartifact.com/cardset/\(cardSetId.rawValue)")!
    }
  }
}
