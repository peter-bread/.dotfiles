# Load functions from ~/.zshrc.d/functions/
# -----------------------------------------

for file in ~/.zshrc.d/languages/*(.); do
  source "$file"
done
