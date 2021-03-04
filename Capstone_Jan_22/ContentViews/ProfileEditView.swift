//
//  ProfileEditView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 3/3/21.
//

import SwiftUI
import FirebaseFirestore
import Firebase

struct ProfileEditView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @State var presentActionSheet = false

    // MARK: - State (Initialiser-modifiable)
    @EnvironmentObject var userInfo: UserInfo
    @State var name : String
    @State var email : String
    @State var user: UserViewModel = UserViewModel()
    private var db = Firestore.firestore()
    
    
    init(userInfo: UserInfo) {
        self._name = State(initialValue: userInfo.user.name)
        self._email = State(initialValue: userInfo.user.email) //<< here set the value from Firebase
    }
    
    // MARK: - UI Components
    
    var cancelButton: some View {
      Button(action: { self.handleCancelTapped() }) {
        Text("Cancel")
      }
    }
    
    var saveButton: some View {
      Button(action: { self.handleDoneTapped() }) {
        Text("Save")
      }
      .disabled(name == userInfo.user.name && email == userInfo.user.email)
    }
    
    var body: some View {
      NavigationView {
        Form {
          Section(header: Text("Name")) {
            TextField("Name", text: $name)
          }
          
          Section(header: Text("Email")) {
            TextField("Email", text: $email)
          }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.large)
        .navigationBarItems(
          leading: cancelButton,
          trailing: saveButton
        )
      }
    }
    
    func reauthUser() {
        let user = Auth.auth().currentUser
        let credential: AuthCredential = EmailAuthProvider.credential(withEmail: "sfaber@byu.edu", password: "Password123")

        // Prompt the user to re-provide their sign-in credentials

        user?.reauthenticate(with: credential) { authResults, error in
//          if let error = error {
//            // An error happened.
//          } else {
//            // User re-authenticated.
//          }
        }
    }
    
    func updateUser() {
        let db = Firestore.firestore()
//        var credential: AuthCredential
        print(self.user.password)
        print("***here***")
        print(self.name)
        db.collection("users").document(self.userInfo.user.uid).updateData(["name": self.name,"email": self.email])
        if self.email != userInfo.user.email{
            reauthUser()
//            if let user = Auth.auth().currentUser {
                Auth.auth().currentUser?.updateEmail(to: self.email) { (error) in
                    if error != nil{
                        print(error ?? "Error")
                    }
                  // ...
                }
        }
    }
    
    // MARK: - Action Handlers
    
    func handleCancelTapped() {
      self.dismiss()
    }
    
    func handleDoneTapped() {
      self.updateUser()
      self.dismiss()
      self.userInfo.configureFirebaseStateDidChange()
    }
    
    func dismiss() {
      self.presentationMode.wrappedValue.dismiss()
    }
  }

//  struct ProfileEditView_Previews: PreviewProvider {
//    static var previews: some View {
//    }
//  }


