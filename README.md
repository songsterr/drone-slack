# Drone 0.5 plugin for Slack notifications

## Usage:

Creaate inventory `ansible/production` and playbook `ansible/playbook.yml`

Put following lines in your .drone.yml

    pipeline:
      notify:
        image: songsterr/drone-slack
      build:
        ....
      notify:
        image: songsterr/drone-slack
        when:
          status: [ success, failure ]

Set slack Incoming Webhook URL for notifications
 
    $ export DRONE_SERVER=https://ci.terra.songsterr.com
    $ export DRONE_TOKEN=<GET YOUR TOKEN AT https://ci.terra.songsterr.com/account>
    $ drone org secret add --skip-verify=true --image='songsterr/drone-slack' songsterr PLUGIN_SLACK_WEBHOOK_URL https://hooks.slack.com/services/....
