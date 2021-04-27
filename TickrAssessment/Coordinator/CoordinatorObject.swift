//
//  CoordinatorObject.swift
//  TickrAssessment

import Foundation

class CoordinatorObject: ObservableObject {
    
    @Published var newsListViewModel: NewsViewModel!
    @Published var newsDetailViewModel: NewsDetailsViewModel?
    
    init() {
        let  modelManager = ModelManager(webService: WebService())
        self.newsListViewModel = NewsViewModel(modelManager:modelManager, coordinator: self)
    }
    func open(_ result: Result) {
        self.newsDetailViewModel = NewsDetailsViewModel(result: result, coordinator: self)
    }
}
