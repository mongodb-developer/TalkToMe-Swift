//
//  TalkToMeApp.swift
//  TalkToMe
//
//  Created by Jorge Ortiz Fuentes on 8/3/22.
//

import SwiftUI

@main
struct TalkToMeApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TalksListView()
            }
        }
    }
}
