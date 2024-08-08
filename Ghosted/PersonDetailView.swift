//
//  PersonDetailView.swift
//  Ghosted
//
//  Created by Antoine Moreau on 2024/8/8.
//

import SwiftUI

struct PersonDetailView: View {
    @EnvironmentObject var personData: PersonData
    @State var newNote: String = ""
    @State var showSheet: Bool = false
    @State var showNoteSheet: Bool = false
    @State private var selectedNote: String? = nil
    var person: Person
    
    var body: some View {
        NavigationView {
            VStack {
                PersonRowView(person: person)
                
                List {
                    Section(header: Text("Details")) {
                        HStack {
                            Image(systemName: "at")
                                .foregroundStyle(Color.gray)
                            Text(person.email)
                        }
                        HStack {
                            Image(systemName: "phone.fill")
                                .foregroundStyle(Color.gray)
                            Text(person.cellNumber)
                        }

                        Text("ID: \(person.id.uuidString)")
                            .font(.caption)
                            .foregroundStyle(Color.secondary)
                    }
                    
                    Section(header: Text("New Note")) {
                        Button(action: {
                            showSheet.toggle()
                        }, label: {
                            Text("Add note…")
                                .foregroundStyle(Color.accentColor)
                        })
                        .sheet(isPresented: $showSheet) {
                            NewNoteView(person: person)
                                .presentationDragIndicator(.visible)
                                .environmentObject(personData)
                        }
                    }
                    
                    Section(header: Text("Previous Notes")) {
                        ForEach(person.notes.reversed(), id: \.self) { note in
                            Button(action: {
                                selectedNote = note
                                showNoteSheet.toggle()
                            }) {
                                Text(note)
                                    .lineLimit(1)
                                    .truncationMode(.tail)
                            }
                        }
                    }
                }
                .listStyle(SidebarListStyle())
            }
            .padding()
            .sheet(isPresented: $showNoteSheet) {
                if let note = selectedNote {
                    NoteDetailView(note: note)
                        .presentationDragIndicator(.visible)
                }
            }
        }
    }
}

#Preview {
    PersonDetailView(person: PersonData().persons[0])
        .environmentObject(PersonData())
}
