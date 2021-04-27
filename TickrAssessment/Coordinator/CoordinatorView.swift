//
//  CoordinatorView.swift
//  TickrAssessment

import SwiftUI

struct CoordinatorView: View {
    
    @ObservedObject var object: CoordinatorObject
    
    var body: some View {
        NavigationView {
            NewsItemsView(viewModel: object.newsListViewModel).navigation(item: $object.newsDetailViewModel, destination: { NewsDetailView(viewModel: $0)})
            
        }
        
    }
}
