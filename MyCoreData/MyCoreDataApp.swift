//
//  MyCoreDataApp.swift
//  MyCoreData
//
//  Created by Ravi Ranjan on 28/04/22.
//

import SwiftUI

@main
struct MyCoreDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDataManager: CoreDataManager())
        }
    }
}
