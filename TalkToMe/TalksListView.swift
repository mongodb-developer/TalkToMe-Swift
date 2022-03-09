import SwiftUI
import RealmSwift

struct TalksListView: View {
    @ObservedResults(Talk.self) var talks
    @State var counter = 1

    var body: some View {
        List {
            ForEach(talks) { talk in
                Text(talk.title)
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
