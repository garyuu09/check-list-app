//
//  SettingView.swift
//  CheckList
//
//  Created by Ryuga on 2024/04/13.
//

import SwiftUI

enum DisplayMode: String {
    case light, dark, system
}

struct SettingView: View {
    @AppStorage("displayMode") private var displayMode: DisplayMode = .system

    var body: some View {
        NavigationStack {
            List {
                Section("App Settings") {
                    Picker("Theme Color", selection: $displayMode) {
                        Text("Light").tag(DisplayMode.light)
                        Text("Dark").tag(DisplayMode.dark)
                        Text("System").tag(DisplayMode.system)
                    }
                    .pickerStyle(.automatic)
                    NavigationLink("Language", destination: EmptyView())
                }
                Section("Support") {
                    NavigationLink("Service Notice", destination: EmptyView())
                    NavigationLink("How to Use", destination: EmptyView())
                    NavigationLink("Contact Us", destination: EmptyView())
                }
                Section("About ShoppingList App") {
                    NavigationLink("Terms of Service", destination: EmptyView())
                    NavigationLink("Privacy Policy", destination: EmptyView())
                    NavigationLink("Review App", destination: EmptyView())
                }

                Section {
                    //
                } footer: {
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                        Text("©ShoppingList")
                            .font(.caption)
                        Text("Ver. 1.00")
                            .font(.caption2)
                    })
                    .frame(maxWidth: .infinity)
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SettingView()
}

