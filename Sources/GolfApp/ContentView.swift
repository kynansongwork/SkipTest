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
                List {
                    ForEach(1..<1_000) { i in
                        NavigationLink("Item \(i)", value: i)
                    }
                }
                .navigationTitle("Game Tracker")
                .navigationDestination(for: Int.self) { i in
                    Text("Item \(i)")
                        .font(.title)
                        .navigationTitle("Screen \(i)")
                }
            }
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
