SNS_STACK_NAME="simple-sns-stack"
SNS_TEMPLATE_FILE="sns-stack.yml"

BOT_STACK_NAME="simple-chatbot-stack"
BOT_TEMPLATE_FILE="chatbot-stack.yml"

REGION="ap-southeast-1"

SLACK_CHANNEL_ID=?
SLACK_WORKSPACE_ID=?

.PHONY: deploy-sns
deploy-sns:
	@aws cloudformation deploy \
		--template-file $(SNS_TEMPLATE_FILE) \
		--stack-name $(SNS_STACK_NAME) \
		--region $(REGION) \
		--capabilities CAPABILITY_NAMED_IAM
	@echo "CloudFormation stack '$(SNS_STACK_NAME)' deployed successfully."

.PHONY: destroy-sns
destroy-sns:
	@aws cloudformation delete-stack --stack-name $(SNS_STACK_NAME) --region $(REGION)
	@echo "Initiating deletion of CloudFormation stack '$(SNS_STACK_NAME)'"


.PHONY: deploy-bot
deploy-bot:
	@aws cloudformation deploy \
		--template-file $(BOT_TEMPLATE_FILE) \
		--stack-name $(BOT_STACK_NAME) \
		--region $(REGION) \
		--capabilities CAPABILITY_NAMED_IAM	\
		--parameter-overrides SlackChannelId=$(SLACK_CHANNEL_ID) SlackWorkspaceId=$(SLACK_WORKSPACE_ID)
	@echo "CloudFormation stack '$(BOT_STACK_NAME)' deployed successfully."

.PHONY: destroy-bot
destroy-bot:
	@aws cloudformation delete-stack --stack-name $(BOT_TEMPLATE_FILE) --region $(REGION)
	@echo "Initiating deletion of CloudFormation stack '$(BOT_TEMPLATE_FILE)'"