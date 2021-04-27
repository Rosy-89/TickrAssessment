//
//  NewsDetaisViewModelTests.swift
//  TickrAssessmentTests

import XCTest
@testable import TickrAssessment

class NewsDetaisViewModelTests: XCTestCase {

    var sut: NewsDetailsViewModel!
    
    override func setUpWithError() throws {
        let result = Result(id:"", type: .article, sectionID: "", sectionName:"", webPublicationDate: "", webTitle: "", webURL: "", apiURL: "", fields: Fields(headline:"Headline", trailText: "TrailText", shortURL: "", thumbnail: "", body: "Body"), isHosted: true)
        sut = NewsDetailsViewModel(result: result, coordinator: CoordinatorObject())
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }

    func testResult() {
        XCTAssertNotNil(sut.result)
        XCTAssertEqual(sut.result?.fields.headline, "Headline")
        XCTAssertEqual(sut.result?.fields.trailText, "TrailText")
        XCTAssertEqual(sut.result?.fields.body, "Body")
    }
}
