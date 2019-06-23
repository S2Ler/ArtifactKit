import Foundation

/// Represent information about an Artifict card.
public struct ArtifactCard: Decodable {
  public let id: Identifier<ArtifactCard>
  public let baseId: Identifier<ArtifactCard>
  public let type: ArtifactCardType
  public let name: ArtifactLocalizedText
  public let text: ArtifactLocalizedText
  public let miniImage: ArtifactLocalizedImage
  public let largeImage: ArtifactLocalizedImage

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

extension ArtifactCard: Identifiable {}
