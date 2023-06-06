//
//  BotResponse.swift
//  BaseChatbot
//
//  Created by Atul Parida on 07/05/23.
//

import Foundation

var responseDict2: [String: [String]] = [
    // This is the list of keywords and responses we want our chatbot to respond to
    // When you type something, if the bot finds a keyword from within your message, it'll respond with the first keyword it finds
    // Format: "keyword" : "Response for that keyword", separate pairs with a comma
    "hello": ["Hey there, I'm a chatbot! How can I help you today?", "Hi there!", "What's up?", "How's it going?"],
    "how are you": ["I'm doing good, what about you?", "All good, and you?", "Doing great! How are you doing?"],
    "good": ["That's good!", "Nice!", "That's cool!"],
    "bad": ["Uh oh!", "Oh no!", "Oof...", "Oops!"],
    "bye": ["Alright, talk to you later!", "Okay, see you!", "Bye bye!", "See you later, alligator!"]
    
]

func getBotResponse2(message: String) -> String {
    let tempMessage = message.lowercased() // converts our message to lowercase so it's easier to search
    var response: String = String() // empty response
    for key in responseDict2.keys {
        if tempMessage.contains(key) {
            let randomInt = Int.random(in: 0..<(responseDict2[key]?.count ?? 1))
            response = responseDict2[key]?[randomInt] ?? ""
            // If there's a keyword, we find the array corresponding to the first matching one.
            // If the array within contains more than one element, we choose a random index otherwise we just choose the first thing available
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

/*
 let randomInt = Int.random(in: 0..<(responseDict[key]?.count ?? 1))
 response = responseDict[key]?[randomInt] ?? ""
 // If there's a keyword, we find the array corresponding to the first matching one.
 // If the array within contains more than one element, we choose a random index otherwise we just choose the first thing available
 
 "hello": ["Hey there, I'm a chatbot! How can I help you today?", "Hi there!", "What's up?", "How's it going?"],
 "how are you": ["I'm doing good, what about you?", "All good, and you?", "Doing great! How are you doing?"],
 "good": ["That's good!", "Nice!", "That's cool!"],
 "bad": ["Uh oh!", "Oh no!", "Oof...", "Oops!"],
 "bye": ["Alright, talk to you later!", "Okay, see you!", "Bye bye!", "See you later, alligator!"]
 
 
 */
