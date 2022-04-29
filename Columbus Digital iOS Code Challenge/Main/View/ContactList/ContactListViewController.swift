//
//  ContactListViewController.swift
//  Columbus Digital iOS Code Challenge
//
//  Created by Arturo González on 28/04/22.
//

import UIKit
import CoreData

class ContactListViewController: UIViewController, UITableViewDelegate {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet weak var contactListTableView: UITableView!
    
    private let contactListPresenter = ContactListPresenter(databaseManager: DataBaseManager())
    var contactListArray = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactListTableView.dataSource = self
        contactListTableView.delegate = self
        contactListPresenter.setViewDelegate(contactListProtocol: self)
        contactListPresenter.getContactList()
    }
}

extension ContactListViewController: ContactListProtocol {
    func getContactList(contactList: [Contact]) {
        contactListArray = contactList
        contactListTableView.reloadData()
    }
    
    func errorGettingContactList(errorMessage: String) {
        print(errorMessage)
    }
}

// MARK: - TableView Setup
extension ContactListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = contactListArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        contactListTableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(withIdentifier: "contactInformationViewController") as? ContactInformationViewController
        
        vc?.contactName = contactListArray[indexPath.row].name
        vc?.contactEmail = contactListArray[indexPath.row].email
        vc?.contactPhone = contactListArray[indexPath.row].phone
        vc?.contactAddress = contactListArray[indexPath.row].address!
        vc?.contactNotes = contactListArray[indexPath.row].notes!

        navigationController?.pushViewController(vc!, animated: true)
    }
}

