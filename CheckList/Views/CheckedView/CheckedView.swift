//
//  CheckedView.swift
//  CheckList
//
//  Created by Ryuga on 2025/11/09.
//

import SwiftUI

struct CheckedView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        TabView {
            Tab("All", systemImage: "checklist") {
                ContentView()
                    .searchable(text: $searchText)
            }


            Tab("Unchecked", systemImage: "checklist.unchecked") {
                EmptyView()
            }


            TabSection("Messages") {
                Tab("Checked", systemImage: "checklist.checked") {
                    EmptyView()
                }


            }
            Tab(role: .search) {
                NavigationStack {
                    Color.red
//                        .searchable(text: $searchText)
                }
            }
        }
        .searchable(text: .constant(""))
//        .tabViewStyle(.sidebarAdaptable)
    }
}

#Preview {
    CheckedView()
}
