//
//  AddContactViewController.swift
//  Columbus Digital iOS Code Challenge
//
//  Created by Arturo González on 28/04/22.
//

import UIKit
import CoreData

class AddContactViewController: UIViewController {
    
    @IBOutlet weak var edtxtName: UITextField!
    @IBOutlet weak var edtxtEmail: UITextField!
    @IBOutlet weak var edtxtPhone: UITextField!
    @IBOutlet weak var edtxtAddress: UITextField!
    @IBOutlet weak var edtxtNotes: UITextView!
    
    private let createContactPresenter = CreateContactPresenter(databaseManager: DataBaseManager())

    override func viewDidLoad() {
        super.viewDidLoad()
        createContactPresenter.setViewDelegate(createContactProtocol: self)
    }

    // MARK: - Actions
    @IBAction func btnAddContact(_ sender: Any) {
        let contact = Contact(name: edtxtName.text!, phone: edtxtPhone.text!, email: edtxtEmail.text!, address: edtxtAddress.text!, notes: edtxtNotes.text!)
        createContactPresenter.createContact(contact: contact)
    }
}

extension AddContactViewController: CreateContactProtocol{
    func contactSavedSuccessfully(successMessage: String) {
        LoadingIndicatorManager.showAlertWithNavigationAction(viewController: self, title: "Registro Exitoso", message: "El contacto se ha almacenado en la aplicación correctamente.")
        print(successMessage)
    }
    
    func unsuccessfullySavedContact(errorMessage: String) {
        print("Error Saved Contact: \(errorMessage)")
    }
}
