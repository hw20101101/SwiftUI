//
//  ContentView.swift
//  h240910SwiftUIApp
//
//  Created by hwacdx on 2024/9/10.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("hello world")
//        }
//        .padding()
        
        VStack{ // 垂直布局
            
            Text("Why not try...")
                .font(.largeTitle.bold())
            
            VStack{ // 垂直布局
                Circle()
                    .fill(.blue)
                    .padding()
                    .overlay(
                        Image(systemName:"figure.archery")
                            .font(.system(size: 100))
                            .foregroundColor(.white)
                    )
                
                Text("Archery !")
                    .font(.title)
            }
        }
    }
    
//    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [Item]
//
//    var body: some View {
//        NavigationSplitView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        //二级界面
//                        Text("二级界面 Item at 22 \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton() //一级界面 - 编辑按钮
//                }
//                ToolbarItem {
//                    Button(action: addItem) { //一级界面 - 添加按钮
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//        } detail: {
//            Text("Select an item")
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
