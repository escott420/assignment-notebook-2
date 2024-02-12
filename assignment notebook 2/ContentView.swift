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
            .sheet(isPresented: $showingAddItemView, content: {
                AddAssignmentView(assignmentList: assignmentList)
            })
            .navigationBarTitle("Assignment Notebook")
            .navigationBarItems(leading: EditButton(), trailing:
            Button(action: {
                showingAddItemView = true}) {
                    Image(systemName: "plus")
                })
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
