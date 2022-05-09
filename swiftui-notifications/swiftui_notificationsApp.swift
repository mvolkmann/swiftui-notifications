import SwiftUI

@main
struct swiftui_notificationsApp: App {
    @StateObject private var model = Model()
        
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(model)
        }
    }
}
