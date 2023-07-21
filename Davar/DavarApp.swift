//
//  DavarApp.swift
//  Davar
//
//  Created by José Tapadas Alves on 16/06/2023.
//

import SwiftUI

@main
struct DavarApp: App {
        init() {
            let appearance = UINavigationBarAppearance()
            let backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)

            appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
            appearance.backgroundColor = UIColor.white.withAlphaComponent(0.9)
            appearance.backgroundEffect = backgroundEffect
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
    
        var body: some Scene {
        WindowGroup {
            NavigationView {
                TaskListView()
            }
        }
    }
}
