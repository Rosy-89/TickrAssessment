//
//  ConnectionError.swift
//  TickrAssessment

import Foundation

enum ConnectionError: Error {
  case badServerResponse
  case invalidSearchItem
}
