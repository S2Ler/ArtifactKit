import Foundation

/// Represent information about an Artifict card.
public struct Card: Decodable {
  public let id: Identifier<Card>
  public let baseId: Identifier<Card>
  public let type: CardType
  public let name: LocalizedText
  public let text: LocalizedText
  public let miniImage: LocalizedImage
  public let largeImage: LocalizedImage

  private enum CodingKeys: String, CodingKey {
    case id = "card_id"
    case baseId = "base_card_id"
    case type = "card_type"
    case name = "card_name"
    case text = "card_text"
    case miniImage = "mini_image"
    case largeImage = "large_image"
  }
}

extension Card: Identifiable {}
