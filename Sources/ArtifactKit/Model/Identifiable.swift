import Foundation

public protocol Identifiable {
  var id: Identifier<Self> { get }
}
