//
//  HeaderModel.swift
//  Capstone_Jan_22
//
//  Created by Ashleigh Koener on 3/30/21.
//

import SwiftUI

// MARK: - HEADER MODEL

struct Header: Identifiable {
  var id = UUID()
  var image: String
  var headline: String
  var subheadline: String
}
