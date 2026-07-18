from flask import Flask
import time
import random

app = Flask(__name__)

@app.route("/")
def home():
    return "<h1>Plateforme GitOps - Ousmane Toure</h1><p>Déploiement automatique, versionné, sécurisé et observable.</p>"

@app.route("/api/work")
def work():
    # Simule un traitement avec une opération enfant (visible dans les traces)
    time.sleep(random.uniform(0.1, 0.5))
    return {"status": "ok", "message": "Traitement effectué"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)