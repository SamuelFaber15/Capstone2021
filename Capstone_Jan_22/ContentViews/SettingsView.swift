//
//  SettingsView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 3/20/21.
//


import SwiftUI

struct SettingsView: View {
  // MARK: - PROPERTIES
  
    @State private var enableDepressionInsights: Bool = true
    @State private var enableAnxietyinsights: Bool = true
    @State private var enableCyberbullyingInsights: Bool = true
    @State private var enableSexualPredatorInsights: Bool = true
    @State private var enableBodyDysmorphiaInsights: Bool = true
    @State private var enableViolenceInsights: Bool = true
    @State private var enableSexualContentInsights: Bool = true
    @State private var enableSelfHarmInsights: Bool = true
    @State private var enableSuicidalIdeationInsights: Bool = true
  
  var body: some View {
    NavigationView{
    VStack(alignment: .center, spacing: 0) {
      // MARK: - HEADER
      VStack(alignment: .center, spacing: 5) {
        
//        Image("avocado")
//          .resizable()
//          .scaledToFit()
//          .padding(.top)
//          .frame(width: 100, height: 100, alignment: .center)
//          .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 4)
        
        Text("My Sidekick Settings")
          .font(.system(.title, design: .serif))
            .fontWeight(.light)
          .foregroundColor(Color("ColorGreenAdaptive"))
      }
      .padding()
        
      Form {
        
        Section(header: Text("Profile")) {
            NavigationLink(destination: ProfileView()) {
                Text("My Profile")
            }
            Button("Log Out") {
                FBAuth.logout { (result) in
                    print("Logged out")
                }
            }
        }
          .padding(.vertical, 3)
        // MARK: - SECTION #1
        Section(header: Text("Insight Topics")) {
            Toggle(isOn: $enableDepressionInsights) {
              Text("Depression")
            }
            
            Toggle(isOn: $enableAnxietyinsights) {
              Text("Anxiety")
            }
            
            Toggle(isOn: $enableCyberbullyingInsights) {
              Text("Cyberbullying")
                
            }

            Toggle(isOn: $enableSexualPredatorInsights) {
              Text("Sexual Predators")
            }
            
            Toggle(isOn: $enableBodyDysmorphiaInsights) {
              Text("Body Dysmorphia")
            }
            
            Toggle(isOn: $enableViolenceInsights) {
              Text("Violence")
            }
            
            Toggle(isOn: $enableSexualContentInsights) {
              Text("Sexual Content")
            }
            
            Toggle(isOn: $enableSelfHarmInsights) {
              Text("Self-Harm")
            }

            Toggle(isOn: $enableSuicidalIdeationInsights) {
              Text("Suicidal Ideation")
            }

        }
        
        
        // MARK: - SECTION 3
        
        Section(header: Text("Immediate Resources")) {
          FormRowLinkView(icon: "icon-facebook", color: Color.pink, text: "Website", link: "https://swiftuimasterclass.com")
          FormRowLinkView(icon: "icon-facebook", color: Color.blue, text: "Twitter", link: "https://twitter.com/robertpetras")
          FormRowLinkView(icon: "icon-facebook", color: Color.green, text: "Courses", link: "https://www.udemy.com/user/robert-petras")
        }
          .padding(.vertical, 3)

      }
    }
    .frame(maxWidth: 640)
  }
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
