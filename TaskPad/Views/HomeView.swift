//
//  HomeView.swift
//  TaskPad
//
//  Created by Rakshit Patel on 4/21/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            Text("Welcome to TaskPad 📝")
                .font(.title)
                .padding()
                .navigationTitle("My Tasks")
        }
    }
}


#Preview {
    HomeView()
}
