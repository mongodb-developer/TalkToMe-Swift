import SwiftUI
import RealmSwift

struct LoginView: View {
    @State var error: Error?
    @State var isLoggingIn = false
    var app: RealmSwift.App

    var body: some View {
        VStack {
            if isLoggingIn {
                ProgressView()
            }
            if let error = error {
                Text("Error: \(error.localizedDescription)")
            }
            Button("Log in anonymously") {
                isLoggingIn = true
                app.login(credentials: .anonymous) { result in
                    isLoggingIn = false
                    if case let .failure(error) = result {
                        print("Failed to log in: \(error.localizedDescription)")
                        self.error = error
                        return
                    }
                    print("Logged in")
                }
            }.disabled(isLoggingIn)
        }
    }
}
