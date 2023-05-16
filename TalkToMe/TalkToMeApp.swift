//
//  TalkToMeApp.swift
//  TalkToMe
//
//  Created by Jorge Ortiz Fuentes on 9/5/23.
//

import SwiftUI
import RealmSwift

let app = RealmSwift.App(id: "<app-id>")

@main
struct TalkToMeApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            MainView(app: app)
        }
    }
}
