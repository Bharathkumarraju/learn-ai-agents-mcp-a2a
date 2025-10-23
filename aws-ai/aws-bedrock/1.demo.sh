AWS Bedrock:
It provides an AWS API Endpoint to interact with the pre-trained Models.

serverless 
Ex: Alexa

bharathkumardasaraju@learn-ai-agents-mcp-a2a$ aws bedrock list-foundation-models --by-provider anthropic --query "modelSummaries[*].modelId" | jq .
[
  "anthropic.claude-haiku-4-5-20251001-v1:0",
  "anthropic.claude-sonnet-4-5-20250929-v1:0",
  "anthropic.claude-3-sonnet-20240229-v1:0:28k",
  "anthropic.claude-3-sonnet-20240229-v1:0",
  "anthropic.claude-3-haiku-20240307-v1:0:48k",
  "anthropic.claude-3-haiku-20240307-v1:0",
  "anthropic.claude-3-5-sonnet-20240620-v1:0",
  "anthropic.claude-3-5-sonnet-20241022-v2:0",
  "anthropic.claude-3-7-sonnet-20250219-v1:0",
  "anthropic.claude-sonnet-4-20250514-v1:0"
]
bharathkumardasaraju@learn-ai-agents-mcp-a2a$ aws bedrock-runtime invoke-model --model-id "anthropic.claude-3-haiku-20240307-v1:0" \               
    --body '{"anthropic_version":"bedrock-2023-05-31","max_tokens":1000,"messages":[{"role":"user","content":"Write a simple python function that adds n integers."}]}' --cli-binary-format raw-in-base64-out response.json && jq -r '.content[0].text' response.json
{
    "contentType": "application/json"
}
Here's a simple Python function that adds n integers:

```python
def add_numbers(*nums):
    """
    Adds any number of integers.

    Args:
        *nums (int): One or more integers to be added.

    Returns:
        int: The sum of the input integers.
    """
    total = 0
    for num in nums:
        total += num
    return total
```

Here's how the function works:

1. The function takes an arbitrary number of arguments using the `*nums` syntax. This allows the function to be called with any number of integer arguments.
2. Inside the function, we initialize a `total` variable to 0.
3. We then loop through each of the input numbers (`nums`) and add them to the `total` variable.
4. Finally, the function returns the total sum of the input numbers.

You can use this function like this:

```python
result = add_numbers(1, 2, 3)
print(result)  # Output: 6

result = add_numbers(4, 5, 6, 7, 8)
print(result)  # Output: 30
```

In the first example, we call the `add_numbers` function with three arguments (1, 2, and 3), and the function returns the sum of these numbers, which is 6.

In the second example, we call the function with five arguments (4, 5, 6, 7, and 8), and the function returns the sum of these numbers, which is 30.
bharathkumardasaraju@learn-ai-agents-mcp-a2a$ 