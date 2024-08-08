//
//  PersonListView.swift
//  Ghosted
//
//  Created by Antoine Moreau on 2024/8/8.
//

import SwiftUI

struct PersonListView: View {
    @EnvironmentObject var personData: PersonData
    @State private var selectedStatus: Person.Status? = nil

    var filteredPersons: [Person] {
        // Filter persons if a specific status is selected
        let personsToDisplay = selectedStatus == nil ? personData.persons : personData.persons.filter { $0.status == selectedStatus }

        // Sort persons by status and then by currency
        return personsToDisplay
            .sorted { lhs, rhs in
                // Sort by status
                if lhs.status != rhs.status {
                    return lhs.status.rawValue < rhs.status.rawValue
                }
                // Sort by currency
                return lhs.currency.rawValue < rhs.currency.rawValue
            }
    }

    var body: some View {
        NavigationStack {
            List(filteredPersons) { person in
                NavigationLink(destination: PersonDetailView(person: person)) {
                    HStack {
                        Text("\(person.firstName) \(person.lastName) (\(person.company))")
                        Spacer()
                        CurrencyImageView(currency: person.currency)
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
    PersonListView()
        .environmentObject(PersonData())
}
