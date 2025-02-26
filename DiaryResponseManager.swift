//
//  DiaryResponseManager.swift
//  DiaryPal
//
//  Created by Priyanka on 08/02/25.
//

import Foundation

//below are structs to parse the responses from the Open AI API
struct OpenAIResponse: Codable {
    let choices: [Choice] //array of choice objects
}

struct Choice: Codable {
    let message: Message //message contains the response from the API
}

struct Message: Codable { //actual message of API
    let content: String
}

class DiaryResponseManager {
    private let apiKey = ""//enter the private API key
    private let endpoint = "https://api.openai.com/v1/chat/completions" //does this work even?
    
    func getResponse(prompt: String, completion: @escaping (String?) -> Void) {
        
        guard let url = URL(string: endpoint) else {
            completion(nil)
            return
        }
/*
        let requestBody: [String: Any] = [ //dictionary
            "model": "gpt-3.5-turbo", // using gpt-4 model
            "messages": [["role": "user", "content": prompt]],
            "max_tokens": 100
        ]
        */
        
        let requestBody: [String: Any] = [
            "model": "gpt-4o-mini",  //switching to a smaller model
            "messages": [["role": "user", "content": prompt]],
            "max_tokens": 100
        ]
        
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: requestBody) else {
            completion(nil)
            return
        }//converting dictionary into json

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                //print("No data recieved")-> looks like it has been recieved
                completion(nil)
                return
            }
            if let responseString = String(data: data, encoding: .utf8){
                print("Raw response data: \(responseString)")
            }

            if let decodedResponse = try? JSONDecoder().decode(OpenAIResponse.self, from: data) {
                completion(decodedResponse.choices.first?.message.content)
            }
            else{
                print("Failed to decode response")
                completion(nil)
            }
        }
        task.resume()
    }
}
