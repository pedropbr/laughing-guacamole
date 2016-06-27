# Copy static site
CWD=`pwd`

# Clone Pages repo
cd /tmp
git clone git@github.com:pedropbr/laughing-guacamole build
cd build && git checkout -b gh-pages origin/gh-pages

# Trigger Jekyll rebuild
cd $CWD
bundle exec jekyll contentful
bundle exec jekyll build

# Push newly built repo
cp -r $CWD/_site/* /tmp/build

cd /tmp/build

git config --global user.email "pedropbr@gmail.com"
git config --global user.name "pedropbr"

git add .
git commit -m "Automated Rebuild"
git push -f origin gh-pages