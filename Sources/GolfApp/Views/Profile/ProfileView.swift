//
//  ProfileView.swift
//  golf-app
//
//  Created by Kynan Song on 09/10/2024.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("name") var name = "Skipper"
    @State var appearance = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                Picker("Appearance", selection: $appearance) {
                    Text("System").tag("")
                    Text("Light").tag("light")
                    Text("Dark").tag("dark")
                }
                HStack {
                    #if SKIP
                    ComposeView { ctx in // Mix in Compose code!
                        androidx.compose.material3.Text("💚", modifier: ctx.modifier)
                    }
                    #else
                    Text(verbatim: "💙")
                    #endif
                    Text("Powered by \(androidSDK != nil ? "Jetpack Compose" : "SwiftUI")")
                }
                .foregroundStyle(.gray)
            }
            .navigationTitle("Profile")
        }
        .preferredColorScheme(appearance == "dark" ? .dark : appearance == "light" ? .light : nil)
    }
}

#Preview {
    ProfileView()
}
