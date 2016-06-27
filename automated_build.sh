# Copy static site
CWD=`pwd`

# Clone Pages repo
cd /tmp
git clone master build
# cd build && git checkout -b YOUR_BRANCH origin/YOUR_BRANCH # If not using master

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
git push -f origin gh_pages