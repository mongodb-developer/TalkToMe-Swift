//
//  Talk.swift
//  TalkToMe
//
//  Created by Jorge Ortiz Fuentes on 9/3/22.
//  Copyright © 2022 MongoDB. All rights reserved.
//

import Foundation
import RealmSwift

class Talk: Object, ObjectKeyIdentifiable {
    // swiftlint:disable:next identifier_name
    @Persisted (primaryKey: true) var _id: ObjectId
    @Persisted var title: String = ""
    @Persisted var speaker: String = ""
    @Persisted var proposedDate: Date = Date()
    @Persisted var scheduledDate: Date?

    convenience init(title: String, speaker: String) {
        self.init()
        self.title = title
        self.speaker = speaker
    }
}
