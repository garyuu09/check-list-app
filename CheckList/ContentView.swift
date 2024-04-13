//
//  ContentView.swift
//  CheckList
//
//  Created by Ryuga on 2024/04/12.
//

import SwiftUI

// 項目を表すデータモデル
struct ChecklistItem: Identifiable, Equatable {
    let id = UUID()
    var title: String
    var isChecked: Bool
}

// チェックリストのビューモデル
class ChecklistViewModel: ObservableObject {
    // チェックリストの項目
    @Published var items: [ChecklistItem] = [
        ChecklistItem(title: "レシート", isChecked: false),
        ChecklistItem(title: "エコバッグ", isChecked: true),
        // ...その他の項目
    ]

    // チェックされていない項目
    var uncheckedItems: [ChecklistItem] {
        items.filter { !$0.isChecked }
    }

    // チェックされた項目
    var checkedItems: [ChecklistItem] {
        items.filter { $0.isChecked }
    }

    // 項目のチェック状態をトグルする
    func toggleChecked(for item: ChecklistItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isChecked.toggle()
            // チェック状態が変わったらリストを更新
            let item = items.remove(at: index)
            items.append(item)
        }
    }
}

// チェックリストのビュー
struct ContentView: View {
    @StateObject var viewModel = ChecklistViewModel()

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("未チェック")) {
                    ForEach(viewModel.uncheckedItems) { item in
                        checklistRow(for: item)
                    }
                }

                Section(header: Text("チェック済み")) {
                    ForEach(viewModel.checkedItems) { item in
                        checklistRow(for: item)
                    }
                }
            }
            .navigationTitle("Check List")
            .navigationBarTitleDisplayMode(.inline)
        }

    }

    // チェックリストの各行を表示するビュー
    func checklistRow(for item: ChecklistItem) -> some View {
        HStack {
            Image(systemName: item.isChecked ? "checkmark.square" : "square")
                .onTapGesture {
                    viewModel.toggleChecked(for: item)
                }
            Text(item.title)
                .strikethrough(item.isChecked, color: .primary)
        }
    }
}


#Preview {
    ContentView()
        .navigationBarTitle("チェックリスト", displayMode: .inline)
}
