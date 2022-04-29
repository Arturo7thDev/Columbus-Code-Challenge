//
//  DataBaseManager.swift
//  Columbus Digital iOS Code Challenge
//
//  Created by Arturo González on 28/04/22.
//

//import Foundation
import CoreData
import UIKit

class DataBaseManager {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    //MARK: - Create Contact
    func createContact(contact: Contact, completion: @escaping (CreateContactResult) -> Void){
        
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Contacts", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        newUser.setValue(contact.name, forKey: "name")
        newUser.setValue(contact.phone, forKey: "phone")
        newUser.setValue(contact.email, forKey: "email")
        newUser.setValue(contact.address, forKey: "address")
        newUser.setValue(contact.notes, forKey: "notes")
        
        do {
          try context.save()
            completion(.success("Ok"))
         } catch {
             completion(.failure("Error"))
        }

    }
    
    enum CreateContactResult {
        case success(String)
        case failure(String)
    }

    //MARK: - Read Contact
     func readContacts(completion: @escaping (ContactListResult) -> Void){
         
        let context = appDelegate.persistentContainer.viewContext

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Contacts")
        request.returnsObjectsAsFaults = false
        do {
            var contactArray =  [Contact]()
                    let result = try context.fetch(request)
                    for data in result as! [NSManagedObject]
        {
                        let contact = Contact(name: data.value(forKey: "name") as! String, phone: data.value(forKey: "phone") as! String, email: data.value(forKey: "email") as! String, address: data.value(forKey: "address") as! String, notes: data.value(forKey: "notes") as! String)
                        
                        contactArray.append(contact)
          }
            completion(.success(contactArray))

               } catch {
                   completion(.failure("Error"))
        }
    }
  
    enum ContactListResult {
        case success([Contact])
        case failure(String)
    }
    
    func updateContact(currentPhoneNumber:String, phoneNumber: String, name:String, email:String, address:String, notes:String, completion: @escaping (EditContactResult) -> Void){

        let context = appDelegate.persistentContainer.viewContext

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Contacts")
        request.predicate = NSPredicate(format: "phone = %@", currentPhoneNumber)
        request.returnsObjectsAsFaults = false
        do {
                    let result = try context.fetch(request)
                    for data in result as! [NSManagedObject]
        {
                        data.setValue(name, forKey: "name")
                        data.setValue(email, forKey: "email")
                        data.setValue(phoneNumber, forKey: "phone")
                        data.setValue(address, forKey: "address")
                        data.setValue(notes, forKey: "notes")

                        print(".`````")
            print(data.value(forKey: "notes") as! String)
                        
                        do {
                          try context.save()
                            completion(.success("Ok"))
                            print("Success saved")
                         } catch {
                          print("Error saving")
                             completion(.failure("Error"))
                        }
          }
            
               } catch {

                   print("Failed")
        }
    }
    
    enum EditContactResult {
        case success(String)
        case failure(String)
    }}
