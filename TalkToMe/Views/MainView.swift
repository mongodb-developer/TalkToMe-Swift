import SwiftUI
import RealmSwift

struct MainView: View {
    @ObservedObject var app: RealmSwift.App

    var body: some View {
        if let user = app.currentUser {
            let config = user.flexibleSyncConfiguration(initialSubscriptions: { subs in
                if subs.first(named: "user_groups") == nil {
                    subs.append(QuerySubscription<Talk>(name: "user_groups", query: {
                        $0.ownerId == user.id
                    }))
                    subs.append(QuerySubscription<Talk>())
                }
            })
            OpenSyncedRealmView()
                .environment(\.realmConfiguration, config)
        } else {
            LoginView(app: app)
        }
    }
}
