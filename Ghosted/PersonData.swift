//
//  PersonData.swift
//  Ghosted
//
//  Created by Antoine Moreau on 2024/8/8.
//

import Foundation
import SwiftUI

struct Person: Identifiable {
    let id = UUID()
    var firstName: String
    var lastName: String
    var company: String
    var jobTitle: String
    var email: String
    var cellNumber: String
    var photoName: String
    var currency: Currency
    var isActiveClient: Bool
    
    var status: Status

    enum Status: String, CaseIterable, Codable {
        case activeClient = "active client"
        case warmLead = "warm lead"
        case coldLead = "cold lead"
    }
    
    enum Currency: String, CaseIterable {
        case dollar = "dollarsign.circle"
        case euro = "eurosign.circle"
        case pound = "sterlingsign.circle"
        case yen = "yensign.circle"
        case franc = "francsign.circle"
        case rupee = "rupeesign.circle"
        case won = "wonsign.circle"
        case lira = "lirasign.circle"
        case ruble = "rublesign.circle"
        case shekel = "shekelsign.circle"
        case noCurrency = ""
        
        var color: Color {
            switch self {
            case .dollar:
                return .green
            case .euro:
                return .yellow
            case .pound:
                return .purple
            case .yen:
                return .orange
            case .franc:
                return .brown
            case .rupee:
                return .red
            case .won:
                return .pink
            case .lira:
                return .cyan
            case .ruble:
                return .teal
            case .shekel:
                return .indigo
            case .noCurrency:
                return .clear
            }
        }
    }
    
    var notes: [String]
}

class PersonData: ObservableObject {
    @Published var persons: [Person] = [
        Person(firstName: "Manuel", lastName: "Calvino", company: "Tomauri", jobTitle: "Category Manager", email: "mcavino@tomauri.com", cellNumber: "+1 (905) 886-8122", photoName: "ManuelCalvino", currency: .dollar, isActiveClient: true, status: .activeClient, notes: ["22 May - I sent latest expected availability and feedback from PM/Logistics. The gist:\n\nMag 5: Confirm quantities (US and/or International version) or switch to new 10K mAh US-only version.\n\nMac 360: Recommend excluding for now.\n\nSELFIE SKUs: Available end of May. Confirm if you want them with initial PO.\n\n13 May - Manuel asked if new SKUs in SELFIE family available to order, in which case he'd like to add them. I relayed info from Grace (SHOT: end of May; the other 3 SKUs: around May 21). I recommended we proceed with order without these and put in a reserve PO in system for those SKUs.\n\n9 May - PO is 90% confirmed. Worth $11,645.00 as of today.", "14 June - announced that all should be ready by mid next week so to prepare payment, no feedback\n\n6 June - warehouses & forwarder information shared back and forth\n\n30 May - official PO in the mail. Lead tim communicated to Tomauri: mid-June. Mentioned payment should be made before. They said they have weekly payment runs on Fridays.","7 August - Teams call\nstock arrived a week ago\nwill start pushing now, Back To School will be an opportunity to gauge response from the channels\niStore\nMike visited office last week, project of vending machines\niStore website revamp\nAdam came up\nParadies\nprocesses went good no issues like wrong products received or wrong quantities, all good, thanks Logistics"]),
        Person(firstName: "Georgie", lastName: "Jeffery", company: "BrandQuest", jobTitle: "Vendor Director", email: "georgie@brandquestuk.co.uk", cellNumber: "+44 7702576169", photoName: "GeorgieJeffery", currency: .dollar, isActiveClient: true, status: .activeClient, notes: ["3 April - Georgie asking how much freight is. I said no way to tell per product as we get quote with every order. Asked if she has a selection of SKUs and I can ask for a quote for 10x of the SKUs in her selection. 27 March\nStuart said they'd have feedback around Wed. next week\n20 March\nsending pricing\nsending conversations with Olivia O'Reilly (Harvey Norman)", "10 April - email from Georgie: Would it be possible to arrange a select of samples so we can get a feel for the products and see the packaging? This will help us with presenting your range to our customers. Looking for: Powerbank option; Hub Stand; Wireless Charging pad; Casa Hub; Casa 200; We are talking to HMV, TKMax, Asda and Rymans."]),
        Person(firstName: "Joe", lastName: "Watkins", company: "Exertis", jobTitle: "Consumer Vendor Manager", email: "Joe.Watkins@exertis.com", cellNumber: "+44 7704 344 889", photoName: "JoeWatkins", currency: .noCurrency, isActiveClient: false, status: .coldLead , notes: ["1 Aug - Teams call\nTO DO\nsend best sellers\nsend FOB price list\nschedule meeting at IFA (Joe will attend)\n\nExertis only buys stock from within the EU, company policy from mother company DCC, very strict.\ndon't want to be importer on record (for safety issues)\nlead times\nshipping costs\nproducts look great\nMSRP seems good\nmight be a way to import into UK via a branch of Exertis that imports products from factories in China, Joe will put me in touch, but tricky due to personnel changes atm so might be a little while until he finds the right people.\n\n26July - I emailed asking if time for 15 min call one of these days, politely offering to assist in supplying info he needs to get back to Olivia. Joe replied offering to chat next week Thursday. I say yes.\n\n22 July 2024 - Olivia form Harvey Norman sent an intro email to Joe and myself"]),
        Person(firstName: "Cédric", lastName: "Holtzer", company: "Case For You", jobTitle: "Owner", email: "cedricholtzer@gmail.com", cellNumber: "+33 666686505", photoName: "CedricHoltzer", currency: .euro, isActiveClient: true, status: .activeClient , notes: ["7 May - Sent pitch by email:\n\n[…]\n\nJe t’invite à rechercher SELFIE dans le lien ci-dessous pour voir des visuels et les prix publics.\n\nVoici également ci-dessous tes tarifs en direct :\n\nSELFIE - ABTADSELFBK - €13.15 - €34.90\nSELFIE II - ABTADSELF2BK - €21.35 - €39.00\nSELFIE Light - ABTADSELFLIBK - €13.70 - €24.90\nSELFIE Pro - ABTADSELFPRBK - €43.20 - €79.00\nSELFIE Shot - ABTADSELFSHBK - €37.70 - €69.00", "Preparing new order for power banks and possibly magnetic charge stations this week.\nHe's considering cables, but for now until we offer payment terms he will not range new SKUs.\nIf I can offer some terms he'll take USB-C to Lightning and USB-C- to -C.", "24 May - I informed Cédric we can give Net 30 on orders over 3K USD. He happy. Next order next week.","14 June\n\nI sent a pic of the MS100 acrylic on-hook display and mentioned we can send one or two if he decides to range the magnetic cables.\nCédric says thank you for the samples and the picture.\n\n12 June 2024 - today I asked Stella to ship the samples below:\n1x SELFIE II\n1x GRAVITY F5C green\n1x MS100\n1x MS200\n1x MP100\n1x MP200", "8 August 2024 - phone call to catch up\n\nStrax went under\nHe wants to prepare new order, incl. new SKUs:\nSELFIE SKUs\nSTRAP Pure\n(maybe) magnetic cables\n\nWe will talk Mon. to prepare order together"])
    ]
}
