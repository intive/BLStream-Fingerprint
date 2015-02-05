if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  echo -e "Starting to update git repo\n"

  pwd
  ls
  
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis"
  git clone --quiet https://${GH_TOKEN}@github.com/blstream/BLStream-Fingerprint.git
  
  cd BLStream-Fingerprint

  touch test.t

  git add -f .
  git commit -m "Travis build $TRAVIS_BUILD_NUMBER"
  git tag -a $TRAVIS_BUILD_NUMBER -m "Tag $TRAVIS_BUILD_NUMBER added" 
  git push origin --tags

  echo -e "Done push of new tag"
fi
