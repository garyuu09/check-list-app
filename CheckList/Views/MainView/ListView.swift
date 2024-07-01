//
//  ListView.swift
//  CheckList
//
//  Created by Ryuga on 2024/06/30.
//

import SwiftUI
import SwiftData

struct ListView: View {
    var context: ModelContext
    var items: [ChecklistItem]
    @Binding var itemEdit: ChecklistItem?
    /// チェックされていない項目
    var uncheckedItems: [ChecklistItem] {
        items.filter { !$0.isChecked }
    }

    /// チェックされた項目
    var checkedItems: [ChecklistItem] {
        items.filter { $0.isChecked }
    }

    var body: some View {
        List {
            Section("Unchecked") {
                ForEach(uncheckedItems) { item in
                    checklistRow(for: item)
                }
                .onMove { source, destination in
                    var updatedItems = uncheckedItems
                    updatedItems.move(fromOffsets: source, toOffset: destination)
                    for (index, item) in updatedItems.enumerated() {
                        item.orderIndex = index
                    }
                }
            }
            Section("Checked") {
                ForEach(checkedItems) { item in
                    checklistRow(for: item)
                }
                .onMove { source, destination in
                    var updatedItems = checkedItems
                    updatedItems.move(fromOffsets: source, toOffset: destination)
                    for (index, item) in updatedItems.enumerated() {
                        item.orderIndex = index
                    }
                }
            }
        }
    }
    /// チェックリストの各行を表示するビュー
    func checklistRow(for item: ChecklistItem) -> some View {
        HStack {
            Image(systemName: item.isChecked ? "checkmark.square" : "square")
                .onTapGesture {
                    toggleChecked(for: item)
                }
            HStack {
                Text(item.title)
                    .strikethrough(item.isChecked, color: .primary)
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                itemEdit = item
            }
            Image(systemName: "xmark")
                .onTapGesture {
                    withAnimation {
                        delete(item: item)
                    }
                }
        }
    }
    // データの削除
    func delete(item: ChecklistItem) {
        context.delete(item)
    }
    // 項目のチェック状態をトグルする
    func toggleChecked(for item: ChecklistItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isChecked.toggle()
        }
    }
    func moveItems(_ items: inout [ChecklistItem], from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
        for (index, item) in items.enumerated() {
            item.orderIndex = index
        }
    }
}
