//
//  TaskListRowView.swift
//  Davar
//
//  Created by José Tapadas Alves on 16/06/2023.
//

import SwiftUI

struct TaskListRowView: View {
    let projectEntity: ProjectEntity
    
    var body: some View {
        VStack {
            Text(projectEntity.title ?? "")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.headline)
            Text(projectEntity.overview ?? "")
                .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
                .font(.subheadline)
            HStack {
                ProgressView(value: 0.25)
                    .progressViewStyle(LinearProgressViewStyle())
                    .accentColor(Color.black)
                Text("25%")
                    .font(.subheadline)
            }
            .padding(.top)
            HStack {
                HStack {
                    Image(systemName: "calendar")
                    Text(projectEntity.dueDate?.formatted(.dateTime.day().month().year()) ?? "")
                        .font(.subheadline)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.top)

        }
        .padding(20)

        .foregroundColor(Color.white)
        .background(Color.accentColor)
        .cornerRadius(15)
        .shadow(color: Color.gray.opacity(0.6), radius: 6, x: 0, y: 2)

   }
    
}

struct TaskListRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        }
        .previewLayout(.sizeThatFits)
    }
}
