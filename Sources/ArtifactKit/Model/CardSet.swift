import Foundation

public struct CardSet: Decodable {
  public let version: Int
  public let info: Info
  public let cardList: [Card]

  private enum CodingKeys: String, CodingKey {
    case version
    case info = "set_info"
    case cardList = "card_list"
  }
}

public extension CardSet {
  struct Info: Decodable {
    public let id: Identifier<CardSet>
    public let packItemDef: Int
    public let name: LocalizedText

    private enum CodingKeys: String, CodingKey {
      case id = "set_id"
      case packItemDef = "pack_item_def"
      case name
    }
  }
}

extension CardSet: Identifiable {
  public var id: Identifier<CardSet> {
    return info.id
  }
}
