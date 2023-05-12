//
//  ContentView.swift
//  TalkToMe
//
//  Created by Jorge Ortiz Fuentes on 9/5/23.
//

import SwiftUI

struct TalksListView: View {
    var body: some View {
        List {
            TalksListItem(title: "Growing Hyperpotatoes", speaker: "Captn. Hype")
            TalksListItem(title: "The wild mushrooms rebellion", speaker: "Toad")
        }
        .navigationTitle("Talks")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    // Action not defined yet
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

struct TalksListViewPreviews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TalksListView()
        }
    }
}
