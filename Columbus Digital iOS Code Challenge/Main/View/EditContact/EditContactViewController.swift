//
//  EditContactViewController.swift
//  Columbus Digital iOS Code Challenge
//
//  Created by Arturo González on 28/04/22.
//

import UIKit
import CoreData

class EditContactViewController: UIViewController {
    
    
    @IBOutlet weak var edtxtName: UITextField!
    @IBOutlet weak var edtxtEmail: UITextField!
    @IBOutlet weak var edtxtPhone: UITextField!
    @IBOutlet weak var edtxtAddress: UITextField!
    @IBOutlet weak var edtxtNotes: UITextView!
    
    var contactName = ""
    var contactEmail = ""
    var contactPhone = ""
    var contactAddress = ""
    var contactNotes = ""
    
    private let editContactPresenter = EditContactPresenter(databaseManager: DataBaseManager())

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edtxtName.text = contactName
        edtxtEmail.text = contactEmail
        edtxtPhone.text = contactPhone
        edtxtAddress.text = contactAddress
        edtxtNotes.text = contactNotes
        
        editContactPresenter.setViewDelegate(editContactProtocol: self)

    }
    
    @IBAction func btnUpdateContact(_ sender: Any) {
        
        editContactPresenter.updateContact(currentPhoneNumber:contactPhone,phoneNumber: edtxtPhone.text!, name: edtxtName.text!, email: edtxtEmail.text!, address: edtxtAddress.text!, notes: edtxtNotes.text!)
        
        LoadingIndicatorManager.showAlertWithNavigationAction(viewController: self, title: "Actualización de Datos Exitosa", message: "El contacto se actualizo correctamente.")
    }
   
}

extension EditContactViewController: EditContactProtocol{
    func contactUpdateSuccessfully(successMessage: String) {
        print(successMessage)
    }
    
    func unsuccessfullyUpdateContact(errorMessage: String) {
        print(errorMessage)
    }
}
