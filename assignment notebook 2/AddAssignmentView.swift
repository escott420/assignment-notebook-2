//
//  AddAssignmentView.swift
//  assignment notebook 2
//
//  Created by Ethan Scott on 2/12/24.
//

import SwiftUI

struct AddAssignmentView: View {
    @ObservedObject var assignmentList: AssignmentList
    @State private var courses = ""
    @State private var desciption = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    static let courses = ["Math", "English", "Comp Sci"]
    var body: some View {
        NavigationView{
            Form {
                Picker("Courses", selection: $courses) {
                    ForEach(Self.courses, id: \ .self) { courses in
                        Text(courses)
                    }
                }
            }
        }
    }
}
struct AddAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentView(assignmentList: AssignmentList())
    }
}
