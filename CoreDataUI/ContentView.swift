//
//  ContentView.swift
//  CoreDataUI
//
//  Created by ben on 8/3/19.
//  Copyright © 2019 Stand Alone, Inc. All rights reserved.
//

import SwiftUI
import CoreData

extension Kid: Identifiable {
	public var id: String { return self.name ?? "\(self)" }
}

struct ContentView: View {
	@FetchRequest var fetchRequest: FetchedResults<Kid>
	
    var body: some View {
		NavigationView {
			VStack {
				List(fetchRequest) { kid in
					Text(kid.name ?? "None")
				}
			}
			.navigationBarTitle(Text("CoreDataUI"))
			.navigationBarItems(trailing: Button(action: {
				DataStore.instance.addChild()
			}) {
				Image(systemName: "plus.square")
			})
		}
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		return ContentView(fetchRequest: DataStore.instance.kidRequest)
			.environment(\.managedObjectContext, DataStore.instance.persistentContainer.viewContext)
    }
}
#endif
