#bin/sh
AccessToken=o.mRVIgavNUHVqjLN1t0QgW0rMoQcuR6oC
TITLE=$1
BODY="DONE!!!!"

curl -u $AccessToken: https://api.pushbullet.com/v2/pushes -d type=note -d title="$TITLE" -d body="$BODY"
