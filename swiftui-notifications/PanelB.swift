import SwiftUI

struct PanelB: View {
    var body: some View {
        VStack {
            Text("Panel B")
            Button("Send") {
                let center = NotificationCenter.default
                center.post(
                    name: Model.notificationName,
                    object: self,
                    userInfo: ["message": "from panel B"]
                )
            }
        }
    }
}
