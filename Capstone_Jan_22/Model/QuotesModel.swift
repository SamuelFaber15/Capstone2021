//
//  QuotesModel.swift
//  Capstone_Jan_22
//
//  Created by Ashleigh Koener on 3/30/21.
//

import SwiftUI

// MARK: - FACT MODEL

struct Quotes: Identifiable {
  var id = UUID()
  var image: String
  var content: String
}
