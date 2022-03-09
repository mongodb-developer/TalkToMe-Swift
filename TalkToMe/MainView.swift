import SwiftUI
import RealmSwift

struct MainView: View {
    @ObservedObject var app: RealmSwift.App

    var body: some View {
        if let user = app.currentUser {
            OpenSyncedRealmView().environment(\.partitionValue, user.id)
        } else {
            LoginView(app: app)
        }
    }
}
