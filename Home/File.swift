//
//  File.swift
//  LotusHome
//
//  Created by Nadia Iskandar on 4/10/22.
//

import Foundation
import SwiftUI
import Combine

struct Task: Identifiable {
    var id = String()
    var toDoItem = String()
}

class TaskStore: ObservableObject {
    @Published var tasks = [Task]()
}
