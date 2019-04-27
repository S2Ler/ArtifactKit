public extension Result where Failure == Swift.Error {
  enum Error: Swift.Error {
    case initializingWithEmptyValueAndError
  }

  init(_ value: Success?, _ error: Failure?) {
    if let value = value {
      self = .success(value)
    }
    else if let error = error {
      self = .failure(error)
    }
    else {
      assertionFailure("initializing with empty value and error")
      self = .failure(Error.initializingWithEmptyValueAndError)
    }
  }
}
