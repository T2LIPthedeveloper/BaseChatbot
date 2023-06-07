//
//  BotResponse.swift
//  BaseChatbot
//
//  Created by Atul Parida on 07/05/23.
//

import Foundation

var currMessages: [String] = []

var responseDict: [String: [String]] = [
    // This is the list of keywords and responses we want our chatbot to respond to
    // When you type something, if the bot finds a keyword from within your message, it'll respond with the first keyword it finds
    // Format: "keyword" : "Response for that keyword", separate pairs with a comma
    "hello": ["Hey there, I'm a chatbot! How can I help you today?", "Hi there!", "What's up?", "How's it going?"],
    "how are you": ["I'm doing good, what about you?", "All good, and you?", "Doing great! How are you doing?"],
    "good": ["That's good!", "Nice!", "That's cool!"],
    "bad": ["Uh oh!", "Oh no!", "Oof...", "Oops!"],
    "bye": ["Alright, talk to you later!", "Okay, see you!", "Bye bye!", "See you later, alligator!"],
    "food": ["Our canteen and some shops nearby have a lot of food options! What kind of food are you interested in having today? \n1. Spicy \n2. Sweet \n3. Hot \n4. Cold \n5. Drink"],
    "help": ["I'm a bot that gives you food options in SUTD! Feel free to chat with me and figure out what you want to eat!"]
]

var foodDict: [String: [String]] = [
    "spicy": ["Perhaps some chicken tikka from the Indian stall would suit your taste!", "Why not try some mala from the noodle stall?", "I heard the Korean stall has some great spicy stew options... give it a shot!"],
    "sweet": ["Apparently the Malay stall has some sweet stuff...", "Check out Canopy Coffee! They have some pau if you'd like.", "Check out Gom Gom! It's not in the canteen, but it's nearby and their banana bread is delicious!"],
    "hot": ["Chicken rice stall. Best option.", "Try the Taiwanese stall! Rather good options.", "Indian stall's always got something fresh cooking!", "Noodle stall. Soup. What more can I say?", "Nice, hot and tasty eggs and kaya toast. Great snack for a great day."],
    "cold": ["Canopy Coffee has a lot of cold drinks! Their iced milo and iced coffee are the most popular.", "Pick & Go at the ground floor has some nice options like ice creams!", "Consider some of the vending machines near Canopy Coffee!", "Have you tried the falooda at the Indian stall? It's a bit rare but it's tasty!"],
    "drink": ["Pick and Go is your best option, with a lot of drinks.", "Canopy Coffee is a good option! You could check out their coffees or milo options!", "Gom Gom has great options for coffee and tea lovers.", "SUTD has a lot of vending machines, maybe consider a cold drink or iced tea?"],
    "done": ["Alright, enjoy your food!"]
]


func getBotResponse(message: String, messageList: [String]) -> String {
    currMessages = messageList
    let tempMessage = message.lowercased() // converts our message to lowercase so it's easier to search
    var response: String = String() // empty response
    for key in responseDict.keys {
        if tempMessage.contains(key) {
            let randomInt = Int.random(in: 0..<(responseDict[key]?.count ?? 1))
            response = responseDict[key]?[randomInt] ?? ""
            
            if key == "food" {
                response = "[FOOD]" + response
            }
            // If there's a keyword, we find the array corresponding to the first matching one.
            // If the array within contains more than one element, we choose a random index otherwise we just choose the first thing available
            break // Stops as soon as we find the first matching keyword
        }
    }
    if response != "" {
        return response //return the response if it isn't empty
    }
    else {
        return "Oops! Sorry, I didn't get what you were saying... maybe try again?" //return the default value if it is empty
    }
}

func getFoodResponse(message: String, messageList: [String]) -> String {
    let tempMessage = message.lowercased()
    var response: String = String()
    for key in foodDict.keys {
        if tempMessage.contains(key) {
            let randomInt = Int.random(in: 0..<(foodDict[key]?.count ?? 1))
            response = foodDict[key]?[randomInt] ?? ""
            
            if key == "done" {
                response = "[DONE]" + response
            }
            
            break
        }
    }
    
    return response
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
