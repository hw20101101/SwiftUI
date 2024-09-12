//
//  ContentView.swift
//  h240910SwiftUIApp
//
//  Created by hwacdx on 2024/9/10.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    //创建了各种活动名称的数组
    var activities = ["Archery", "Baseball", "Basketball", "Bowling", "Boxing", "Cricket", "Curling", "Fencing", "Golf", "Hiking", "Lacrosse", "Rugby", "Squash"]
    
    //选择射箭作为默认值
    @State var selected = "Archery"
    
    var body: some View {
        
        VStack{ // 垂直布局
            
            Text("Why not try...")
                .font(.largeTitle.bold())
            
            VStack{ // 垂直布局
                Circle()
                    .fill(.blue)
                    .padding()
                    .overlay( // SF Symbols
                        Image(systemName:"figure.\(selected.lowercased())") // 小写活动名称
                            .font(.system(size: 100))
                            .foregroundColor(.white)
                    )
                
                Text("\(selected)!")
                    .font(.title)
            }
            
            Button("Try again") {
                //change activity
                selected = activities.randomElement() ?? "Archery"
            }
            .buttonStyle(.borderedProminent)
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
