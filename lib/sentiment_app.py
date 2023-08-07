from flask import Flask, request, jsonify
from flask_cors import CORS  # Import CORS
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords
from nltk.sentiment.vader import SentimentIntensityAnalyzer
import nltk

nltk.download('punkt')
nltk.download('stopwords')
nltk.download('vader_lexicon')

app = Flask(__name__)
CORS(app)  # Enable CORS

def preprocess_text(text):
    text = text.replace('.', '').replace(',', '').replace('!', '').replace('?', '')
    text = text.lower()
    words = word_tokenize(text)
    stop_words = set(stopwords.words('english'))
    words = [word for word in words if word not in stop_words]
    return ' '.join(words)

def initialize_sentiment_analyzer():
    return SentimentIntensityAnalyzer()

def get_sentiment(text, analyzer):
    score = analyzer.polarity_scores(text)
    compound_score = score['compound']
    if compound_score >= 0.05:
        return 'positive'
    elif compound_score <= -0.05:
        return 'negative'
    else:
        return 'neutral'

@app.route('/analyze', methods=['POST'])
def analyze():
    user_input = request.json['text']
    preprocessed_input = preprocess_text(user_input)
    sentiment_analyzer = initialize_sentiment_analyzer()
    sentiment = get_sentiment(preprocessed_input, sentiment_analyzer)
    return jsonify({'sentiment': sentiment})

if __name__ == "__main__":
    app.run(debug=True)
