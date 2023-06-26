//
//  AddTaskView.swift
//  Davar
//
//  Created by José Tapadas Alves on 16/06/2023.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var taskListViewModel: TaskListViewModel
    
    @State var textTitleFieldValue: String = ""
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type your task here...", text: $textTitleFieldValue)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)

                })
                    
            }
            .padding(15)
            
        }
        .navigationTitle("Add new Task")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if isTextValid() {
            taskListViewModel.addItem(title: textTitleFieldValue)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func isTextValid() -> Bool {
        if (textTitleFieldValue.count < 3) {
            alertTitle = "⚠️ Invalid task title, please provide a more comprehensive one."
            showAlert.toggle()
            return false
        }
        
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddTaskView()
        }
        .environmentObject(TaskListViewModel())
    }
}
