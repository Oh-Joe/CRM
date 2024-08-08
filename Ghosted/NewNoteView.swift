//
//  NewNoteView.swift
//  Ghosted
//
//  Created by Antoine Moreau on 2024/8/8.
//

import SwiftUI

struct NewNoteView: View {
    @Environment(\.dismiss) var dismissScreen
    @EnvironmentObject var personData: PersonData
    @State private var textEditorText: String = ""
    var person: Person
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .topLeading) {
                    
                    // Placeholder text
                    if textEditorText.isEmpty {
                        
                        
                        Text("Type here")
                            .foregroundColor(Color.gray)
                            .padding(.horizontal, 12)
                    }
                    
                    // TextEditor
                    TextEditor(text: $textEditorText)
                        .frame(height: 250)
                        .foregroundColor(Color.primary)
                        .padding(.horizontal, 12)
                }
                
                Spacer()
                
                Button(action: {
                    saveNewNote()
                    dismissScreen()
                }, label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                })
                .disabled(textEditorText.isEmpty)
                .padding()
            }
            .navigationTitle("New Note")
            .navigationBarItems(trailing: Button("Cancel") {
                dismissScreen()
            })
        }
    }
    
    private func saveNewNote() {
        if !textEditorText.isEmpty {
            if let index = personData.persons.firstIndex(where: { $0.id == person.id }) {
                personData.persons[index].notes.append(textEditorText)
                textEditorText = ""
            }
        }
    }
}

#Preview {
    NewNoteView(person: PersonData().persons[0])
        .environmentObject(PersonData())
}
