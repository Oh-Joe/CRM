//
//  NoteDetailView.swift
//  Ghosted
//
//  Created by Antoine Moreau on 2024/8/8.
//

import SwiftUI

struct NoteDetailView: View {
    @Environment(\.dismiss) var dismissScreen
    @EnvironmentObject var personData: PersonData
    
    var note: String
    var body: some View {
        NavigationStack {
            VStack {
                Text(note)
                Spacer()
            }
            .navigationTitle("Note")
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        dismissScreen()
                    }, label: {
                        Text("Close")
                    })
                }
            }
        }
    }
}

#Preview {
    NoteDetailView(note: "PreviewPreviewPreviewPreviewPreview")
}
