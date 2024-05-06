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
    @EnvironmentObject var networkState: MonitoringNetworkState
    @AppStorage("displayMode") private var displayMode: DisplayMode = .system
    let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "Unknown"
    // TODO: debug時のみ、build番号を表示するようにする。
    let build = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "Unknown"
    let privacyPolicyURL = URL(string: "https://garyuu09.github.io/shopping-check-list-privacy-policy/")
    let appStoreURL = URL(string: "itms-apps://apps.apple.com/en/app/simple-shopping-checklist/id6499101372")

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
                Section("About Shopping CheckList App") {
                    // TODO: Ver.2.00で対応する。
                    // NavigationLink("Terms of Service", destination: TermsOfServiceView())
                    NavigationLink {
                        //ここに遷移させたいViewのインスタンスを渡す
                        if networkState.isConnected {
                            WebView(url: privacyPolicyURL!)
                        } else {
                            ContentUnavailableView(
                                "No Internet",
                                systemImage: "wifi.exclamationmark",
                                description: Text("Try checking the network cables, modem, and router or reconnecting to Wi-Fi.")
                            )
                        }
                    } label: {
                        Text("Privacy Policy")
                    }
                    Button("Review App") {
                        // URL が有効かどうかチェックしてから開く
                        if let url = appStoreURL, UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url)
                        }
                    }
                }

                Section {
                    //
                } footer: {
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                        Text("©Simple Shopping CheckList")
                            .font(.caption)
                        Text("Ver. \(version)")
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

