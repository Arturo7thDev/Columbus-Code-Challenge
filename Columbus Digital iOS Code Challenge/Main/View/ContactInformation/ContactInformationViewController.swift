//
//  ContactInformationViewController.swift
//  Columbus Digital iOS Code Challenge
//
//  Created by Arturo González on 28/04/22.
//

import UIKit

class ContactInformationViewController: UIViewController {

    @IBOutlet weak var txtContactName: UILabel!
    @IBOutlet weak var txtContactEmail: UILabel!
    @IBOutlet weak var txtContactPhone: UILabel!
    @IBOutlet weak var txtContactAddress: UILabel!
    @IBOutlet weak var txtContactNotes: UITextView!
    
    var contactName = ""
    var contactEmail = ""
    var contactPhone = ""
    var contactAddress = ""
    var contactNotes = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtContactName.text = contactName
        txtContactEmail.text = "Email: \(contactEmail)"
        txtContactPhone.text = "Phone Number: \(contactPhone)"
        txtContactAddress.text = "Address: \(contactAddress)"
        txtContactNotes.text = contactNotes

    }
    
    @IBAction func btnEditContact(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "editContactViewController") as? EditContactViewController
        
        vc?.contactName = contactName
        vc?.contactEmail = contactEmail
        vc?.contactPhone = contactPhone
        vc?.contactAddress = contactAddress
        vc?.contactNotes = contactNotes


        navigationController?.pushViewController(vc!, animated: true)
    }
  
}
