import SwiftUI
import RealmSwift

struct OpenSyncedRealmView: View {
    @AsyncOpen(appId: nil, timeout: 4000) var asyncOpen
    var body: some View {
        switch asyncOpen {
        case .connecting:
                    ProgressView()
        case .waitingForUser:
                    ProgressView("Waiting for user to log in...")
        case .progress(let progress):
                    ProgressView(progress)
        case .open(let realm):
            NavigationView {
                TalksListView().environment(\.realm, realm)
            }
        case .error(let error):
                    Text(error.localizedDescription)
                        .font(.callout)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 40).padding()
        }
    }
}
