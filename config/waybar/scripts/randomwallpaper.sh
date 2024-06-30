IMG=$(find ~/.wallpapers -type f | shuf -n 1)

CMD=$(swww img "$IMG" --transition-fps 165 --transition-type left --transition-step 20)

echo "$CMD"
