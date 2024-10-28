import SwiftUI

@main
struct CoordinatorPatternApp: App {
    var body: some Scene {
        WindowGroup {
            CustomNavigationView(appRouter: .init())
        }
    }
}
