#! /bin/bash

[[ -f .env ]] && source .env

if [ $DRUPAL_VERSION ]
then 
    echo "Start with Drupal version ${DRUPAL_VERSION}"
else
    echo "Drupal version is not defined. Set the default version to 9.0.5"
    DRUPAL_VERSION='9.0.5'
fi

mkdir drupal/web
curl -fSL "https://ftp.drupal.org/files/projects/drupal-${DRUPAL_VERSION}.tar.gz" -o drupal.tar.gz
mv drupal.tar.gz drupal/web
cd drupal/web
tar -zx --strip-components=1 -f drupal.tar.gz
rm drupal.tar.gz