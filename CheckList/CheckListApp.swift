//
//  CheckListApp.swift
//  CheckList
//
//  Created by Ryuga on 2024/04/12.
//

import SwiftUI
import SwiftData

@main
struct CheckListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [ChecklistItem.self])
    }
}
