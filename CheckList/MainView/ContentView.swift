//
//  ContentView.swift
//  CheckList
//
//  Created by Ryuga on 2024/04/12.
//

import SwiftUI
import SwiftData

// チェックリストのビュー
struct ContentView: View {
    @State private var textFieldInput = ""
    @State private var isShowAddItemSheet = false
    @State private var itemEdit: ChecklistItem?
    @State private var isShowSettingView = false
    @State private var isShowAddButton = true

    @Environment(\.modelContext) private var context
    // チェックリストの項目
    @Query private var items: [ChecklistItem]

    // チェックされていない項目
    var uncheckedItems: [ChecklistItem] {
        items.filter { !$0.isChecked }
    }

    // チェックされた項目
    var checkedItems: [ChecklistItem] {
        items.filter { $0.isChecked }
    }

    var body: some View {
        ZStack {
            NavigationStack {
                List {
                    Section("Unchecked") {
                        ForEach(uncheckedItems) { item in
                            checklistRow(for: item)
                        }
                    }
                    Section("Checked") {
                        ForEach(checkedItems) { item in
                            checklistRow(for: item)
                        }
                    }
                }
                .navigationTitle("Check List")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            SettingView()
                                .onAppear {
                                    isShowAddButton = false  // 遷移時にボタンを非表示にする
                                }
                                .onDisappear {
                                    isShowAddButton = true   // 戻る時にボタンを表示する
                                }
                        } label: {
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
            VStack(spacing: 10) {
                TextField("Enter your title here", text: $textFieldInput)
                    .overlay(
                        RoundedRectangle(cornerSize: CGSize(width: 8.0, height: 8.0))
                        .stroke(.gray, lineWidth: 2.0)
                        .padding(-8.0)
                )
                .padding(16.0)
                Button("Add") {
                    add(item: ChecklistItem(title: textFieldInput, isChecked: false))
                    textFieldInput = ""
                    isShowAddItemSheet = false
                }
                .buttonStyle(RoundedButtonStyle())
            }
            .padding()
            .presentationDetents([.fraction(0.2)])
        }
        .sheet(item: $itemEdit) {
            itemEdit = nil
        } content: { item in
            UpdateCheckListItemView(item: item)
                .padding()
                .presentationDetents([.fraction(0.2)])
        }
    }
    // 項目のチェック状態をトグルする
    func toggleChecked(for item: ChecklistItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isChecked.toggle()
        }
    }
    // データの追加
    func add(item: ChecklistItem) {
        context.insert(item)
    }

    // データの削除
    func delete(item: ChecklistItem) {
        context.delete(item)
    }

    // チェックリストの各行を表示するビュー
    func checklistRow(for item: ChecklistItem) -> some View {
        HStack {
            Image(systemName: item.isChecked ? "checkmark.square" : "square")
                .onTapGesture {
                    toggleChecked(for: item)
                }
            Text(item.title)
                .strikethrough(item.isChecked, color: .primary)
        }
        .swipeActions {
            Button(role: .destructive) {

                withAnimation {
                    context.delete(item)
                }

            } label: {
                Label("Delete", systemImage: "trash")
                    .symbolVariant(.fill)
            }

            Button {
                itemEdit = item
            } label: {
                Label("Edit", systemImage: "pencil")
            }
            .tint(.orange)
        }
    }
}


#Preview {
    ContentView()
}
