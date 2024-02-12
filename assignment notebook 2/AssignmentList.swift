//
//  AssignmentList.swift
//  assignment notebook 2
//
//  Created by Ethan Scott on 2/12/24.
//

import Foundation

class AssignmentList: ObservableObject {
    @Published var items = [AssignmentItem(course: "Math", description: "Delta Math", dueDate: Date()), AssignmentItem(course: "English", description: "Essay", dueDate: Date()), AssignmentItem(course: "Comp Sci", description: "Unit 2 test", dueDate: Date())]
}
