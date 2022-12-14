
#!/bin/bash
#author Oliver
#since 2020-09-03 15:24:31
now=$(date "+%Y-%m-%d")

git remote rm origin
#replace your git location
git remote add origin 'https://github.com/540765/flutter_app.git'
git pull remote master
git add .
git commit -m $now
git push origin master --force
if [ "$?" = "0" ]
then
  echo -e "\033[42;34m push to github success! \033[0m"
else
   echo -e "\033[41;30m push to github fail! \033[0m"
   exit 1
