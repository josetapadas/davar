//
//  TaskListViewModel.swift
//  Davar
//
//  Created by José Tapadas Alves on 21/06/2023.
//

import Foundation

class TaskListViewModel: ObservableObject {
    @Published var items: [TaskModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let STORAGE_KEY = "items_key"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let storedData = UserDefaults.standard.data(forKey: STORAGE_KEY),
            let decodedData = try? JSONDecoder().decode([TaskModel].self, from: storedData)
        else {
           return
        }
        
        self.items = decodedData
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = TaskModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: TaskModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: STORAGE_KEY)
        }
    }
}
