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
                    ChecklistRowView(
                        item: item,
                        onToggle: { toggleChecked(for: item) },
                        onEdit: { itemEdit = item }
                    )
                }
                .onDelete { indexSet in
                    deleteItems(items: uncheckedItems, at: indexSet)
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
                    ChecklistRowView(
                        item: item,
                        onToggle: { toggleChecked(for: item) },
                        onEdit: { itemEdit = item }
                    )
                }
                .onDelete { indexSet in
                    deleteItems(items: checkedItems, at: indexSet)
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

    func deleteItems(items: [ChecklistItem], at offsets: IndexSet) {
        for index in offsets {
            context.delete(items[index])
        }
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
