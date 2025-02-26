//
//  DiaryView.swift
//  DiaryPal
//
//  Created by Priyanka on 08/02/25.
//

import SwiftUI

struct DiaryView: View {
    @StateObject private var diaryModel = DiaryModel()
    @StateObject private var dateManager = DateManager()
    
    var body: some View {
        NavigationView {
            VStack {
                
                
                Text(dateManager.currentDateAndTime)
                    .font(.subheadline).padding()
                    
                
                TextEditor(text: $diaryModel.diaryEntry)
                    .frame(minHeight: 200) // Ensure it has a decent height
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.horizontal)
                
                Spacer()
                
                HStack {
                    NavigationLink(destination: AdviceView(viewModel: diaryModel)) {
                        Text("Advice").padding()
                            .background(Color(red: 255/255, green: 240/255, blue: 245/255))

                            .foregroundColor(Color.black)  // Text color
                            .cornerRadius(15)  // Rounded corners
                            //.font(.system(size: 26))
                            .font(.subheadline)
                            .font(.system(size: 30))
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1))
                    }
                    
                    NavigationLink(destination: MovieRecsView(viewModel: diaryModel)) {
                        Text("Movies").padding()
                            
                            .background(Color(red: 255/255, green: 240/255, blue: 245/255))

                            .foregroundColor(Color.black)  // Text color
                            .cornerRadius(15)  // Rounded corners
                            .font(.subheadline)
                            .font(.system(size: 30))
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1))
                                           }
                    
                    NavigationLink(destination: SongRecsView(viewModel: diaryModel)) {
                        Text("Playlist").padding()
                        
                        
                            .background(Color(red: 255/255, green: 240/255, blue: 245/255))
                        
                        
                        
                            .foregroundColor(Color.black)  // Text color
                            .cornerRadius(15)  // Rounded corners
                            .font(.subheadline)
                            .font(.system(size: 30))
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1))
                    }
                }
                .padding()
            }
            .background(Color(red: 229/255, green: 231/255, blue: 249/255))



            //.edgesIgnoringSafeArea(.all) //background stretches full screen.
            
            
            .navigationTitle("Today's Diary Entry")
            .navigationBarTitleDisplayMode(.inline)
        }
        
      
    }
}



