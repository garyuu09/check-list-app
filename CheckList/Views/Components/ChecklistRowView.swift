//
//  ChecklistRowView.swift
//  CheckList
//
//  Created by Ryuga on 2025/11/22.
//

import SwiftUI

struct ChecklistRowView: View {
    let item: ChecklistItem
    let onToggle: () -> Void
    let onEdit: () -> Void

    var body: some View {
        HStack {
            Image(systemName: item.isChecked ? "checkmark.square" : "square")
                .onTapGesture {
                    onToggle()
                }
            HStack {
                Text(item.title)
                    .strikethrough(item.isChecked, color: .primary)
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture(count: 2) {
                onEdit()
            }
        }
    }
}
