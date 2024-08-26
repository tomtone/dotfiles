#!/bin/bash

# Umbenennen von .gitconfig in .gitconfig.local, falls die Datei existiert
if [ -f ".gitconfig" ]; then
    mv .gitconfig .gitconfig.local
    echo ".gitconfig wurde in .gitconfig.local umbenannt."
else
    echo ".gitconfig nicht gefunden. Überspringen des Umbenennens."
fi

# Umbenennen von .gitconfig.sample in .gitconfig
if [ -f ".gitconfig.sample" ]; then
    mv .gitconfig.sample .gitconfig
    echo ".gitconfig.sample wurde in .gitconfig umbenannt."
else
    echo ".gitconfig.sample nicht gefunden. Überspringen des Umbenennens."
fi

# Alle Shell-Skripte im Verzeichnis gitscripts ausführbar machen
if [ -d "gitscripts" ]; then
    chmod +x gitscripts/*.sh
    echo "Alle Shell-Skripte im Ordner gitscripts wurden ausführbar gemacht."
else
    echo "Der Ordner gitscripts wurde nicht gefunden."
fi
