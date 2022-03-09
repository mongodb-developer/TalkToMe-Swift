import SwiftUI
import RealmSwift

struct TalksListView: View {
    @ObservedResults(Talk.self) var talks
    @State var modalPresented = false
    @State var talk: Talk?

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
                    talk = Talk()
                    $talks.append(talk!)
                    modalPresented = true
                } label: {
                    Label("Add", systemImage: "plus")
                }
            }
        }
        .sheet(isPresented: $modalPresented) {
                talk = nil
        } content: {
                navigateToTalkEdit()
        }
    }

    func navigateToTalkEdit() -> some View {
        if let talk = talk {
            return AnyView(TalkEditView(talk: talk))
        } else {
            return AnyView(EmptyView())
        }
    }
}
