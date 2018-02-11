cd /Users/martin/source/lab-guide1/
hugo
rsync -aPv /Users/martin/source/lab-guide1/public/   /Users/martin/source/nutanix-lab.github.io/
cd  /Users/martin/source/nutanix-lab.github.io/
git add .
git commit -m "add 2 bps"
git push
