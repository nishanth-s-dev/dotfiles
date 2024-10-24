# ~/.zshrc

# Loop through each .zsh file in the ZSH_CONFIG_DIR and source it
for file in $HOME/.zsh/*.zsh; do
    if [ -f "$file" ]; then
        source "$file"
    fi
done
