//
//  InsightsModel.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 3/22/21.
//

import SwiftUI

// MARK: - RECIPE MODEL

struct Recipe: Identifiable {
  var id = UUID()
  var title: String
  var headline: String
  var image: String
  var tips: [String]
  var content: [String]
  var scoreLow: Int
  var scoreHigh: Int
}
