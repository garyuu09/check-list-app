//
//  UncheckedListView.swift
//  CheckList
//
//  Created by Ryuga on 2025/11/22.
//

import SwiftUI
import SwiftData

struct UncheckedListView: View {
    var context: ModelContext
    var items: [ChecklistItem]
    @Binding var itemEdit: ChecklistItem?
    
    var uncheckedItems: [ChecklistItem] {
        items.filter { !$0.isChecked }
    }

    var body: some View {
        List {
            ChecklistSectionView(
                title: "Unchecked",
                items: uncheckedItems,
                onToggle: toggleChecked,
                onEdit: { itemEdit = $0 },
                onDelete: { indexSet in
                    deleteItems(items: uncheckedItems, at: indexSet)
                },
                onMove: { source, destination in
                    var updatedItems = uncheckedItems
                    updatedItems.move(fromOffsets: source, toOffset: destination)
                    for (index, item) in updatedItems.enumerated() {
                        item.orderIndex = index
                    }
                }
            )
        }
    }

    func deleteItems(items: [ChecklistItem], at offsets: IndexSet) {
        for index in offsets {
            context.delete(items[index])
        }
    }

    func toggleChecked(for item: ChecklistItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isChecked.toggle()
        }
    }
}
