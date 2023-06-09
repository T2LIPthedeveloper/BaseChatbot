# BaseChatbot
Repository for chatbot application for a Swift workshop for Singaporean JC/Polytechnic students by the SUTD Swift Coding Interest Group, in collaboration with DaVinci@SUTD.

## Brief
The repository contains different versions of the chatbot. This was intended to help the students learn about Apple design principles and general accessibility tools in Xcode, while also improving the semantics of their chatbot.

The multiple versions are as follows:
<ol>
  <li> **Starter Chatbot:** This contains a very rudimentary user interface with a small header, a ScrollView containing message texts, and a basic textbox at the bottom. The intention of this version was to show an app that is designed badly but is still functional.</li>
  <li> **Basic UI:** This contains the same backend code as the initial chatbot, but improves the user interface by introducing a more readable colour palette, padding and margin, as well as contrasting background colours.</li>
  <li> **Improved Backend:** In the previous iterations of the application, the backend contained a single possible response for a given keyword. This iteration provides randomised responses from a list corresponding to a given keyword. This allows more variation in conversation, making it more engaging for the user.</li>
  <li> **Intention and Conversation Flow:** There was no room for conversation flow or topical conversation in the prior iterations. In this iteration, we took the example of a food kiosk at our university to help users find food of their preference, with keywords corresponding to flavours. This engages students and helps them learn to design chatbots with purpose, designing their product around the problem for which it was intended.</li>
  <li> **External API Inclusion:** The bot response flow and conversation flow was modified to support the inclusion of the OpenAI ChatGPT API. This was implemented using the OpenAISwift library and provided the students information on how to access web APIs through their apps. 
</ol>

The application belongs to SUTD Swift Coding Interest Group, but the actual developers of the code were as follows:
<ul>
  <li> **Atul Parida** </li>
  <li> **Hayden Ang Wei En** </li>
</ul>

    
    
