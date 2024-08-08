//
//  ContentView.swift
//  Ghosted
//
//  Created by Antoine Moreau on 2024/8/8.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var personData = PersonData()
//    @State private var selection: Tab = .people
//    
//    enum Tab {
//        case people
//        case accounts
//    }
    
    var body: some View {

//        TabView(selection: $selection) {
            PersonListView()
//                .tabItem {
//                    Label("Contacts", systemImage: "person")
//                }
//                .tag(Tab.people)
//                .environmentObject(personData)
//            
//            Text("Hey What's Up.")
//                .tabItem {
//                    Label("Accounts", systemImage: "building.2")
//                }
//                .tag(Tab.accounts)
//        }
        .environmentObject(personData)
    }
}

#Preview {
    ContentView()
        .environmentObject(PersonData())
}
