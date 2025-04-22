//
//  HomeView.swift
//  TaskPad
//
//  Created by Rakshit Patel on 4/21/25.
//

import SwiftUI
import Combine

struct Task: Identifiable {
    let id = UUID()
    let title: String
}

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var newTaskTitle: String = ""

    func addTask() {
        let trimmed = newTaskTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        let task = Task(title: trimmed)
        tasks.append(task)
        newTaskTitle = ""
    }
}


struct HomeView: View {
    @StateObject private var viewModel = TaskViewModel()

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter task...", text: $viewModel.newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading)

                    Button(action: {
                        viewModel.addTask()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                    .padding(.trailing)
                }
                .padding(.vertical)

                List {
                    ForEach(viewModel.tasks) { task in
                        Text(task.title)
                    }
                }
            }
            .navigationTitle("My Tasks")
        }
    }
}



#Preview {
    HomeView()
}
