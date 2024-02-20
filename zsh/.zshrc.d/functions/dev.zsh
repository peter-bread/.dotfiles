dev() {
  case $1 in
    "")
      cd ~/Developer
      ;;
    a)
      cd ~/Developer/ak22112
      ;;
    p)
      cd ~/Developer/peter-bread
      ;;
    *)
      echo "Error: Invalid argument. Use 'a' or 'p'."
      ;;
  esac
}
