//
//  DateManager.swift
//  DiaryPal
//
//  Created by Priyanka on 08/02/25.
//

import Foundation //need this for networking

class DateManager: ObservableObject {
    @Published var currentDateAndTime: String = "9 Feb 2025"//placeholder for demo, buggy
    
    init() { //initialising the func
        fetchDateAndTime()
    }
    
    func fetchDateAndTime() {
        let urlString = "https://worldtimeapi.org/api/timezone/Etc/UTC"
        guard let url = URL(string: urlString)
                    
        else{ //if url is invalid.
            return
        }
        //starting request to fetch data.
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data { //checks if its not nil/empty
                if let decodedResponse = try? JSONDecoder().decode(TimeResponse.self, from: data) {
                    DispatchQueue.main.async { //making sure that the UI update reflect on the main
                        let fullDateAndTime = decodedResponse.datetime //assigning date and time
                        let dateFormatter = ISO8601DateFormatter() //creates an object of iso86...formatter
                        if let date = dateFormatter.date(from: fullDateAndTime) { //converts full date and time to an object
                            let displayFormatter = DateFormatter()//this converts date object to a string
                            displayFormatter.dateFormat = "d MMM yyyy"
                            self.currentDateAndTime = displayFormatter.string(from: date)
                        }
                    }
                }
            }
        }.resume()
    }
}

struct TimeResponse: Codable { //codable: encoded and decoded from JSON
    let datetime: String
}

