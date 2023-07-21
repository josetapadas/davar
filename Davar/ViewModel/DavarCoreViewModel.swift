//
//  DavarCoreViewModel.swift
//  Davar
//
//  Created by José Tapadas Alves on 26/06/2023.
//

import Foundation
import CoreData

class DavarCoreViewModel: ObservableObject {
    let dataManager = CoreDataManager.instance
    
    @Published var projects: [ProjectEntity] = []
    
    init() {
        getProjects()
    }
    
    func getProjects() {
        let request = NSFetchRequest<ProjectEntity>(entityName: "ProjectEntity")
        
        do {
            projects = try dataManager.context.fetch(request)
            print("[+] Reloaded projects, \(projects.count)")
        } catch let error {
            print("[!] Error fetching Core Data entities: \(error)")
        }
    }
    
    func addProject(title t:String, description desc:String, dueDate date:Date) {
        let newProject = ProjectEntity(context: dataManager.context)
        newProject.title = t
        newProject.overview = desc
        newProject.dueDate = date
        
        save()
    }
    
    func save() {
        dataManager.save()
        getProjects()
    }
}
