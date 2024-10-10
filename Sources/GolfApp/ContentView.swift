import SwiftUI

public struct ContentView: View {
    @AppStorage("tab") var tab = Tab.courses
    @AppStorage("name") var name = "Skipper"
    @State var appearance = ""
    @State var isBeating = false

    public init() {
    }

    public var body: some View {
        TabView(selection: $tab) {
            
            if #available(iOS 17.0, *) {
                CoursesMapView(viewModel: CoursesMapViewModel())
                    .tabItem { Label("Find Courses", systemImage: "mappin.and.ellipse") }
                    .tag(Tab.courses)
            }
            
            NavigationStack {
                GamesView()
                    .background(Color.white)
            }
            .padding(.bottom, 1)
            .tabItem {
                Label("Game Tracker", systemImage: "table")
            }
            .tag(Tab.games)

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
            .padding(.bottom, 1)
            .tabItem {
                Label("Profile", systemImage: "person")
            }
            .tag(Tab.profile)
        }
        .preferredColorScheme(appearance == "dark" ? .dark : appearance == "light" ? .light : nil)
    }
}

enum Tab : String, Hashable {
    case courses, games, profile
}
