//
//  ContentView.swift
//  assignment notebook 2
//
//  Created by Ethan Scott on 2/12/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var assignmentList = AssignmentList()
    @State private var showingAddItemView = false
    var body: some View {
        NavigationView{
            List{
                if assignmentList.items.isEmpty {
                    Text("No assignments found. Add new assignments using the '+' button.")
                } else {
                    ForEach(assignmentList.items, id: \.id) { AssignmentItem in
                        HStack{
                            VStack(alignment: .leading){
                                Text(AssignmentItem.course)
                                    .font(.headline)
                                Text(AssignmentItem.description)
                            }
                            Spacer()
                            Text(AssignmentItem.dueDate, style: .date)
                        }
                    }
                    .onMove { indices, newOffset in assignmentList.items.move(fromOffsets: indices, toOffset: newOffset)
                    }
                    .onDelete { IndexSet in assignmentList.items.remove(atOffsets: IndexSet)
                    }
                }
                }
            .sheet(isPresented: $showingAddItemView, content: {
                AddAssignmentView(assignmentList: assignmentList)
            })
                .navigationBarTitle("Assignment Notebook")
                    .navigationBarItems(leading: EditButton(), trailing:
                                            Button(action: {
                        showingAddItemView = true}) {
                            Image(systemName: "plus.circle.fill")
                        })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AssignmentItem: Identifiable, Codable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
    var closeDate = String()
}

struct AssignmentRowView: View {
    var assignmentItem: AssignmentItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(assignmentItem.course)
                    .font(.headline)
                Text(assignmentItem.description)
            }
            Spacer()
            Text(assignmentItem.dueDate, style: .date)
                .foregroundColor(dueDateColor())
        }
        .padding()
        .background(priorityColor())
    }
    
    private func dueDateColor() -> Color {
        // Customize text color based on due date, e.g., red for overdue assignments
        return assignmentItem.dueDate < Date() ? .red : .primary
    }
    
    private func priorityColor() -> Color {
        // Customize background color based on priority
        switch assignmentItem.closeDate {
        case "High":
            return Color.red.opacity(0.8)
        case "Medium":
            return Color.orange.opacity(0.8)
        case "Low":
            return Color.green.opacity(0.8)
        default:
            return Color.gray.opacity(0.8)
        }
    }
}
