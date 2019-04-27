import XCTest
@testable import ArtifactKit

class ArtifactApiTests: XCTestCase {
  private var api: ArtifactApi!
  override func setUp() {
    api = ArtifactApi()
  }

  override func tearDown() {
    api = nil
  }

  func testCardSetCdnInfo() {
    let allSetIds = CardSetId.allCases
    let allSetsObtained = expectation(description: "All sets obtained")
    allSetsObtained.expectedFulfillmentCount = allSetIds.count

    for setId in allSetIds {
      _ = api
        .fetchCardSetCdnInfo(setId)
        .sink(receiveCompletion: { (completion) in
          if case .failure(let error) = completion {
            XCTFail("\(error)")
          }
        }, receiveValue: { _ in
          allSetsObtained.fulfill()
        })
    }

    waitForExpectations(timeout: 10, handler: nil)
  }

  func testCardSet() {
    let cardSetObtained = expectation(description: "Card Set Obtained")

    _ = api
      .fetchCardSetCdnInfo(.base)
      .flatMap { self.api.fetchCards(from: $0) }
      .sink(receiveCompletion: { (result) in
        if case .failure(let error) = result {
          XCTFail("\(error)")
        }
        cardSetObtained.fulfill()
      }, receiveValue: { cardSet in
        var atLeastOneCardWithLocalizedImage: Bool = false
        for card in cardSet.cardList {
          if card.miniImage.default != nil &&
            card.largeImage.default != nil &&
            card.largeImage.brazilian != nil {
            atLeastOneCardWithLocalizedImage = true
            break
          }
        }
        XCTAssertTrue(atLeastOneCardWithLocalizedImage)
      })

    waitForExpectations(timeout: 10, handler: nil)
  }
}
