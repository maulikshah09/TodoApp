//
//  ContentView.swift
//  TodoApp
//
//  Created by Maulik Shah on 2/6/25.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel : ListViewModel
    
    var body: some View {
        
        ZStack{
            if listViewModel.todoItems.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }else{
                List{
                    ForEach(listViewModel.todoItems) { item in
                        ListRowcCell(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform:listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItems)
                 }
                .listStyle(.plain)
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink("Add", value: "Add")
                    }
                }
            }
        }
       
        .navigationTitle("Todo List 📝")
        .navigationDestination(for: String.self) { item  in
            if item == "Add"{
                AddView()
            }
        }
    }
}

#Preview {
    NavigationStack{
        ListView()
    }
  .environmentObject(ListViewModel())
   
}

