if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  echo -e "Starting to update git repo\n"

  pwd
  ls
  
  cd $HOME
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis"
  git clone https://${GH_TOKEN}@github.com/blstream/BLStream-Fingerprint.git
  
  cd BLStream-Fingerprint

  git add generated-docs
  git commit -m "Travis build $TRAVIS_BUILD_NUMBER"
  git tag -a $TRAVIS_BUILD_NUMBER -m "Tag $TRAVIS_BUILD_NUMBER added" 
  git push origin --tags

  echo -e "Pushed new tag $TRAVIS_BUILD_NUMBER"
fi
