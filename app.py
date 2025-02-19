from flask import Flask, jsonify

app = Flask(__name__)

# Fake relaxation music data
songs = [
    {"id": 1, "title": "Calm Waves", "artist": "Zen Sounds", "duration": "5:32", "album": "Nature Therapy"},
    {"id": 2, "title": "Peaceful Mind", "artist": "Relaxing Vibes", "duration": "4:45", "album": "Tranquility"},
    {"id": 3, "title": "Soothing Rain", "artist": "Rain Sounds", "duration": "6:10", "album": "Sleep Well"},
    {"id": 4, "title": "Meditation Bliss", "artist": "Mindful Melodies", "duration": "7:20", "album": "Inner Peace"},
    {"id": 5, "title": "Ocean Breeze", "artist": "Serene Waves", "duration": "5:50", "album": "Beach Therapy"}
]

# Home Route
@app.route("/")
def home():
    return "🎵 AudioPlayer API is working!"

# Get all songs
@app.route("/songs", methods=["GET"])
def get_songs():
    return jsonify(songs)

# Get a specific song by ID
@app.route("/song/<int:song_id>", methods=["GET"])
def get_song(song_id):
    song = next((song for song in songs if song["id"] == song_id), None)
    if song:
        return jsonify(song)
    return jsonify({"error": "Song not found"}), 404

if __name__ == "__main__":
    app.run(debug=True)
