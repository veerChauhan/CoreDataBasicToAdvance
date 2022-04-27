//
//  ContentView.swift
//  MyCoreData
//
//  Created by Ravi Ranjan on 28/04/22.
//

import SwiftUI

struct ContentView: View {
    let coreDataManager: CoreDataManager
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDataManager: CoreDataManager())
    }
}
