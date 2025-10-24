#!/usr/bin/env python3
import json
import boto3

def send_prompt_to_bedrock():
    # Initialize the Bedrock Runtime client
    client = boto3.client(service_name="bedrock-runtime", region_name="ap-south-1")

    # Define the prompt text
    prompt_text = "Create a story about two dogs."

    # Define the request payload
    payload = {
        "inputText": prompt_text,
        "textGenerationConfig": {
            "maxTokenCount": 4096,  # Maximum tokens to generate
            "stopSequences": [],    # No stop sequences
            "temperature": 0,       # No randomness
            "topP": 1               # Consider top 100% of probabilities
        }
    }

    # Make API request
    response = client.invoke_model(
        modelId="amazon.titan-text-lite-v1",  # Model ID
        contentType="application/json",
        accept="application/json",
        body=json.dumps(payload)  # Convert dictionary to JSON string
    )

    # Parse response
    response_body = json.loads(response["body"].read())

    return response_body  # Return the full response

# Example Usage
if __name__ == "__main__":
    result = send_prompt_to_bedrock()
    print(json.dumps(result, indent=2, sort_keys=True, ensure_ascii=False))
