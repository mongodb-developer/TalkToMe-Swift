//
//  Talk.swift
//  TalkToMe
//
//  Created by Jorge Ortiz Fuentes on 12/5/23.
//  Copyright © 2023 MongoDB. All rights reserved.
//

import Foundation
import RealmSwift

class Talk: Object, ObjectKeyIdentifiable {
    // swiftlint:disable:next identifier_name
    @Persisted (primaryKey: true) var _id: ObjectId
    @Persisted var title: String
    @Persisted var speaker: String
    @Persisted private var proposedDate: Date = Date()
    @Persisted var scheduledDate: Date?

    convenience init(title: String, speaker: String) {
        self.init()
        self.title = title
        self.speaker = speaker
    }
}
