//
//  CurrencyIconView.swift
//  Ghosted
//
//  Created by Antoine Moreau on 2024/8/8.
//

import SwiftUI

struct CurrencyImageView: View {
    var currency: Person.Currency
    
    var body: some View {
        Image(systemName: currency.rawValue)
            .foregroundColor(currency.color)
            // .font(.largeTitle) // Customize size if needed
    }
}

#Preview {
    CurrencyImageView(currency: .euro)
}
