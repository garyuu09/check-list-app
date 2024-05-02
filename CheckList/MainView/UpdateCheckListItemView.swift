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
        VStack(spacing: 10) {
            TextField("Enter your title here", text: $textFieldInput)
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 8.0, height: 8.0))
                        .stroke(.gray, lineWidth: 2.0)
                        .padding(-8.0)
                )
                .padding(16.0)
            Button("Update") {
                dismiss()
                item.title = textFieldInput
            }
            .buttonStyle(RoundedButtonStyle())
        }
        .onAppear {
            textFieldInput = item.title
        }
    }
}

