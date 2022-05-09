import SwiftUI

struct PanelA: View {
    var body: some View {
        VStack {
            Text("Panel A")
            Button("Send") {
                let center = NotificationCenter.default
                // Send a good notification.
                center.post(
                    name: Model.notificationName,
                    object: self,
                    userInfo: ["message": "from panel A"]
                )
                // Send a notification that doesn't have
                // a "message" key in its userInfo.
                center.post(
                    name: Model.notificationName,
                    object: self,
                    userInfo: ["badKey": "bad data"]
                )
                // Send a notification with a name
                // that Model isn't listening for.
                center.post(
                    name: Notification.Name("other"),
                    object: self,
                    userInfo: ["message": "from panel A"]
                )
            }
        }
    }
}
