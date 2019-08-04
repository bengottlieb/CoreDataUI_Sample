//
//  KidListView.swift
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

struct KidListView: View {
	@FetchRequest var fetchRequest: FetchedResults<Kid>
	@State var showDetails = false
	@State var selectedKid: Kid?
	
    var body: some View {
		NavigationView {
			VStack {
				List(fetchRequest) { kid in
					Button(action: {
						self.selectedKid = kid
						self.showDetails.toggle()
					}) {
						Text(kid.name ?? "None")
					}
				}
			}
			.navigationBarTitle(Text("CoreDataUI"))
			.navigationBarItems(trailing: Button(action: {
				self.selectedKid = nil
				self.showDetails.toggle()
			}) {
				Image(systemName: "plus.square")
			})
		}
		.sheet(isPresented: self.$showDetails) {
			KidDetailView(kid: KidViewModel(self.selectedKid))
		}

    }
}

#if DEBUG
struct KidListView_Previews: PreviewProvider {
    static var previews: some View {
		return KidListView(fetchRequest: DataStore.instance.kidRequest)
			.environment(\.managedObjectContext, DataStore.instance.persistentContainer.viewContext)
    }
}
#endif
