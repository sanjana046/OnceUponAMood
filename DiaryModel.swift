//
//  DiaryModel.swift
//  DiaryPal
//
//  Created by Priyanka on 08/02/25.
//

import Foundation

class DiaryModel: ObservableObject {
    private let openAIService = DiaryResponseManager()
    
    @Published var diaryEntry = ""
    @Published var advice = ""
    @Published var movieRecommendations = [String]()
    @Published var songRecommendations = [String]()
    
    func getAdvice() {
        openAIService.getResponse(prompt: "Give advice based on this diary entry. Make your tone gentle and comforting, you are talking a young adult or young person of their generation. Use pop-culture references if possible. For example, if they mention choosing between basketball and music theatre, mention high school musical. If they are searching for who they are and struggle with feeling lost, mention Encanto. Keep it just around 3-4 lines. Also, remove the * and ** formatting that you have in each title: \(diaryEntry)") { response in
            DispatchQueue.main.async {
                self.advice = response ?? "No advice available."
            }
        }
    }
    
    func getMovieRecommendations() {
        openAIService.getResponse(prompt: "Suggest 5 movies for someone feeling like this. Stick to only the number and list the movies with the genre. Lean towards Gen-Z or millenial. Look at what they struggle with, and see if any movie has a similar plot and can help them get through it.  Also, remove the * or ** formatting that you have in each title. : \(diaryEntry)") { response in
            DispatchQueue.main.async {
                self.movieRecommendations = response?.components(separatedBy: "\n") ?? []
            }
        }
    }

    func getSongRecommendations() {
        openAIService.getResponse(prompt: "Suggest 5 songs based on this diary entry. Stick to just the list of the songs. Lean towards Gen-Z or millenial songs. Also, remove the * or ** formatting that you have for formating. : \(diaryEntry)") { response in
            DispatchQueue.main.async {
                self.songRecommendations = response?.components(separatedBy: "\n") ?? []
            }
        }
    }
}
