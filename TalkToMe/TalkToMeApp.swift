//
//  TalkToMeApp.swift
//  TalkToMe
//
//  Created by Jorge Ortiz Fuentes on 8/3/22.
//

import SwiftUI
import RealmSwift

let app = RealmSwift.App(id: "talktome-oexmd")

@main
struct TalkToMeApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            MainView(app: app)
        }
    }
}
