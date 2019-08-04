//
//  Kid.swift
//  CoreDataUI
//
//  Created by ben on 8/4/19.
//  Copyright © 2019 Stand Alone, Inc. All rights reserved.
//

import Foundation
import CoreData


class KidViewModel: ObservableObject {
	var kid: Kid?
	
	init(_ kid: Kid? = nil) {
		self.name = kid?.name ?? ""
		self.kid = kid
	}
	
	var name: String
	
	func save() {
		if self.kid == nil { self.kid = DataStore.instance.addChild(withName: false) }
		
		self.kid?.name = self.name
		DataStore.instance.saveContext()
	}
}
