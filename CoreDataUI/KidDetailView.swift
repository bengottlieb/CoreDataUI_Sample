//
//  KidDetailView.swift
//  CoreDataUI
//
//  Created by ben on 8/4/19.
//  Copyright © 2019 Stand Alone, Inc. All rights reserved.
//

import SwiftUI

struct KidDetailView: View {
	@ObservedObject var kid: KidViewModel
    @Environment(\.presentationMode) var presentationMode

	@State var name: String = ""
	
    var body: some View {
		NavigationView {
			Form() {
				HStack() {
					Text("Name")
					TextField("child name", text: $kid.name)
				}
			}
			.navigationBarItems(trailing: Button(action: {
				self.kid.save()
                self.presentationMode.value.dismiss()
			}) {
				Text("Save")
			})
		}

    }
}

#if DEBUG
struct KidDetailView_Previews: PreviewProvider {
    static var previews: some View {
		KidDetailView(kid: KidViewModel())
    }
}
#endif
