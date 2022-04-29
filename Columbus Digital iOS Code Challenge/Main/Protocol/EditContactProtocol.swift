//
//  EditContactProtocol.swift
//  Columbus Digital iOS Code Challenge
//
//  Created by Arturo González on 29/04/22.
//

import Foundation

protocol EditContactProtocol: AnyObject {
    func contactUpdateSuccessfully(successMessage: String)
    func unsuccessfullyUpdateContact(errorMessage: String)
}
