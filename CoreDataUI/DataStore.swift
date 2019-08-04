//
//  DataStore.swift
//  CoreDataUI
//
//  Created by ben on 8/3/19.
//  Copyright © 2019 Stand Alone, Inc. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI

class DataStore {
	static let instance = DataStore()
	
	@discardableResult
	func addChild(withName: Bool = false) -> Kid {
		let name = ["Ada", "Baker", "Charlie", "D'arcy", "Edith", "Frankie", "George", "Harriet", "Ian", "Justine", "Kenny"].randomElement()
		
		let kid = Kid(context: self.persistentContainer.viewContext)
		kid.name = withName ? name! : ""
		return kid
	}
	
	var kidRequest: FetchRequest<Kid> {
		_ = self.persistentContainer		// if we don't put this here, we risk trying to access our model before it's been loaded
		
		return FetchRequest<Kid>(entity: Kid.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)])
	}
	
	// moved from Apple's AppDelegate implementation
	
	lazy var persistentContainer: NSPersistentCloudKitContainer = {
	    /*
	     The persistent container for the application. This implementation
	     creates and returns a container, having loaded the store for the
	     application to it. This property is optional since there are legitimate
	     error conditions that could cause the creation of the store to fail.
	    */
	    let container = NSPersistentCloudKitContainer(name: "CoreDataUI")
	    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
	        if let error = error as NSError? {
	            // Replace this implementation with code to handle the error appropriately.
	            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	             
	            /*
	             Typical reasons for an error here include:
	             * The parent directory does not exist, cannot be created, or disallows writing.
	             * The persistent store is not accessible, due to permissions or data protection when the device is locked.
	             * The device is out of space.
	             * The store could not be migrated to the current model version.
	             Check the error message to determine what the actual problem was.
	             */
	            fatalError("Unresolved error \(error), \(error.userInfo)")
	        }
	    })
	    return container
	}()

	// MARK: - Core Data Saving support

	func saveContext () {
	    let context = persistentContainer.viewContext
	    if context.hasChanges {
	        do {
	            try context.save()
	        } catch {
	            // Replace this implementation with code to handle the error appropriately.
	            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	            let nserror = error as NSError
	            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
	        }
	    }
	}

}
