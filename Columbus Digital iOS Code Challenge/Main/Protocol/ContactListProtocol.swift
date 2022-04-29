//
//  ContactListProtocol.swift
//  Columbus Digital iOS Code Challenge
//
//  Created by Arturo González on 29/04/22.
//

import Foundation

protocol ContactListProtocol: AnyObject {
    func getContactList(contactList: [Contact])
    func errorGettingContactList(errorMessage: String)
}
