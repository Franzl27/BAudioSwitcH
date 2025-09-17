#!/bin/bash

# Aktuelles Profil abfragen
current_profile=$(pactl list cards | grep 'Aktives Profil' | awk -F ': ' '{print $2}')

# Profile definieren
analog_profile="output:analog-stereo"
hdmi_profile="output:hdmi-stereo"

# Profil wechseln
if [[ "$current_profile" == *"$analog_profile"* ]]; then
    echo "Wechsel zu Digital Stereo (HDMI)-Ausgabe"
    pactl set-card-profile 42 $hdmi_profile
else
    echo "Wechsel zu Analog Stereo-Ausgabe"
    pactl set-card-profile 42 $analog_profile
fi
