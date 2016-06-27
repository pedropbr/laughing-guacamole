# Copy static site
CWD=`pwd`

# Clone Pages repo
cd /tmp
git clone laughing-guacamole build
cd build && git checkout -b gh-pages # If not using master

# Trigger Jekyll rebuild
cd $CWD
bundle exec jekyll contentful --rebuild

# Push newly built repo
cp -r $CWD/_build/* /tmp/build

cd /tmp/build

git config --global user.email "pedropbr@gmail.com"
git config --global user.name "pedropbr"

git add .
git commit -m "Automated Rebuild"
git push -f origin gh-pages