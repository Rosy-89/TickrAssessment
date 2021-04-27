//
//  ModelManagerTests.swift
//  TickrAssessmentTests

import XCTest
import Combine
@testable import TickrAssessment

class ModelManagerTests: XCTestCase {
  var sut: ModelManager!
  var webService: MockWebService!
  var cancellables: Set<AnyCancellable>!
  
  override func setUpWithError() throws {
    cancellables = []
    webService = MockWebService()
    sut = ModelManager(webService: webService)
  }
  
  override func tearDownWithError() throws {
    sut = nil
    cancellables.forEach {
      $0.cancel()
    }
  }
  
  func testModelPublisherCallsWebService() {
    sut.modelPublisher()
      .sink(receiveCompletion: { _ in },
            receiveValue: { _ in })
      .store(in: &cancellables)
    XCTAssertTrue(webService.dataPublisherWasCalled)
  }
  
  func testModelPublisherEmitsModelOnSuccess() {
    sut.modelPublisher()
      .sink(receiveCompletion: { _ in },
            receiveValue: { value in
                XCTAssertNotNil(value)
            })
      .store(in: &cancellables)
   // wait(for: [expectation], timeout: 2.0)
  }
  
  func testModelPublisherEmitsErrorOnFailure() {
    webService.errorToEmit = ConnectionError.badServerResponse
    var returnedError: Error?
    let expectation = XCTestExpectation(description: "model publisher")
    sut.modelPublisher()
      .sink(receiveCompletion: { completion in
        switch completion {
        case .finished:
          break
        case .failure(let error):
          returnedError = error
          expectation.fulfill()
        }
      },
      receiveValue: { _ in })
      .store(in: &cancellables)
    wait(for: [expectation], timeout: 2.0)
    XCTAssertNotNil(returnedError)
  }
}
