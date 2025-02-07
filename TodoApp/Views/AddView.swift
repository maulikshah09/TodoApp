//
//  AddView.swift
//  TodoApp
//
//  Created by Maulik Shah on 2/6/25.
//

import SwiftUI

struct AddView: View {
 
    @State private var text: String = ""
    @EnvironmentObject var listViewModel : ListViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var isShowAlert = false
    @State var alertTitle: String = ""
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here...",text: $text)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button {
                    saveButtonPress()
                } label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                    
                }
            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖊️")
        .alert(isPresented: $isShowAlert) {
            getAlert()
        }
    }
    
    func saveButtonPress() {
        if textIsAppropriate() {
            listViewModel.addItem(title: text)
            dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool{
        if text.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!!!"
            isShowAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
        //.environmentObject(ListViewModel())
}
