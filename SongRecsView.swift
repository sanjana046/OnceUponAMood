//
//  SongRecsView.swift
//  DiaryPal
//
//  Created by Priyanka on 08/02/25.
//

import SwiftUI
/*
struct SongRecsView: View {
    @ObservedObject var viewModel: DiaryModel

    var body: some View {
        VStack {
            
            List(viewModel.songRecommendations, id: \.self) { song in
                Text(song)
            }
            
            Button("Get Songs") {
                viewModel.getSongRecommendations()
            }
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            
            
        }
        .navigationTitle("Songs")
    }
}
 */
struct SongRecsView: View {
    @ObservedObject var viewModel: DiaryModel

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(viewModel.songRecommendations, id: \.self) { song in
                        Text(song)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
            .frame(maxHeight: .infinity) // Ensure it expands to fit content
            
            Button("Get Songs") {
                viewModel.getSongRecommendations()
            }
            .padding()
            .background(Color(red: 255/255, green: 240/255, blue: 245/255))
        
        
        
            .foregroundColor(Color.black)  // Text color
            .cornerRadius(15)  // Rounded corners
            .font(.subheadline)
            .font(.system(size: 30))
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1))
        }
        .padding()
        
        .background(Color(red: 229/255, green: 231/255, blue: 249/255))
        .navigationTitle("Songs")
        
        }
}

