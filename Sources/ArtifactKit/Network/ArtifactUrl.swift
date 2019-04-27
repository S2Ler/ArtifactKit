import Foundation

internal enum ArtifactUrl {
  case cardSet(CardSetId)
}

extension ArtifactUrl {
  internal var url: URL {
    switch self {
    case .cardSet(let cardSetId):
      return URL(string: "https://playartifact.com/cardset/\(cardSetId.rawValue)")!
    }
  }
}
