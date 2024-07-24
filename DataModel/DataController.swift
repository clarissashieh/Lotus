//
//  DataController.swift
//  lotusNotes
//
//  Created by Nadia Iskandar on 4/15/23.
//
import Foundation
import CoreData
class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "JournalModel")
    
    init(){
        container.loadPersistentStores{desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
                
            }
            
        }
    }
    
    func save(context:NSManagedObjectContext){
        do{
            try context.save()
            print("Data saved")
        }catch {
            print("We could not save the data")
        }
        
    }
    
    func addEntry(date: Date, entry: String, context: NSManagedObjectContext){
        let journal = Journal(context:context)
        journal.date = Date()
        journal.entry = entry
        
        save(context:context)
        
    }
    
    func editEntry(journal: Journal, entry: String, context:NSManagedObjectContext){
        journal.date = Date()
        journal.entry = entry
        
        save(context:context)
    }
}
