//
//  AddGoalView.swift
//  Capstone_Jan_22
//
//  Created by Ashleigh Koener on 4/2/21.
//

import SwiftUI



struct AddGoalView_Tut: View {
    
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
        TextField("Enter goal", text: $goalName)
            .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
        
        Button("Commit to Goal") {
            coreDM.saveGoal(name: goalName)
            populateGoals()
        }.foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()

    .background(LinearGradient(gradient: Gradient(colors: [Color("ButtonColor1"), Color("ButtonColor2"), Color("ButtonColor3")]), startPoint: .top, endPoint: .bottom))
    .clipShape(Capsule())
    .padding(.top,5)
    }
    
//    .sheet(isPresented: $showingAddTodoView) {
//      AddGoalView().environment(\.managedObjectContext, self.managedObjectContext)
//    }
//    .overlay(
//      ZStack {
//        Group {
//          Circle()
//            .fill(Color.green)
//            .opacity(self.animatingButton ? 0.2 : 0)
//            //.scaleEffect(self.animatingButton ? 1 : 0)
//            .frame(width: 68, height: 68, alignment: .center)
//          Circle()
//            .fill(Color.green)
//            .opacity(self.animatingButton ? 0.15 : 0)
//            //.scaleEffect(self.animatingButton ? 1 : 0)
//            .frame(width: 88, height: 88, alignment: .center)
//        }
//        //.animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
//
//        Button(action: {
//          self.showingAddTodoView.toggle()
//        }) {
//          Image(systemName: "plus.circle.fill")
//            .resizable()
//            .scaledToFit()
//            .background(Circle().fill(Color("ColorBase")))
//            .frame(width: 48, height: 48, alignment: .center)
//        } //: BUTTON
//        .accentColor(.green)
//          .onAppear(perform: {
//             self.animatingButton.toggle()
//          })
//      } //: ZSTACK
//        .padding(.bottom, 15)
//        .padding(.trailing, 15)
//        , alignment: .bottomTrailing
//    )
//} //: NAVIGATION
//  .navigationViewStyle(StackNavigationViewStyle())

}

struct AddGoalView_Tut_Previews: PreviewProvider {
    static var previews: some View {
        AddGoalView()
    }
}
