//
//  HomeView.swift
//  TaskPad
//
//  Created by Rakshit Patel on 4/21/25.
//

import SwiftUI
import Combine

struct Task: Identifiable, Codable {
    let id: UUID
    let title: String

    init(id: UUID = UUID(), title: String) {
        self.id = id
        self.title = title
    }
}


struct HomeView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [],
        animation: .default)
    private var tasks: FetchedResults<TaskEntity>

    @State private var newTaskTitle: String = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter task...", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading)

                    Button(action: addTask) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                    .padding(.trailing)
                }
                .padding(.vertical)

                List {
                    ForEach(tasks) { task in
                        Text(task.title ?? "")
                    }
                }
            }
            .navigationTitle("My Tasks")
        }
    }

    private func addTask() {
        let trimmed = newTaskTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }

        let task = TaskEntity(context: viewContext)
        task.title = trimmed
        newTaskTitle = ""

        do {
            try viewContext.save()
        } catch {
            print("Error saving: \(error.localizedDescription)")
        }
    }
}



#Preview {
    HomeView()
}
