//
//  DavarApp.swift
//  Davar
//
//  Created by José Tapadas Alves on 16/06/2023.
//

import SwiftUI

@main
struct DavarApp: App {
    @StateObject var taskListViewModel: TaskListViewModel = TaskListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TaskListView()
            }
            .environmentObject(taskListViewModel)
        }
    }
}
