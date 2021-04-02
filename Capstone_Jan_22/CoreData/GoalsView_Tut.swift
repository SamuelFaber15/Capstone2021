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
//        NavigationView{
//            ScrollView(.vertical, showsIndicators: false) {
//            ScrollView(.vertical, showsIndicators: false) {
//              VStack(alignment: .center, spacing: 20) {

            
//            Text("Life Hacks")
//              .fontWeight(.bold)
//              .modifier(TitleModifier())


            VStack{
                
                ScrollView(.horizontal, showsIndicators: false) {
                  HStack(alignment: .top, spacing: 0) {
                    ForEach(headers) { item in
                      HeaderView(header: item)
                    }
                  }
                  .ignoresSafeArea()

                }
//                ScrollView(.horizontal, showsIndicators: false) {
//                  HStack(alignment: .top, spacing: 60) {
//                    ForEach(quotes) { item in
//                      QuotesView(quote: item)
//                    }
//                  }
//                  .padding(.vertical)
//                  .padding(.leading, 60)
//                  .padding(.trailing, 20)
//                }

                
                TextField("Enter goal", text: $goalName)
                    .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                
                Button("Commit to Goal") {
                    coreDM.saveGoal(name: goalName)
                    populateGoals()
                }.foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()

            .background(LinearGradient(gradient: Gradient(colors: [Color("ButtonColor1"), Color("ButtonColor2"), Color("ButtonColor3")]), startPoint: .top, endPoint: .bottom))
            .clipShape(Capsule())
            .padding(.top,5)
                
//                List(goals, id: \.self) {goal in
//                    Text(goal.title ?? "")
//                }
                
                Form{
                    
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
                }.padding(.top,20)

                Spacer()
                

            }.ignoresSafeArea()
//            .navigationTitle("Goals")
            
            .onAppear(perform: {
                goals = coreDM.getAllGoals()
            })
        
        
        }
            }
//}

struct GoalsView_Tut_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView_Tut(coreDM: CoreDataManager())
    }
}
