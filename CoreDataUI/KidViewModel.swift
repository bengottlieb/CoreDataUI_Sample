//
//  Kid.swift
//  CoreDataUI
//
//  Created by ben on 8/4/19.
//  Copyright © 2019 Stand Alone, Inc. All rights reserved.
//

import Foundation
import CoreData
import Combine
import SwiftUI

class KidViewModel: ObservableObject {
	var kid: Kid?
	
	var objectWillChange = PassthroughSubject<Void, Error>()
	
	init(_ kid: Kid? = nil) {
		self.name = kid?.name ?? ""
		self.birthday = Date()
		self.kid = kid
	}
	
	var ageString: String { return "\(self.age)" }
	@Published var birthday: Date
	@Published var name: String
	var age: Int {
		return Calendar.current.dateComponents([.year], from: self.birthday, to: Date()).year ?? 1
	}
	
	func save() {
		if self.kid == nil { self.kid = DataStore.instance.addChild(withName: false) }
		
		self.kid?.name = self.name
		DataStore.instance.saveContext()
	}
}
