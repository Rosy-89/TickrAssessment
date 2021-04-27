//
//  EndPoints.swift
//  TickrAssessment

import Foundation

enum Environment {
  static let baseUrl = URL(string: "https://content.guardianapis.com/")!
    // This is static and will never be nil
}

enum Path {
  static let search = "search"
}
