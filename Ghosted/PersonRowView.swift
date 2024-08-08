//
//  PersonRowView.swift
//  Ghosted
//
//  Created by Antoine Moreau on 2024/8/8.
//

import SwiftUI

struct PersonRowView: View {
    
    var person: Person
    
    var body: some View {
        HStack {
            if !person.photoName.isEmpty {
                Image(person.photoName)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 50)
            } else {
                Image(systemName: "person.fill")
                    .imageScale(.large)
                    .foregroundStyle(Color.accentColor)
            }
            VStack(alignment: .leading) {
                Text("\(person.firstName) ") + Text("\(person.lastName)").fontWeight(.heavy)
                Text("\(person.jobTitle), ").foregroundStyle(Color.gray) + Text("\(person.company)").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.gray)
            }
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    PersonRowView(person: PersonData().persons[0])
}
