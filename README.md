FoodSnap is a simple, intuitive iOS application that uses machine learning to recognize food items from photos and provide useful information like food names, nutritional facts, or recipe suggestions.

This app is designed for users who want to quickly identify what's on their plate — whether they're tracking meals, learning new foods, or venturing on their fitness journey. 


Features include: 
- Take a picture using your camera or select from your photo library
- Use Core ML and Vision to analyze the image and detect the most likely food item
- Display the classification result with confidence
- Lightweight, fast, and privacy-conscious (runs on-device)


FoodSnap integrates Apple’s CoreML and Vision frameworks using the `MobileNetV2` model to classify images. Once a user selects a photo, the app processes the image through the ML model and returns the top food prediction.

Some of the future ideas I have with improving the features of this app include:
- Connect to an API to fetch nutritional facts
- Save a history of scanned items
- Offer dietary suggestions based on detected food
