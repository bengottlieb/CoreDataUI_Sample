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

    var body: some View {
		NavigationView {
			Form() {
				Section(header: Text("Name")) {
					TextField("child name", text: $kid.name)
				}
				Section(header: Text("Information")) {
					DatePicker(selection: $kid.birthday, displayedComponents: .date) {
						Text("Birthday")
					}
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

struct KidBirthdayView: View {
	@State var birthday: Date
	
	var body: some View {
		DatePicker(selection: $birthday, displayedComponents: .date) {
			Text("Birthday")
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
