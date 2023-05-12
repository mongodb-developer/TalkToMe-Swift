//
//  ContentView.swift
//  TalkToMe
//
//  Created by Jorge Ortiz Fuentes on 9/5/23.
//

import SwiftUI
import RealmSwift

struct TalksListView: View {
    @ObservedResults(Talk.self) var talks
    @State private var counter = 1

    var body: some View {
        List {
            ForEach(talks) { talk in
                TalksListItem(title: talk.title, speaker: talk.speaker)
            }.onDelete(perform: $talks.remove)
        }
        .navigationTitle("Talks")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    $talks.append(Talk(title: "Talk \(counter)", speaker: "Speaker \(counter)"))
                    counter += 1
                } label: {
                    Label("Add", systemImage: "plus")
                }
            }
        }
    }
}

struct TalksListItem: View {
    var title: String
    var speaker: String

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title).font(.headline)
            Text(speaker).font(.subheadline)
        }
    }
}
