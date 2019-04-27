import Foundation

public struct Identifier<Value>: RawRepresentable, Hashable {
  public let rawValue: Int

  public init(rawValue: Int) {
    self.rawValue = rawValue
  }
}

extension Identifier: ExpressibleByIntegerLiteral {
  public typealias IntegerLiteralType = Int

  public init(integerLiteral value: Int) {
    rawValue = value
  }
}

extension Identifier: Codable {
  public init(from decoder: Decoder) throws {
    let rawValue = try decoder.singleValueContainer().decode(Int.self)
    self.rawValue = rawValue
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(self.rawValue)
  }
}
