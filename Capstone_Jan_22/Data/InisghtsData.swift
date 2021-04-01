//
//  InisghtsData.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 3/22/21.
//

import SwiftUI

// MARK: - RECIPE DATA

let recipesData: [Recipe] = [
  Recipe(
    title: "March 11, 2021",
    headline: "Hello, Megan! How are you feeling today?",
    image: "Landscape1",
    tips: [
      "When you're feeling alone, reach out to your family.",
      "Call this number: (555) 555-5555",
      "Write out a list of the great things about you",
      "Click this link for a funny video",
      "You are enough."
    ],
    content: [
      "Has someone been treating you unkindly recently? This can be a painful experience. As well, knowing how to deal with bullies can seem intimidating. If you'd like, try and review the following steps, to see if any might help with your current situation."
    ],
    scoreLow: -100,
    scoreHigh: 0
  ),
  Recipe(
    title: "March 6, 2021",
    headline: "How have your stress levels felt recently?",
    image: "Landscape2",
    tips: [
        "You're doing better than you think you are.",
        "Any thoughts or fears you are having are real - if they feel too hard to handle, it might be time to ask. Reach out to this number for help understanding your own fears and stresses: (555) 555-5555.",
        "Write out a list of the great things about you",
        "Click this link for a funny video",
        "Always remember: You're doing better than you think you are."
    ],
    content: [
        "Has someone been treating you unkindly recently? This can be a painful experience. As well, knowing how to deal with bullies can seem intimidating. If you'd like, try and review the following steps, to see if any might help with your current situation."
    ],
    scoreLow: 1,
    scoreHigh: 49
  ),
  Recipe(
    title: "February 26, 2021",
    headline: "Have you remembered to treat yourself this week?.",
    image: "Landscape3",
    tips: [
        "Treat yourself to your favorite dessert this Friday!",
        "Call this number: (555) 555-5555",
        "Write out a list of the great things about you",
        "Click this link for a funny video",
        "You are enough."
    ],
    content: [
        "Just a friendly reminder that you, Megan, are remarkable. No one else has tried living the life you are currently living - and you are one of a kind for that. Try and take time to remember how amazing you are this week."
    ],
    scoreLow: 50,
    scoreHigh: 100
  )
]
