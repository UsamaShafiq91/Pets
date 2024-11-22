//
//  ContentView.swift
//  Pets
//
//  Created by UsamaShafiq on 20/11/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = PetListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.components, id: \.id) { component in
                    component.render()
                }
            }
            .navigationTitle("Pets")
            .task {
                vm.load()
            }
        }
    }
}

#Preview {
    ContentView()
}
