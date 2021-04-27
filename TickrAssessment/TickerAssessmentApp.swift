//
//  TickerAssessmentApp.swift
//  TickrAssessment

import SwiftUI

@main
struct TickerAssessmentApp: App {
    var body: some Scene {
        WindowGroup {
            CoordinatorView(object: CoordinatorObject())
        }
    }
}
