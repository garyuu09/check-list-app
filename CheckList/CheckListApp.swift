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
    @AppStorage("displayMode") var displayMode: DisplayMode = .system

    var body: some Scene {
        WindowGroup {
            LaunchScreen()
                .preferredColorScheme(displayMode == .system ? nil : (displayMode == .dark ? .dark : .light))
        }
        .modelContainer(for: [ChecklistItem.self])
    }
}
