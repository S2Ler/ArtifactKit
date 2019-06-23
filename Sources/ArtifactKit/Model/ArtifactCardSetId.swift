import Foundation
import Networker

/// Represent Artifact card set id
public enum ArtifactCardSetId: Int, CaseIterable {
  case base = 0
  case callToArms = 1
}

extension ArtifactCardSetId: RawRequestValueConvertible {
  public var rawRequestValue: String {
    return "\(rawValue)"
  }
}
