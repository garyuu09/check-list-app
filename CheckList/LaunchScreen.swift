//
//  LaunchScreen.swift
//  CheckList
//
//  Created by Ryuga on 2024/04/13.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var isLoading = true

    var body: some View {
        if isLoading {
            ZStack {
                VStack(spacing: 0) {
                    Image("icon_40x40")
                        .padding()
                    Text("Shopping List")
                        .font(.headline)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation {
                        isLoading = false
                    }
                }
            }
        } else {
            ContentView()
        }
    }
}

#Preview {
    LaunchScreen()
}
