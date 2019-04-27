import Foundation
import Networker

/// Represent Artifact card set id
public enum CardSetId: Int, CaseIterable {
  case base = 0
  case callToArms = 1
}

extension CardSetId: RawRequestValueConvertible {
  public var rawRequestValue: String {
    return "\(rawValue)"
  }
}
