//
//  EditContactPresenter.swift
//  Columbus Digital iOS Code Challenge
//
//  Created by Arturo González on 29/04/22.
//

import Foundation

class EditContactPresenter {
    
    private let databaseManager: DataBaseManager
    weak private var editContactProtocol: EditContactProtocol?
    
    init(databaseManager: DataBaseManager){
        self.databaseManager = databaseManager
    }
    
    func setViewDelegate(editContactProtocol: EditContactProtocol?){
        self.editContactProtocol = editContactProtocol
    }
    
    func updateContact(currentPhoneNumber:String,phoneNumber: String, name: String, email: String, address: String, notes: String){
        
        databaseManager.updateContact(currentPhoneNumber: currentPhoneNumber, phoneNumber: phoneNumber, name: name, email: email, address: address, notes: notes) { [weak self] completionResult in
            switch completionResult {
            case .success(let okMessage):
                self?.editContactProtocol?.contactUpdateSuccessfully(successMessage: okMessage)
            case .failure(let errorMessage):
                self?.editContactProtocol?.unsuccessfullyUpdateContact(errorMessage: errorMessage)
            }
        }
        
    }
}
