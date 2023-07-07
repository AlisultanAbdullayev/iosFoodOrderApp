//
//  TestFoodOrderApp.swift
//  TestFoodOrder
//
//  Created by Alisultan Abdullah on 4.07.2023.
//

import SwiftUI

@main
struct TestFoodOrderApp: App {
    
    @StateObject private var bucketVM = BucketViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(bucketVM)
        }
    }
}
