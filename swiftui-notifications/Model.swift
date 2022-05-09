import SwiftUI

class Model: ObservableObject {
    @Published var count = 0
    static let notificationName = Notification.Name("panel")
    
    init() {
        Task(priority: .background) {
            await self.listenToNotifications()
        }
    }
    
    func listenToNotifications() async {
        let center = NotificationCenter.default
        // Listen for notifications with this "name".
        let name = Model.notificationName
        for await notification in center.notifications(named: name) {
            print("name = \(notification.name)")
            // If there is userInfo in the notification ...
            if let userInfo = notification.userInfo {
                // If the userInfo contains a "message" key ...
                if let message = userInfo["message"] as? String {
                    print("message = \(message)")
                }
            }
            
            // Update state in main thread.
            await MainActor.run { count += 1 }
        }
    }
}
