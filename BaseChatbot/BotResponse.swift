//
//  BotResponse.swift
//  BaseChatbot
//
//  Created by Atul Parida on 07/05/23.
//

import Foundation

var responseDict: [String: String] = [
    // This is the list of keywords and responses we want our chatbot to respond to
    // When you type something, if the bot finds a keyword from within your message, it'll respond with the first keyword it finds
    // Format: "keyword" : "Response for that keyword", separate pairs with a comma
    "hello": "Hey there, I'm a chatbot! How can I help you today?",
    "how are you": "I'm doing good, what about you?",
    "good": "That's good!",
    "bad": "Uh oh!",
    "bye": "Alright, talk to you later!"
]

func getBotResponse(message: String) -> String {
    let tempMessage = message.lowercased() // converts our message to lowercase so it's easier to search
    var response: String = String() //empty response
    for key in responseDict.keys {
        if tempMessage.contains(key) {
            response = responseDict[key] ?? ""
            //If there's a keyword, we find the first matching response and assign it, else assign nothing
            break // Stops as soon as we find the first matching keyword
        }
    }
    if response != "" {
        return response //return the response if it isn't empty
    }
    else {
        return "I don't understand." //return the default value if it is empty
    }
}
