import SwiftUI
import RealmSwift

struct TalkEditView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedRealmObject var talk: Talk

    @State var speaker: String = ""
    @State var title: String = ""
    @State var scheduledDate: Date = Date()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Talk")) {
                    TextField("Speaker", text: $speaker)
                    TextField("Title", text: $title)
                }
                Section(header: Text("Planning")) {
                    DatePicker(selection: $scheduledDate, in: Date()..., displayedComponents: .date) {
                        Text("Scheduled Date")
                    }
                }
            }
            .navigationTitle("Proposal")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        if let thawed = talk.thaw(), let realm = thawed.realm {
                            do {
                                try realm.write {
                                    thawed.title = title
                                    thawed.speaker = speaker
                                    thawed.scheduledDate = scheduledDate
                                    thawed.ownerId = realm.syncSession?.parentUser()?.id ?? ""
                                }
                            } catch {
                                print("Failed to update talk: \(error)")
                            }
                        }
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Save")
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        if let thawed = talk.thaw(), let realm = thawed.realm {
                            do {
                                try realm.write {
                                    realm.delete(thawed)
                                }
                            } catch {
                                print("Failed to update talk: \(error)")
                            }
                        }
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
            }
        }
    }
}
