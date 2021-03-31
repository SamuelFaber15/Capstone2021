//
//  GoalsView_Tut.swift
//  Capstone_Jan_22
//
//  Created by Ashleigh Koener on 3/30/21.
//

import SwiftUI

struct GoalsView_Tut: View {
    
    let coreDM: CoreDataManager
    @State private var goalName: String = ""
    //NOT A GOOD IDEA TO USE STATE TO POPULATE DATA FrOM THRID PARTY CALL ^^
    @State private var goals: [Goal] = [Goal]()
    var quotes: [Quotes] = quotesData
    var headers: [Header] = headersData


    
    private func populateGoals() {
        goals = coreDM.getAllGoals()
    }
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {

            
//            Text("Life Hacks")
//              .fontWeight(.bold)
//              .modifier(TitleModifier())

            ScrollView(.horizontal, showsIndicators: false) {
              HStack(alignment: .top, spacing: 60) {
                ForEach(quotes) { item in
                  QuotesView(quote: item)
                }
              }
              .padding(.vertical)
              .padding(.leading, 60)
              .padding(.trailing, 20)
            }

            VStack{
                TextField("Enter name", text: $goalName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Save") {
                    coreDM.saveGoal(name: goalName)
                    populateGoals()
                }
                
//                List(goals, id: \.self) {goal in
//                    Text(goal.title ?? "")
//                }
                
                List{
                    
                    ForEach(goals, id: \.self) {goal in
                        Text(goal.name ?? "")
                    }.onDelete(perform: { indexSet in
                        indexSet.forEach { index in
                            let goal = goals[index]
                            //delete it using Core Data Manager
                            coreDM.deleteGoal(goal: goal)
                            populateGoals()
                        }
                    })
                }
                Spacer()
            }.padding()
//            .navigationTitle("Goals")
            
            .onAppear(perform: {
                goals = coreDM.getAllGoals()
            })
        }
        }}
}

struct GoalsView_Tut_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView_Tut(coreDM: CoreDataManager())
    }
}
