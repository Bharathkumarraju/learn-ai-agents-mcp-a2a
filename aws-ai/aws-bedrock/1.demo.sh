AWS AI: https://aistylist.awsplayer.com/


bharathkumardasaraju@aws-bedrock$ aws bedrock list-foundation-models --by-provider anthropic --query "modelSummaries[*].modelId" | jq .
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
bharathkumardasaraju@aws-bedrock$ aws bedrock-runtime invoke-model --model-id "anthropic.claude-3-haiku-20240307-v1:0" \
    --body '{"anthropic_version":"bedrock-2023-05-31","max_tokens":1000,"messages":[{"role":"user","content":"Write a simple python function that adds two numbers."}]}' --cli-binary-format raw-in-base64-out response.json && jq -r '.content[0].text' response.json
{
    "contentType": "application/json"
}
Here's a simple Python function that adds two numbers:

```python
def add_numbers(a, b):
    """
    Adds two numbers and returns the result.

    Args:
        a (float or int): The first number to be added.
        b (float or int): The second number to be added.

    Returns:
        float or int: The sum of the two input numbers.
    """
    return a + b
```

To use this function, you can call it with two arguments:

```python
result = add_numbers(5, 3)
print(result)  # Output: 8

result = add_numbers(2.5, 4.2)
print(result)  # Output: 6.7
```

Here's how the `add_numbers()` function works:

1. The function takes two arguments, `a` and `b`, which can be either integers or floating-point numbers.
2. Inside the function, the two numbers are added using the `+` operator, and the result is returned.
3. The function has a docstring that provides a brief description of the function, the types of arguments it expects, and the type of value it returns.

You can call this function as many times as you need, passing in different numbers each time, and it will return the sum of the two input numbers.
bharathkumardasaraju@aws-bedrock$




bharathkumardasaraju@aws-bedrock$ aws bedrock-runtime invoke-model --model-id "anthropic.claude-3-haiku-20240307-v1:0" \
    --body '{"anthropic_version":"bedrock-2023-05-31","max_tokens":1000,"messages":[{"role":"user","content":"Write a simple python function that adds n integers."}]}' --cli-binary-format raw-in-base64-out response.json && jq -r '.content[0].text' response.json
{
    "contentType": "application/json"
}
Here's a simple Python function that takes a list of integers as input and returns the sum of those integers:

```python
def add_integers(numbers):
    """
    Adds a list of integers and returns the sum.

    Args:
    numbers (list): A list of integers to be added.

    Returns:
    int: The sum of the integers in the input list.
    """
    total = 0
    for num in numbers:
        total += num
    return total
```

You can call this function like this:

```python
numbers = [1, 2, 3, 4, 5]
result = add_integers(numbers)
print(result)  # Output: 15
```

Here's how the `add_integers()` function works:

1. The function takes a list of integers called `numbers` as its input parameter.
2. It initializes a variable `total` to 0.
3. It then iterates over each number in the `numbers` list, adding it to the `total` variable.
4. Finally, it returns the `total` sum.

You can also call the function with a different list of integers:

```python
numbers = [-2, 4, 7, -1, 3]
result = add_integers(numbers)
print(result)  # Output: 11
```

This will output the sum of the integers in the new list, which is 11.
bharathkumardasaraju@aws-bedrock$


