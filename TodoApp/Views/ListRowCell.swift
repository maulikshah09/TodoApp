//
//  ListRowCell.swift
//  TodoApp
//
//  Created by Maulik Shah on 2/6/25.
//

import SwiftUI
 
struct ListRowcCell: View {
    let item : ItemModel
    
    var body: some View {
        HStack{
            if let title = item.title,let isCompleted = item.isCompleted {
                Image(systemName: isCompleted ? "checkmark.circle" : "circle")
                    .foregroundStyle(isCompleted ?  .green: . red)
                Text(title)
                Spacer()
            }
        }
        .font(.title2)
        .padding(.vertical, 8 )
    }
}

#Preview {
    var item1 = ItemModel(title: "First item!", isCompleted: false)
     var item2 = ItemModel(title: "Second item", isCompleted: true)
  
    Group {
        ListRowcCell(item: item1)
        ListRowcCell(item: item2)
    }
    //.previewLayout(.sizeThatFits)
}
