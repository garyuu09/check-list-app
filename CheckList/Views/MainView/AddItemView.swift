//
//  AddItemView.swift
//  CheckList
//
//  Created by Ryuga on 2024/07/01.
//

import SwiftUI
import SwiftData

struct AddItemView: View {
    var context: ModelContext
    var items: [ChecklistItem]
    @Binding var textFieldInput: String
    @Binding var isShowAddItemSheet: Bool

    var body: some View {
        VStack(spacing: 10) {
            TextField("Enter your title here", text: $textFieldInput)
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 8.0, height: 8.0))
                        .stroke(.gray, lineWidth: 2.0)
                        .padding(-8.0)
                )
                .padding(16.0)
            Button("Add") {
                add(item: ChecklistItem(title: textFieldInput, isChecked: false, orderIndex: items.count ))
                textFieldInput = ""
                isShowAddItemSheet = false
            }
            .buttonStyle(RoundedButtonStyle())
        }
    }

    // データの追加
    func add(item: ChecklistItem) {
        context.insert(item)
    }
}
