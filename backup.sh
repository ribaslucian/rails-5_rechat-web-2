#!/bin/bash 

cp /home/ubuntu/rails-chat-channel/db/development.sqlite3 /home/ubuntu/rails-chat-channel/
cd /home/ubuntu/rails-chat-channel/
<<<<<<< HEAD
git add .
=======
git add development.sqlite3
>>>>>>> 7bd24b15adbc07b3204254e7e73712369fde6a66
git commit -m "backup"
git push
