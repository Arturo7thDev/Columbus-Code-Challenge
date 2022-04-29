//
//  CreateContactPresenter.swift
//  Columbus Digital iOS Code Challenge
//
//  Created by Arturo González on 29/04/22.
//

import Foundation

class CreateContactPresenter {
    
    private let databaseManager: DataBaseManager
    weak private var createContactProtocol: CreateContactProtocol?
    
    init(databaseManager: DataBaseManager){
        self.databaseManager = databaseManager
    }
    
    func setViewDelegate(createContactProtocol: CreateContactProtocol?){
        self.createContactProtocol = createContactProtocol
    }
    
    func createContact(contact: Contact){
        databaseManager.createContact(contact: contact) { [weak self] completionResult in
            switch completionResult {
            case .success(let successMessage):
                self?.createContactProtocol?.contactSavedSuccessfully(successMessage: successMessage)
            case .failure(let errorMessage):
                self?.createContactProtocol?.unsuccessfullySavedContact(errorMessage: errorMessage)
            }
        }
    }
}
