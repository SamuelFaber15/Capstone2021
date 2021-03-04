//
//  ProfileView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 3/2/21.
//

import SwiftUI

struct ProfileView: View {
    // MARK: - State
    
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - State (via initialiser)
    
    @EnvironmentObject var userInfo: UserInfo
    @State var presentEditUserSheet = false

    
    private func editButton(action: @escaping () -> Void) -> some View {
      Button(action: { action() }) {
        Text("Edit")
      }
    }
    // MARK: - UI Components
    
    var body: some View {
        Form {
          Section(header: Text("Name")) {
            Text(userInfo.user.name)
          }
          
          Section(header: Text("Email")) {
            Text(userInfo.user.email)
          }
        }
        .navigationBarTitle("Profile")
        .navigationBarItems(trailing: editButton {
          self.presentEditUserSheet.toggle()
        })
        .onAppear() {
          print("BookDetailsView.onAppear() for \(self.userInfo.user.name)")
        }
        .onDisappear() {
          print("BookDetailsView.onDisappear()")
        }
        .sheet(isPresented: self.$presentEditUserSheet) {
            ProfileEditView(userInfo: self.userInfo).environmentObject(self.userInfo)
//            { result in
//            if case .success(let action) = result, action == .delete {
//              self.presentationMode.wrappedValue.dismiss()
//            }
//          }
        }
    
  }

//  struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
////      let book = Book(title: "Changer", author: "Matt Gemmell", numberOfPages: 474)
//      return
////        NavigationView { // (2)
////            ProfileView(userInfo: UserInfo)
////        }
//    }
//  }
}
