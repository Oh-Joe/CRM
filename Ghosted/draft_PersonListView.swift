//
//  draft_PersonListView.swift
//  Ghosted
//
//  Created by Antoine Moreau on 2024/8/8.
//

import SwiftUI

struct draft_PersonListView: View {
    @EnvironmentObject var personData: PersonData
    @State private var selectedStatus: Person.Status? = nil
    
    var filteredPersons: [Person] {
        if let status = selectedStatus {
            return personData.persons.filter { $0.status == status }
        } else {
            return personData.persons
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredPersons) { person in
                NavigationLink(destination: PersonDetailView(person: person)) {
                    HStack {
                        Text("\(person.firstName) \(person.lastName) (\(person.company))")
                        Spacer()
                        Image(systemName: person.isActiveClient ? "\(person.currency).circle" : "")
                            .foregroundStyle(Color.green)
                    }
                }
            }
            .navigationTitle("Contacts")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Text("Filter contacts")
                                .font(.headline)
                                .padding(.bottom, 5)
                        Picker("Filter by Status", selection: $selectedStatus) {
                            Text("Show all").tag(Person.Status?.none)
                            ForEach(Person.Status.allCases, id: \.self) { status in
                                Text(status.rawValue.capitalized)
                                    .tag(status as Person.Status?)
                            }
                        }
                    } label: {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                    }
                }
            }
        }
    }
}

#Preview {
    draft_PersonListView()
        .environmentObject(PersonData())
}
