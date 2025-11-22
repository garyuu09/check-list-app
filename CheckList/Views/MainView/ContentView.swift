//
//  ContentView.swift
//  CheckList
//
//  Created by Ryuga on 2024/04/12.
//

import SwiftUI
import SwiftData

/// スプラッシュ画面表示あとに表示されるメインの画面
struct ContentView: View {
    @State private var textFieldInput = ""
    @State private var isShowAddItemSheet = false
    @State private var itemEdit: ChecklistItem?
    @State private var isShowSettingView = false
    
    @Environment(\.modelContext) private var context
    // チェックリストの項目
    @Query(sort: \ChecklistItem.orderIndex) private var items: [ChecklistItem]
    
    @State var selection = 0
    
    var isAddButtonVisible: Bool {
        return !isShowSettingView
    }

    var navigationTitle: String {
        switch selection {
        case 0: return "Home"
        case 1: return "Unchecked"
        case 2: return "Checked"
        default: return ""
        }
    }

    var body: some View {
        ZStack(alignment: .bottom) {
        NavigationStack {
            TabView(selection: $selection) {
                // Home Tab
                ListView(context: context, items: items, itemEdit: $itemEdit)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(0)

                // Unchecked Tab
                UncheckedListView(context: context, items: items, itemEdit: $itemEdit)
                    .tabItem {
                        Label("Unchecked", systemImage: "square")
                    }
                    .tag(1)

                // Checked Tab
                CheckedListView(context: context, items: items, itemEdit: $itemEdit)
                    .tabItem {
                        Label("Checked", systemImage: "checkmark.square")
                    }
                    .tag(2)
            }
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingView(), isActive: $isShowSettingView) {
                        Image(systemName: "gearshape")
                    }
                }
            }
        }
            
            // 丸い追加ボタン
            if isAddButtonVisible {
                if #available(iOS 26.0, *) {
                    Button {
                        isShowAddItemSheet = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.blue)
                    }
                    .glassEffect()
                    .padding(.bottom, 60) // Adjust this value to position above TabBar
                    .zIndex(1) // ボタンを最前面に表示
                } else {
                    // Fallback on earlier versions
                    Button {
                        isShowAddItemSheet = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.blue)
                            .background(Color.white) // Ensure background is opaque
                    }
                    .padding(.bottom, 60) // Adjust this value to position above TabBar
                    .zIndex(1) // ボタンを最前面に表示
                }
            }
        }
        .sheet(isPresented: $isShowAddItemSheet) {
            AddItemView(context: context, items: items, textFieldInput: $textFieldInput, isShowAddItemSheet: $isShowAddItemSheet)
                .padding()
                .presentationDetents([.fraction(0.2)])
        }
        .sheet(item: $itemEdit) { item in
            UpdateCheckListItemView(item: item)
                .padding()
                .presentationDetents([.fraction(0.2)])
        }
    }
}


#Preview {
    ContentView()
}
