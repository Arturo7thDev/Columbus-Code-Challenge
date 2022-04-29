//
//  CreateContactProtocol.swift
//  Columbus Digital iOS Code Challenge
//
//  Created by Arturo González on 29/04/22.
//

import Foundation

protocol CreateContactProtocol: AnyObject {
    func contactSavedSuccessfully(successMessage: String)
    func unsuccessfullySavedContact(errorMessage: String)
}

