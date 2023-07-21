//
//  TaskListView.swift
//  Davar
//
//  Created by José Tapadas Alves on 16/06/2023.
//

import SwiftUI

struct TaskListView: View {
    @StateObject var viewModel = DavarCoreViewModel()

    var body: some View {
        ScrollView {
            ForEach(viewModel.projects) { project in
                TaskListRowView(projectEntity: project)
                    .padding(10)
            }
        }
        .navigationTitle("Projects Overview")
        .navigationBarItems(
            trailing: NavigationLink("Add new project", destination: AddTaskView())
        )
        .onAppear {
            viewModel.getProjects()
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TaskListView()
        }
    }
}
