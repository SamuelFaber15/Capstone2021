//
//  ResourcesView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 3/22/21.
//

import SwiftUI
// MARK: - RECIPE DATA

import SwiftUI
// MARK: - RESOURCE DATA

let mentalHealthResources: [Resources] = [
    Resources(
    title: "Maybe You Should Talk to Someone",
//    headline: "GOAL TEST",
    image: "overall_1",
    instructions: [
      "One day, Lori Gottlieb is a therapist who helps patients in her Los Angeles practice. The next, a crisis causes her world to come crashing down. Enter Wendell, the quirky but seasoned therapist in whose of­fice she suddenly lands. With his balding head, cardigan, and khakis, he seems to have come straight from Therapist Central Casting. Yet he will turn out to be anything but.",
        "As Gottlieb explores the inner chambers of her patients' lives -- a self-absorbed Hollywood producer, a young newlywed diagnosed with a terminal illness, a senior citizen threatening to end her life on her birthday if nothing gets better, and a twenty-something who can't stop hooking up with the wrong guys -- she finds that the questions they are struggling with are the very ones she is now bringing to Wendell.",
        "With startling wisdom and humor, Gottlieb invites us into her world as both clinician and patient, examining the truths and fictions we tell ourselves and others as we teeter on the tightrope between love and desire, meaning and mortality, guilt and redemption, terror and courage, hope and change.",
        "Maybe You Should Talk to Someone is rev­olutionary in its candor, offering a deeply per­sonal yet universal tour of our hearts and minds and providing the rarest of gifts: a boldly reveal­ing portrait of what it means to be human, and a disarmingly funny and illuminating account of our own mysterious lives and our power to transform them."
//    ],
//    notes: [
//      "GOAL TEST"
    ]
  ),
    Resources(
    title: "How to be Fine",
//    headline: "GOAL TEST",
    image: "overall_2",
    instructions: [
        "In each episode of their podcast By the Book, Jolenta Greenberg and Kristen Meinzer take a deep dive into a different self-help book, following its specific instructions, rules, and advice to the letter. From diet and productivity to decorating to social interactions, they try it all, record themselves along the way, then share what they’ve learned with their devoted and growing audience of fans who tune in.",
          "Before they began their podcast, Jolenta wanted to believe the promises of self-help books, while Kristen was very much the skeptic. They embraced their differences of opinion, hoping they’d be good for laughs and downloads. But in the years since launching the By the Book, they’ve come to realize their show is about much more than humor. In fact, reading and following each book’s advice has actually changed and improved their lives. Thanks to the show, Kristen penned the Amish romance novel she’d always joked about writing, traveled back to her past lives, and she broached some difficult conversations with her husband about their marriage. Jolenta finally memorized her husband’s phone number, began tracking her finances, and fell in love with cutting clutter.",
          "Part memoir, part prescriptive handbook, this honest, funny, and heartfelt guide is like a warm soul-baring conversation with your closest and smartest friends."
//    ],
//    notes: [
//      "GOAL TEST"
    ]
  ),
    Resources(
    title: "Girl Stop Apologizing",
//    headline: "GOAL TEST",
    image: "overall_3",
    instructions: [
        "In Girl, Stop Apologizing, #1 New York Times bestselling author and founder of a multimillion-dollar media company, Rachel Hollis sounds a wake-up call. She knows that many women have been taught to define themselves in light of other people—whether as wife, mother, daughter, or employee—instead of learning how to own who they are and what they want. With a challenge to women everywhere to stop talking themselves out of their dreams, Hollis identifies the excuses to let go of, the behaviors to adopt, and the skills to acquire on the path to growth, confidence, and believing in yourself."
//    ],
//    notes: [
//      "GOAL TEST"
    ]
  ),
    Resources(
    title: "The Seven Habits of Highly Effective Teens",
//    headline: "GOAL TEST",
    image: "7Habits",
    instructions: [
      "Imagine you had a roadmap—a step-by-step guide to help you get from where you are now, to where you want to be in the future. Your goals, your dreams, your plans…they’re all within reach. You just need the tools to help you get there.",
        "That’s what Sean Covey’s landmark book, The 7 Habits of Highly Effective Teens, has been to millions of teens: a handbook to self-esteem and success. Now updated for the digital age, this classic book applies the timeless principles of 7 Habits to the tough issues and life-changing decisions teens face. Covey provides a simple approach to help teens improve self-image, build friendships, resist peer pressure, achieve their goals, and appreciate their parents, as well as tackle the new challenges of our time, like cyberbullying and social media. In addition, this book is stuffed with cartoons, clever ideas, great quotes, and incredible stories about real teens from all over the world.",
        "Endorsed by high-achievers such as former 49ers quarterback Steve Young and 28-time Olympic medalist Michael Phelps, The 7 Habits of Highly Effective Teens has become the last word on surviving and thriving as a teen."
//    ],
//    notes: [
//      "GOAL TEST"
    ]
  ),
    Resources(
    title: "How to Win Friends and Influence People",
//    headline: "GOAL TEST",
    image: "HTWF",
    instructions: [
        "Since its release in 1936, How to Win Friends and Influence People has sold more than 15 million copies. Dale Carnegie's first book is a timeless bestseller, packed with rock-solid advice that has carried thousands of now famous people up the ladder of success in their business and personal lives.",
        "Learn the six ways to make people like you, the twelve ways to win people to your way of thinking, and the nine ways to change people without arousing resentment."
//    ],
//    notes: [
//      "GOAL TEST"
    ]
  ),
    Resources(
    title: "The Mind is Just Like a Muscle",
//    headline: "GOAL TEST",
    image: "overall_4",
    instructions: [
        "We live in a crazy time. On top of that, you’re trying to figure out who you are and how to find your place in this ever-changing world. You’re building your plane while flying it. The Mind Is Just Like A Muscle is a self-help book for teens that makes this daunting task not as intimidating. Through examples from science, history, and psychology, you learn about the unique qualities that make us human and how those qualities act as a filter for our experiences growing up in modern America. You learn why things - people, places, ideas - that aren’t familiar to us can feel scary or create fear. You build awareness around how our brains shape our experiences, and how the increasing interconnectedness of the modern era in turn affects us on an individual level and on a societal level. This book encourages you to exercise your brain by building awareness of your life both inside and outside your household. Like any other muscle, the human brain needs exercise to get stronger. This book shares exercises and insights to help you make that happen."
//    ],
//    notes: [
//      "GOAL TEST"
    ]
  ),
    Resources(
    title: "Girl Wash Your Face",
//    headline: "GOAL TEST",
    image: "overall_5",
    instructions: [
        """
Do you ever suspect that everyone else has life figured out and you don’t have a clue? If so, Rachel Hollis has something to tell you: that’s a lie.
        
If you have ever said any of these things to yourself . . .

- Something else will make me happy.
- I’m not a good mom.
- I will never get past this.
- I am defined by my weight.
- I should be further along by now.

. . . then you could benefit from the unflinching faith and rock-hard tenacity Rachel Hollis has in store for you. In this challenging but conversational book, Rachel exposes the twenty lies and misconceptions that too often hold us back from living joyfully and productively, lies we’ve told ourselves so often we don’t even hear them anymore.
""",

"Rachel is real and talks about real issues. More than that, she reveals the specific practical strategies that helped her move past them. In the process, she encourages, entertains, and even kicks a little butt, all to convince you to do whatever it takes to get real and become the joyous, confident woman you were meant to be. Because you really can live with passion and hustle – and give yourself grace without giving up."
//    ],
//    notes: [
//      "GOAL TEST"
    ]
  )
]


let depressionResources: [Resources] = [
    Resources(
    title: "The Depression Workbook for Teens",
//    headline: "GOAL TEST",
    image: "depression_1",
    instructions: [
      "The Depression Workbook for Teens gives you the helping hand you need to get through this difficult time. This depression workbook draws on the most effective and up-to-date techniques, like cognitive behavioral therapy and mindfulness, to deliver simple exercises that help teens learn how to conquer depression"
//    ],
//    notes: [
//      "GOAL TEST"
    ]
  ),
    Resources(
    title: "Depression: A Teen’s Guide to Survive and Thrive 1st Edition",
//    headline: "GOAL TEST",
    image: "depression_2",
    instructions: [
      "Depression: A Teen’s Guide to Survive and Thrive is a guidebook for teenagers who are depressed or at risk for depression. This guide discusses depression and provides guidance on cognitive—behavioral therapy principles to help teens take a problem-solving, strategy-based approach to deal with depressed moods, thoughts, and behavior. Intended to serve as an adjunct to therapy, this is a very practical and easy-to-read book that is not overwhelming for teens."
//    ],
//    notes: [
//      "GOAL TEST"
    ]
  ),
    Resources(
    title: "It's the Depression for Me: 3 Ways to Make Being a Teenager Suck Less",
//    headline: "GOAL TEST",
    image: "depression_3",
    instructions: [
      "This isn't like other teen self-help books-- it's written by a 23-year-old you can actually relate to. In her debut book, Maeve Ronan shares the top 3 life insights she wishes she knew as a teen when she was struggling with anxiety, depression, and even suicidal thoughts.",
        "Known as Gen Z's big sister, Maeve has been collecting advice from successful people around the world for the past 3 years, and now she's sharing it all with Gen Z in a totally non boring way."
//    ],
//    notes: [
//      "GOAL TEST"
    ]
  )
]


let anxietyResources: [Resources] = [
    Resources(
    title: "Brave: A Teen Girl's Guide to Beating Worry and Anxiety",
//    headline: "GOAL TEST",
    image: "anxiety_1",
    instructions: [
      "This book will help you understand anxiety's roots and why your brain is often working against you when you start to worry. With teen-friendly information, stories, and self-discovery exercises, including journaling and drawing prompts, you will learn practical ways to fight back when worries come up. You will find more of your voice and your confidence."
//    ],
//    notes: [
//      "GOAL TEST"
    ]
  ),
    Resources(
    title: "Get Out of Your Head",
//    headline: "GOAL TEST",
    image: "anxiety_2",
    instructions: [
      "Are your thoughts holding you captive? I’ll never be good enough. Other people have better lives than I do. God couldn’t really love me. Jennie Allen knows what it’s like to swirl in a spiral of destructive thoughts, but she also knows we don’t have to stay stuck in toxic thinking patterns.",
        "In Get Out of Your Head, Jennie inspires and equips us to transform our emotions, our outlook, and even our circumstances by taking control of our thoughts.",
        "It starts in your head. And from there, the possibilities are endless."
//    ],
//    notes: [
//      "GOAL TEST"
    ]
  ),
    Resources(
    title: "How to Stop Worrying and Start Living",
//    headline: "GOAL TEST",
    image: "anxiety_3",
    instructions: [
      "When people try to fight worry, they often do it by trying to eliminate the source of their worry. This makes great sense in theory but in reality, often the things we worry most about are things we cannot eliminate. Am I good enough at my job? Will I get good grades? Can I make new friends?",
        "In How to Stop Worrying and Start Living, Dale Carnegie suggests that we instead try to fight worry and rumination by changing our mental attitude."
//    ],
//    notes: [
//      "GOAL TEST"
    ]
  ),
    Resources(
    title: "Anxiety Relief for Teens",
//    headline: "GOAL TEST",
    image: "AnxietyRelief",
    instructions: [
      "Getting good grades, keeping up with social media, maintaining friendships... you have a lot on your plate and it's more difficult when you add anxiety to the mix. You may even be avoiding situations, events, or people that could trigger your anxiety. So, how do you stop yourself from missing out on life? With Anxiety Relief for Teens, Dr. Regine Galanti teaches you how CBT-based skills and mindfulness techniques can help you manage your anxiety and reverse negative patterns. Through simple and effective exercises that help you change your thoughts, behaviors, and physical reactions, this helpful guide gives you the tools you need to navigate all of life's challenges.",
        "Anxiety Relief for Teens features:",
        """
•  Quizzes and self-assessments to better understand your anxiety and emotions and discover their respective triggers.
• 30+ CBT-based tools to manage your anxiety along with practical strategies for dealing with challenging emotions such as anger and sadness.
•  30+ mindfulness practices to cope with your anxiety in the present moment through visualizations, breathing, meditation, and other exercises.
"""
//    ],
//    notes: [
//      "GOAL TEST"
    ]
  )

]

let cyberbullyingResources: [Resources] = [
    Resources(
    title: "The Ultimate Self-Esteem Workbook for Teens",
//    headline: "GOAL TEST",
    image: "cyber_1",
    instructions: [
      "Sometimes, feeling self-confident and secure seems impossible, especially if you’re a teen dealing with school, friends, family, and other challenges that can affect how you see yourself. This workbook helps you build up your self-esteem and confidence with creative activities and advice that show you how to think positively, release self-doubt, and start loving who you are."
//    ],
//    notes: [
//      "GOAL TEST"
    ]
  ),
    Resources(
    title: "It Gets Better",
//    headline: "GOAL TEST",
    image: "cyber_2",
    instructions: [
      "It Gets Better is a collection of expanded essays and new material from celebrities, everyday people and teens who have posted videos of encouragement, as well as new contributors who have yet to post videos to the site. While many of these teens couldn't see a positive future for themselves, we can. We can show LGBT youth the levels of happiness, potential and positivity their lives will reach if they can just get through their teen years. By sharing these stories, It Gets Better reminds teenagers in the LGBT community that they are not alone - and it WILL get better."
//    ],
//    notes: [
//      "GOAL TEST"
    ]
  ),
    Resources(
    title: "Deep Kindness: A Revolutionary Guide for the Way We Think, Talk, and Act in Kindness",
//    headline: "GOAL TEST",
    image: "cyber_3",
    instructions: [
      "Deep Kindness pairs anecdotes with actions that can make real change in our own lives, the lives of others, and throughout the world. Diving into the types of kindness the world needs most today, this book takes an honest look at the gap between our belief in kindness and our ability to practice it well—and shows us how to put intention into action."
//    ],
//    notes: [
//      "GOAL TEST"
    ]
  )
]


let bodyDysmorphiaResources: [Resources] = [
    Resources(
    title: "Perfectly Imperfect",
//    headline: "GOAL TEST",
    image: "body_1",
    instructions: [
      "In an age filled with polished images of models and celebrities, feeling happy and at home in your own body can be difficult. Perfectly Imperfect is your compassionate guide to developing a positive body image. It features practical, evidence-based strategies to help you transform any negative self-perceptions and heal your relationship with your body."
//    ],
//    notes: [
//      "GOAL TEST"
    ]
  ),
    Resources(
    title: "The Intuitive Eating Guide to Recovery: Let Go of Toxic Diet Culture, Reconnect with Food, and Build Self-Love",
//    headline: "GOAL TEST",
    image: "body_2",
    instructions: [
      "Intuitive eating means trusting your body to tell you what, when, and how much to eat―instead of sticking to restrictive diets. The Intuitive Eating Guide to Recovery gives you the tools to practice intuitive eating effectively and reframe the way you think about food and body image. You’ll learn to listen to your own hunger and fullness signals, and respect that all foods provide nourishment for your body, mind, and spirit."
//    ],
//    notes: [
//      "GOAL TEST"
    ]
  ),
    Resources(
    title: "Beautiful You: A Daily Guide to Radical Self-Acceptance",
//    headline: "GOAL TEST",
    image: "body_3",
    instructions: [
      "Every day, American women and girls are besieged by images and messages that suggest their beauty is inadequate—inflicting immeasurable harm upon their confidence and sense of wellbeing. In Beautiful You, author Rosie Molinary—in no uncertain terms—encourages women, whatever their size, shape, and color, to work toward feeling wonderful about themselves despite today’s media-saturated culture."
//    ],
//    notes: [
//      "GOAL TEST"
    ]
  )
]
