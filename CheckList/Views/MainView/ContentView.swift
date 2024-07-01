//
//  ContentView.swift
//  CheckList
//
//  Created by Ryuga on 2024/04/12.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var textFieldInput = ""
    @State private var isShowAddItemSheet = false
    @State private var itemEdit: ChecklistItem?
    @State private var isShowSettingView = false
    @State private var isShowAddButton = true
    @State private var isNavigatingToSetting = false

    @Environment(\.modelContext) private var context
    // チェックリストの項目
    @Query(sort: \ChecklistItem.orderIndex) private var items: [ChecklistItem]

    var body: some View {
        ZStack {
            NavigationStack {
                ListView(context: context, items: items, itemEdit: $itemEdit)
                    .environment(\.editMode, .constant(.active))
                    .navigationTitle("Shopping CheckList")
                    .navigationBarTitleDisplayMode(.inline)
                    .onChange(of: isNavigatingToSetting) { isActive in
                        if isActive {
                            isShowAddButton = false
                        } else {
                            isShowAddButton = true
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: SettingView(), isActive: $isNavigatingToSetting) {
                                Image(systemName: "gearshape")
                            }
                        }
                    }
            }
            // 丸い追加ボタン
            .safeAreaInset(edge: .bottom,
                           alignment: .trailing) {
                Button {
                    isShowAddItemSheet = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.blue)
                }
                .padding(20)
                .clipShape(Circle())
                .zIndex(1) // ボタンを最前面に表示
                .disabled(!isShowAddButton)
                .opacity(isShowAddButton ? 1 : 0)
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
