//
//  ListViewModel.swift
//  TodoApp
//
//  Created by Maulik Shah on 2/6/25.
//

import Foundation

/* CRUD
   
 CRETE
 READ
 UPDATE
 DELETE
 
 */



class ListViewModel: ObservableObject {
  
    @Published var todoItems: [ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    
    let itemsKey: String = "item_list"
    
    init(){
        getItems()
    }
    
    func getItems() {
//        let newItems =  [
//            ItemModel(title: "This is the first title!", isCompleted: false),
//            ItemModel(title: "This is the second", isCompleted: true),
//            ItemModel(title: "Third", isCompleted: false)]
//        
//        todoItems.append(contentsOf: newItems)
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else{ return }
        
        todoItems = savedItems
    }
    
    func deleteItem(indexSet : IndexSet) {
        todoItems.remove(atOffsets: indexSet)
        saveItems()
    }
    
    func moveItems(indices : IndexSet,newOffset : Int) {
        todoItems.move(fromOffsets: indices , toOffset: newOffset)
    }
    
    func addItem(title : String){
        let newItem = ItemModel(title: title, isCompleted: false)
        todoItems.append(newItem)
    }
    
    func updateItem(item : ItemModel){
        if let index = todoItems.firstIndex(where: {$0.id == item.id}){
            todoItems[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        // convert json data
        if let encodeData  = try? JSONEncoder().encode(todoItems){
            UserDefaults.standard.set(encodeData, forKey: itemsKey)
        }
    }
    
    
}
