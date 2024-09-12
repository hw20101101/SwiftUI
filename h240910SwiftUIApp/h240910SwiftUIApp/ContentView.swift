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
    
    //创建颜色数组
    var colors: [Color] = [.blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .red]
    
    //选择射箭作为默认值
    @State private var selected = "Archery"
    
    @State private var id = 1
    
    var body: some View {
        
        VStack{ // 垂直布局
 
            Text("Why not try...")
                .font(.largeTitle.bold())
                        
            Spacer() //自动扩展的灵活空间
            
            VStack{ // 垂直布局
                Circle()
                    .fill(colors.randomElement() ?? .blue) //默认值为蓝色
                    .padding()
                    .overlay( // SF Symbols
                        Image(systemName:"figure.\(selected.lowercased())") // 小写活动名称
                            .font(.system(size: 100))
                            .foregroundColor(.white)
                    )
                
                Text("\(selected)!")
                    .font(.title)
            }
            .transition(.slide) // 控制添加和删除过渡的发生方式
            .id(id) // 将该标识符附加到整个 VStack
            
            Spacer() //自动扩展的灵活空间
            
            Button("Try again") {
                withAnimation(.easeInOut(duration: 1)) { //使用淡出动画
                    selected = activities.randomElement() ?? "Archery"
                    id += 1
                }
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
