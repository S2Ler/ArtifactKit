import Foundation

public struct ArtifactCardSet: Decodable {
  public let version: Int
  public let info: Info
  public let cardList: [ArtifactCard]

  private enum CodingKeys: String, CodingKey {
    case version
    case info = "set_info"
    case cardList = "card_list"
  }
}

public extension ArtifactCardSet {
  struct Info: Decodable {
    public let id: Identifier<ArtifactCardSet>
    public let packItemDef: Int
    public let name: ArtifactLocalizedText

    private enum CodingKeys: String, CodingKey {
      case id = "set_id"
      case packItemDef = "pack_item_def"
      case name
    }
  }
}

extension ArtifactCardSet: Identifiable {
  public var id: Identifier<ArtifactCardSet> {
    return info.id
  }
}
