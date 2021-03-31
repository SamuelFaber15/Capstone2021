//
//  ResourcesModel.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 3/22/21.
//

import SwiftUI

// MARK: - RECIPE MODEL

struct Resources: Identifiable {
  var id = UUID()
  var title: String
//  var headline: String
  var image: String
  var instructions: [String]
//  var notes: [String]
}
