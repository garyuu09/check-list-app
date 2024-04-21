//
//  SettingView.swift
//  CheckList
//
//  Created by Ryuga on 2024/04/13.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

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
                    // TODO: Ver.2.00で言語切り替え機能を対応する。
//                    NavigationLink("Language", destination: EmptyView())
                }
                Section("Support") {
                    NavigationLink("Service Notice", destination: ServiceNoticeView())
                    // TODO: Ver.2.00で使い方に関する画面を対応する。
//                    NavigationLink("How to Use", destination: EmptyView())
                    // TODO: Ver.2.00で問い合わせ機能を対応する。
//                    NavigationLink("Contact Us", destination: EmptyView())
                }
                Section("About ShoppingList App") {
                    // TODO: Ver.2.00で対応する。
//                    NavigationLink("Terms of Service", destination: TermsOfServiceView())
//                    NavigationLink("Privacy Policy", destination: PrivacyPolicyView())
                    NavigationLink("Review App", destination: WebView(url: URL(string: "https://apps.apple.com/us/app/your-app-name/idYOUR_APP_ID")!))
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

