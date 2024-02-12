//
//  ContentView.swift
//  assignment notebook 2
//
//  Created by Ethan Scott on 2/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentItems = [AssignmentItem(course: "Math", description: "Delta Math", dueDate: Date()), AssignmentItem(course: "English", description: "Essay", dueDate: Date()), AssignmentItem(course: "Comp Sci", description: "Unit 2 test", dueDate: Date())]
    var body: some View {
        NavigationView{
            List{
                ForEach(assignmentItems, id: \.id) { AssignmentItem in
                    Text(AssignmentItem.description)
                }
                .onMove { indices, newOffset in assignmentItems.move(fromOffsets: indices, toOffset: newOffset)
                }
                .onDelete { IndexSet in assignmentItems.remove(atOffsets: IndexSet)
                }
            }
            .navigationBarTitle("Assignment Notebook")
            .navigationBarItems(leading: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AssignmentItem: Identifiable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
