# Sentiment Analysis App

This repository contains a sentiment analysis application, consisting of a back-end API written in Python with Flask and a front-end built using Flutter.

## Overview

The application takes a user-inputted sentence or phrase and returns its sentiment as either positive, negative, or neutral. It utilizes the NLTK library to preprocess the text and analyze its sentiment using the VADER sentiment analysis tool.

### Features

- **Text Preprocessing**: Removing punctuation, converting to lowercase, and filtering out stopwords.
- **Sentiment Analysis**: Analyzing sentiment using VADER (Valence Aware Dictionary and sEntiment Reasoner).

## Installation and Running

### Back-end

#### Dependencies

- Flask
- NLTK

1. Install the required packages:
   ```bash
   pip install -r requirements.txt
   ```

2. Run the Flask app:
   ```bash
   python sentiment_app.py
   ```

### Front-end

#### Dependencies

- Flutter SDK

1. Navigate to the Flutter app directory and run:
   
   ```bash
   flutter pub get
   flutter run
   ```

## Deployment

The back-end is deployed on Heroku, and you can push updates using:
```bash
git push heroku main
```

## Contributions

Feel free to contribute to this project by submitting issues, pull requests, or suggestions for improvements.
