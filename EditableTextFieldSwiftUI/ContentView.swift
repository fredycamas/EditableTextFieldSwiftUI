//
//  ContentView.swift
//  EditableTextFieldSwiftUI
//
//  Created by Life on 2/27/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            EditableText(icon: Image(systemName: "pencil.circle"))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct EditableText: View {
    @State private var text: String = ""
    @State private var isEditing: Bool = false
    
    let icon: Image
    
    var body: some View {
        ZStack {
            HStack{
                Text(text)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Button(action: {
                    self.isEditing = true
                }) {
                    icon
                        .foregroundColor(.gray)
                }}
            .padding(.leading, 8)
            
            if isEditing {
                TextField("", text: $text, onEditingChanged: { editing in
                    if !editing {
                        self.isEditing = false
                    }
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(height: 30)
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}

