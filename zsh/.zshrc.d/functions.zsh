# Load functions from ~/.zshrc.d/functions/
# -----------------------------------------

for file in ~/.zshrc.d/functions/*(.); do
  source "$file"
done
