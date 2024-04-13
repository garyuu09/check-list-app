//
//  UpdateCheckListItemView.swift
//  CheckList
//
//  Created by Ryuga on 2024/04/13.
//

import SwiftUI

struct UpdateCheckListItemView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var item: ChecklistItem
    @State private var textFieldInput = ""

    var body: some View {
        VStack {
            HStack {
                Text("Title")
                    .font(.headline)
                Spacer()
                TextField("", text: $textFieldInput)
                    .border(.primary)
            }
            Button("update") {
                dismiss()
                item.title = textFieldInput
            }
        }
    }
}

