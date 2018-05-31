#!/bin/sh

SLACK_COLOR=''

if [ ! -z "${SECRET_SLACK_WEBHOOK_URL}" ]
then
  if [ ! -z "${PLUGIN_START}" ]
  then
    SLACK_MESSAGE="Build of <${DRONE_COMMIT_LINK}|${DRONE_REPO_NAME}:${DRONE_BRANCH}> started"
  else

    if [ "${DRONE_BUILD_STATUS}" = "success" ]
    then
      SLACK_MESSAGE="Build of <${DRONE_COMMIT_LINK}|${DRONE_REPO_NAME}:${DRONE_BRANCH}> completed"
      SLACK_COLOR='good'
    else
      SLACK_MESSAGE="Build of <${DRONE_COMMIT_LINK}|${DRONE_REPO_NAME}:${DRONE_BRANCH}> failed"
      SLACK_COLOR='danger'
    fi

  fi
  curl -X POST --data-urlencode "payload={ 'username': 'CI', 'icon_emoji': ':drone:', 'attachments': [ { 'color': '${SLACK_COLOR}', 'text': '${SLACK_MESSAGE}', 'mrkdwn_in': ['text'], 'footer': '<${DRONE_BUILD_LINK}|build ${DRONE_BUILD_NUMBER}>'} ] }" ${SECRET_SLACK_WEBHOOK_URL}
else
  echo "There is no SECRET_SLACK_WEBHOOK_URL environment variable"
fi
