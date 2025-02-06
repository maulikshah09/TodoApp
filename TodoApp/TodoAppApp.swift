//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Maulik Shah on 2/6/25.
//

import SwiftUI

@main
struct TodoAppApp: App {
    
    @StateObject var listViewModel : ListViewModel =  ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
                
            }.environmentObject(listViewModel)
        }
    }
}
