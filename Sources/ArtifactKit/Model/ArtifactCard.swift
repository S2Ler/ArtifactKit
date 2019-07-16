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
  public let colors: Set<ArtifactColor>

  private enum CodingKeys: String, CodingKey {
    case id = "card_id"
    case baseId = "base_card_id"
    case type = "card_type"
    case name = "card_name"
    case text = "card_text"
    case miniImage = "mini_image"
    case largeImage = "large_image"
    case isBlue = "is_blue"
    case isRed = "is_red"
    case isGreen = "is_green"
    case isBlack = "is_black"
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(Identifier<ArtifactCard>.self, forKey: .id)
    baseId = try container.decode(Identifier<ArtifactCard>.self, forKey: .baseId)
    type = try container.decode(ArtifactCardType.self, forKey: .type)
    name = try container.decode(ArtifactLocalizedText.self, forKey: .name)
    text = try container.decode(ArtifactLocalizedText.self, forKey: .text)
    miniImage = try container.decode(ArtifactLocalizedImage.self, forKey: .miniImage)
    largeImage = try container.decode(ArtifactLocalizedImage.self, forKey: .largeImage)

    func decodeColors() throws -> Set<ArtifactColor> {
      func isColor(forKey key: CodingKeys) throws -> Bool {
        guard container.contains(key) else {
          return false
        }
        return try container.decode(Bool.self, forKey: key)
      }

      var colors: Set<ArtifactColor> = []

      if try isColor(forKey: .isBlue) {
        colors.insert(.blue)
      }
      if try isColor(forKey: .isRed) {
        colors.insert(.red)
      }
      if try isColor(forKey: .isGreen) {
        colors.insert(.green)
      }
      if try isColor(forKey: .isBlack) {
        colors.insert(.black)
      }
      return colors
    }

    colors = try decodeColors()
  }
}

extension ArtifactCard: Identifiable {}
