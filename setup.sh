#!/bin/bash

# Verzeichnis, in dem das Skript ausgeführt wird (dotfiles-Ordner)
DOTFILES_DIR=$(pwd)

# Elternverzeichnis des dotfiles-Ordners
PARENT_DIR=$(dirname "$DOTFILES_DIR")

# Umbenennen von .gitconfig im Elternverzeichnis in .gitconfig.local, falls die Datei existiert
if [ -f "$PARENT_DIR/.gitconfig" ]; then
    mv "$PARENT_DIR/.gitconfig" "$PARENT_DIR/.gitconfig.local"
    echo ".gitconfig wurde in .gitconfig.local im Elternverzeichnis umbenannt."
else
    echo ".gitconfig im Elternverzeichnis nicht gefunden. Überspringen des Umbenennens."
fi

# Erstellen eines Symlinks von der .gitconfig im dotfiles-Ordner ins Elternverzeichnis
if [ -f "$DOTFILES_DIR/.gitconfig" ]; then
    ln -s "$DOTFILES_DIR/.gitconfig" "$PARENT_DIR/.gitconfig"
    echo "Ein Symlink für .gitconfig wurde im Elternverzeichnis erstellt."
else
    echo ".gitconfig im dotfiles-Ordner nicht gefunden. Symlink wird nicht erstellt."
fi

# Alle Shell-Skripte im Verzeichnis gitscripts ausführbar machen
if [ -d "$DOTFILES_DIR/gitscripts" ]; then
    chmod +x "$DOTFILES_DIR/gitscripts"/*.sh
    echo "Alle Shell-Skripte im Ordner gitscripts wurden ausführbar gemacht."
else
    echo "Der Ordner gitscripts wurde nicht gefunden."
fi
