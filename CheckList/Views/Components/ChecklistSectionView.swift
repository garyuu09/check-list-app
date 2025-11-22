//
//  ChecklistSectionView.swift
//  CheckList
//
//  Created by Ryuga on 2025/11/22.
//

import SwiftUI

struct ChecklistSectionView: View {
    let title: LocalizedStringKey
    let items: [ChecklistItem]
    let onToggle: (ChecklistItem) -> Void
    let onEdit: (ChecklistItem) -> Void
    var onDelete: ((IndexSet) -> Void)? = nil
    var onMove: ((IndexSet, Int) -> Void)? = nil

    var body: some View {
        Section(title) {
            ForEach(items) { item in
                ChecklistRowView(
                    item: item,
                    onToggle: { onToggle(item) },
                    onEdit: { onEdit(item) }
                )
            }
            .onDelete { indexSet in
                onDelete?(indexSet)
            }
            .onMove { source, destination in
                onMove?(source, destination)
            }
        }
    }
}
