//
//  ListViewModelTests.swift
//  TickrAssessmentTests

import XCTest
import Combine
@testable import TickrAssessment


class ListViewModelTests: XCTestCase {
  var sut: NewsViewModel!
  var modelManager: MockModelManager!
  
  override func setUpWithError() throws {
    modelManager = MockModelManager()
    sut = NewsViewModel(modelManager: modelManager, coordinator: CoordinatorObject())
  }
  
  override func tearDownWithError() throws {
    sut = nil
  }
  
  func testFetchNewsArticles() {
    sut.fetchNewsArticles()
    XCTAssertTrue(modelManager.modelPublisherWasCalled, "ViewModel should call ModelManager method")
  }
  
  func testFetchModelsLoadsModelsFromModelManager() {
    XCTAssertNil(sut.searchResult)
    sut.fetchNewsArticles()
    XCTAssertNoThrow(sut.searchResult , "ViewModel should store models from manager")
  }
}

