#!/usr/bin/env python3
import json, boto3, sys

def bedrock_generate(prompt: str,
                     model_id: str = "amazon.titan-text-lite-v1",
                     region: str = "ap-south-1",
                     max_tokens: int = 512,
                     temperature: float = 0.0,
                     top_p: float = 1.0) -> dict:
    client = boto3.client("bedrock-runtime", region_name=region)
    payload = {
        "inputText": prompt,
        "textGenerationConfig": {
            "maxTokenCount": max_tokens,
            "stopSequences": [],
            "temperature": temperature,
            "topP": top_p
        }
    }
    resp = client.invoke_model(
        modelId=model_id,
        contentType="application/json",
        accept="application/json",
        body=json.dumps(payload)
    )
    return json.loads(resp["body"].read())

if __name__ == "__main__":
    prompt = sys.argv[1] if len(sys.argv) > 1 else "Create a story about two dogs."
    model  = sys.argv[2] if len(sys.argv) > 2 else "amazon.titan-text-lite-v1"
    result = bedrock_generate(prompt, model_id=model)
    # full pretty JSON
    print(json.dumps(result, indent=2, sort_keys=True, ensure_ascii=False))
