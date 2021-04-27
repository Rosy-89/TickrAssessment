//
//  Mocks.swift
//  TickrAssessmentTests

import Foundation
import Combine

@testable import TickrAssessment

fileprivate var sampleData: Data = {
    let filepath = Bundle(for: MockModelManager.self).path(forResource: "example", ofType: "json")!
    let data = try! Data(contentsOf: URL(fileURLWithPath: filepath))
    return data
}()

class MockModelManager: ModelManagerProtocol {
    var modelPublisherWasCalled = false
    
    func modelPublisher() -> ModelPublisher {
        modelPublisherWasCalled = true
        
        return Just(sampleData)
            .decode(type: SearchResult.self, decoder: JSONDecoder())
            .map { model in
                return model
            }
            .tryCatch { error in
                Fail(error: error)
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}

class MockWebService: WebServiceProtocol {
    var dataPublisherWasCalled = false
    var errorToEmit: Error?
    
    func dataPublisher(for url: URL) -> AnyPublisher<Data, Error> {
        dataPublisherWasCalled = true
        if let error = errorToEmit {
            return Fail(error: error)
                .eraseToAnyPublisher()
        } else {
            return Just(sampleData)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }
}

