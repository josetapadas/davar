//
//  AddTaskView.swift
//  Davar
//
//  Created by José Tapadas Alves on 16/06/2023.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = DavarCoreViewModel()
    
    @State var textTitleFieldValue: String = ""
    @State var textDescriptionFieldValue: String = ""
    @State var dueDateFieldValue = Date.now
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("Type your task here...", text: $textTitleFieldValue)
                        .frame(height: 55)
                        .cornerRadius(10)
                } header: {
                    Text("Name")
                }
                
                Section {
                    TextEditor(text: $textDescriptionFieldValue)
                        .frame(height: 165)
                        .cornerRadius(10)
                } header: {
                    Text("Description")
                }
                
                Section {
                    DatePicker(
                            "Due date",
                            selection: $dueDateFieldValue,
                            displayedComponents: [.date]
                        )
                } header: {
                    Text("Dates")
                }
            }
            
            Button(action: saveButtonPressed, label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .padding(15)
            })
            
            Spacer()
        }
        .navigationTitle("New Project")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if isTextValid() {
            viewModel.addProject(title: textTitleFieldValue, description: textDescriptionFieldValue, dueDate: dueDateFieldValue)
            presentationMode.projectedValue.wrappedValue.dismiss()
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
    }
}
