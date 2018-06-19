var soundObject = null;
var parent = null;

function PlayText() {
    if (soundObject !== null) {
        parent = document.getElementById("divAudio");
        parent.removeChild(soundObject);
        soundObject.removed = true;
        soundObject = null;
    }
    parent = document.getElementById("divAudio");
    parent.setAttribute("style", "padding-top: 20px; overflow: hidden; min-width: 425px;");

    soundObject = document.createElement("embed");
    soundObject.setAttribute("src", "sounds/index.mp3");
    soundObject.setAttribute("style", "overflown: hidden; background-color: #303030;");
    soundObject.setAttribute("autostart", true);
    parent.appendChild(soundObject);
} 