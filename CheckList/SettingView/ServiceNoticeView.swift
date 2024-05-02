//
//  ServiceNoticeView.swift
//  CheckList
//
//  Created by Ryuga on 2024/04/21.
//

import SwiftUI

struct ServiceNoticeView: View {
    var body: some View {
        NavigationStack {
            List {
                HStack {
                    Text("Shopping Checklist app released🎉")
                    Spacer()
                    Text("2024/05/03")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    ServiceNoticeView()
}
