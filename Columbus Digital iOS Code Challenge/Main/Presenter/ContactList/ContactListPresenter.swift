//
//  ContactListPresenter.swift
//  Columbus Digital iOS Code Challenge
//
//  Created by Arturo González on 29/04/22.
//

import Foundation

class ContactListPresenter {
    
    private let databaseManager: DataBaseManager
    weak private var contactListProtocol: ContactListProtocol?
    
    
    init(databaseManager: DataBaseManager){
        self.databaseManager = databaseManager
    }
    
    func setViewDelegate(contactListProtocol: ContactListProtocol?){
        self.contactListProtocol = contactListProtocol
    }
    
    func getContactList(){
        databaseManager.readContacts() { [weak self] completionResult in
            switch completionResult {
            case .success(let contactList):
                self?.contactListProtocol?.getContactList(contactList: contactList)
            case .failure(let errorMessage):
                self?.contactListProtocol?.errorGettingContactList(errorMessage: errorMessage)
            }
        }
    }
}
