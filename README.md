# Simple SNS and Chatbot CloudFormation

This project contains CloudFormation templates and a Makefile to deploy AWS SNS topics and an AWS Chatbot configuration. The Chatbot configuration is set up to forward messages from SNS topics to a Slack channel.

## Prerequisites

- AWS CLI installed and configured
- AWS CloudFormation
- Slack workspace and channel

## Files

- `sns-stack.yml`: CloudFormation template to create SNS topics.
- `chatbot-stack.yml`: CloudFormation template to create AWS Chatbot configuration and IAM role.
- `Makefile`: Makefile to deploy and manage the CloudFormation stacks.

## Makefile Targets

### `deploy-sns`

Deploys the SNS CloudFormation stack.

```sh
make deploy-sns
```

### `deploy-bot`

Deploys the AWS Chatbot CloudFormation stack.

```sh
make deploy-bot SLACK_CHANNEL_ID=? SLACK_WORKSPACE_ID=?
```
