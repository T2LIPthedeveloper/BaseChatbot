//
//  ContentView.swift
//  BaseChatbot
//
//  Created by Atul Parida on 07/05/23.
//

// THIS IS FOR THE BAD APP (STARTER APP)
import SwiftUI

struct ContentView: View {
    @State private var messageText = ""
    // the text currently inside our box
    @State var messages: [String] = ["[BOT]Welcome to the chatbot!"]
    // the list of all messages in our chat
    @State private var isFoodDiscussion: Bool = false
    
    
    var body: some View {
        VStack {
            //Our app header and probably an icon.
            HStack {
                Text("Chatbot")
                    .font(.largeTitle)
                    .bold()
                Image(systemName: "bubble.right.fill")
                    .foregroundColor(.blue)
                    .font(.system(size: 28))
            }
            
            
            //This is where our messages go!
            ScrollView {
                // We're going to go through the list of all messages and show them on the screen.
                ForEach(messages, id: \.self) { message in
                    if message.contains("USER") {
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        HStack {
                            Spacer()
                            Text(newMessage)
                                .padding()
                                .foregroundColor(.white)
                                .background(.blue.opacity(0.85))
                                .cornerRadius(20)
                                .padding(.horizontal)
                                .padding(.bottom)
                        }
                    }
                    else {
                        let newMessage = message
                            .replacingOccurrences(of: "[BOT]", with: "")
                            .replacingOccurrences(of: "[FOOD]", with: "")
                            .replacingOccurrences(of: "[DONE]", with: "")
                        HStack {
                            Text(newMessage)
                                .padding()
                                .foregroundColor(.black)
                                .background(.gray.opacity(0.15))
                                .cornerRadius(20)
                                .padding(.horizontal)
                                .padding(.bottom)
                            Spacer()
                        }
                    }
                    
                }.rotationEffect(.degrees(180))
            }.rotationEffect(.degrees(180))
            // rotates the text boxes inside, brings them to the bottom of the screen
            
            // Our text message box and send button
            HStack {
                TextField("Type something!", text: $messageText)
                    .padding()
                    .background(.gray.opacity(0.1))
                    .cornerRadius(10)
                    .onSubmit {
                        // This is what happens when the text gets submitted!
                        sendMessage(message: messageText)
                    }
                Button {
                    // sends a message to the chatbot
                    sendMessage(message: messageText)
                } label: {
                    Image(systemName: "paperplane.fill")
                        .font(.system(size: 35))
                        .padding()
                    // This acts as your send button
                }
            }
            .padding()
        }
    }
    
    func sendMessage(message: String) {
        if !message.isEmpty {
            //if the message is empty, we don't respond.
            withAnimation {
                messages.append("[USER]" + message) //adds a message to the list of messages
                self.messageText = "" //resets the message box
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                // 1 second delay until the message gets sent, you don't need to worry about this for now.
                withAnimation {
                    if isFoodDiscussion == false {
                        let botResponse = "[BOT]" + getBotResponse(message: message, messageList: messages)
                        messages.append(botResponse)
                        if botResponse.contains("[FOOD]") {
                            isFoodDiscussion = true
                        }
                    }
                    else {
                        let botResponse = "[BOT]" + getFoodResponse(message: message, messageList: messages)
                        messages.append(botResponse)
                        if botResponse.contains("[DONE]") {
                            isFoodDiscussion = false
                        }
                    }
                    //adds a bot message to the list of messages
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 if message.contains("[USER]") {
     let newMessage = message .replacingOccurrences(of: "[USER]", with: "") //removes the [USER] tag from user messages
     
     //UI for user message bubble
     HStack {
         Spacer()
         //The spacer here takes up all the space before the message, pushing it to the right.
         Text(newMessage)
             .padding()
             .foregroundColor(.white)
             .background(.blue.opacity(0.8))
             .cornerRadius(10)
             .padding(.horizontal, 16)
             .padding(.bottom, 10)
     }
     
 }
 else {
     //UI for bot message bubble
     HStack {
         Text(message)
             .padding()
             .foregroundColor(.black)
             .background(.gray.opacity(0.15))
             .cornerRadius(10)
             .padding(.horizontal, 16)
             .padding(.bottom, 10)
         Spacer()
         //The spacer here takes up all the space after the message, pushing it to the left.
     }
 }
 
 withAnimation {
     messages.append("[USER]" + message) //adds a message to the list of messages
     self.messageText = "" //resets the message box
 }
 
 DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
     // 1 second delay until the message gets sent, you don't need to worry about this for now.
     withAnimation {
         messages.append(getBotResponse(message: message))
         //adds a bot message to the list of messages
     }
 }
 
 */
