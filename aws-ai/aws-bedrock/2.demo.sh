aws bedrock-runtime converse \
--model-id arn:aws:bedrock:ap-south-1:172586632398:inference-profile/apac.anthropic.claude-3-7-sonnet-20250219-v1:0 \
--messages '[{"role":"user","content":[{"text":""}]}]' \
--inference-config '{"maxTokens":2048,"stopSequences":[],"temperature":1,"topP":0.999}' \
--additional-model-request-fields '{"top_k":250}' \
--region ap-south-1

