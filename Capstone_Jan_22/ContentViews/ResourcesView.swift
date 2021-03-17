// Resources View (can include a link to a website)

//  ResourcesView.swift
//  Capstone_Jan_22
//
//  Created by Samuel Faber on 3/2/21.
//

import SwiftUI
import SafariServices

struct ResourcesView: View {
    @State var showStackoverflow:Bool = false

    var body: some View {
        Button(action: { self.showStackoverflow = true }) {
            Text("Mental Health Awareness")
        }
        .sheet(isPresented: self.$showStackoverflow) {
            SFSafariViewWrapper(url: URL(string: "https://www.nami.org/Get-Involved/Awareness-Events/Mental-Health-Month")!)
        }
    }
}
struct SFSafariViewWrapper: UIViewControllerRepresentable {
    let url: URL
    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SFSafariViewWrapper>) {
        return
    }
}

struct ResourcesView_Previews: PreviewProvider {
    static var previews: some View {
        ResourcesView()
    }
}
