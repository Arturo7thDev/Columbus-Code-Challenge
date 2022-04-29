//
//  Contact.swift
//  Columbus Digital iOS Code Challenge
//
//  Created by Arturo González on 28/04/22.
//

import Foundation

struct Contact {
    
    public let name: String
    public let phone: String
    public let email: String
    public let address: String?
    public let notes: String?

    init (name: String, phone: String, email: String, address: String? = nil, notes: String? = nil) {
        self.name = name
        self.phone = phone
        self.email = email
        self.address = address
        self.notes = notes
    }
}
