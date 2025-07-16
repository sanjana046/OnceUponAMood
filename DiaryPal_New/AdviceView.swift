//
//  AdviceView.swift
//  DiaryPal
//
//  Created by Priyanka on 08/02/25.
//

import SwiftUI

struct AdviceView: View {
    @ObservedObject var viewModel: DiaryModel

    var body: some View {
        
        VStack{
            ScrollView{
                Text(viewModel.advice)
                    .padding()
                
            }
            .padding()
            .background(Color.white)
            .cornerRadius(8)
        Spacer()
        Button("Get Advice") {
                    viewModel.getAdvice()
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
            
        .background(Color(red: 229/255, green: 231/255, blue: 249/255))
        .navigationTitle("Advice")
        
    }
        
}


