Serverless API --> Choose a foundation model --> customize the model --> Recieve response in app 

Pricing:
Model inference --> Model Customisation 


Amazon Bedrock  -----Invoke Model----->  Application

We get charged for the Input and Output tokens processed.
Also we get charged for the model inference and customization 

Inference:
On-demand and Batch pricing models.
Provisioned Throughput Models.


bharathkumardasaraju@1.python$ aws bedrock list-foundation-models --by-provider amazon --query "modelSummaries[*].modelId" | jq .
[
  "amazon.titan-text-lite-v1:0:4k",
  "amazon.titan-text-lite-v1",
  "amazon.titan-text-express-v1:0:8k",
  "amazon.titan-text-express-v1",
  "amazon.titan-embed-image-v1:0",
  "amazon.titan-embed-image-v1",
  "amazon.titan-image-generator-v1:0",
  "amazon.titan-image-generator-v1",
  "amazon.titan-embed-text-v2:0",
  "amazon.nova-pro-v1:0",
  "amazon.nova-lite-v1:0",
  "amazon.nova-micro-v1:0"
]
bharathkumardasaraju@1.python$



bharathkumardasaraju@1.python$ python3.12 2.bedrock-api.py "Write a limerick about EKS nodes." amazon.titan-text-express-v1

{
  "inputTextTokenCount": 10,
  "results": [
    {
      "completionReason": "FINISH",
      "outputText": "\nThere once was a cluster of EKS nodes,\nThey were all running smoothly,\nBut then one day,\nOne of them crashed,\nAnd the whole cluster went down.",
      "tokenCount": 39
    }
  ]
}
bharathkumardasaraju@1.python$


bharathkumardasaraju@1.python$ aws bedrock list-foundation-models --by-provider amazon --query "modelSummaries[*].modelId" | jq .
[
  "amazon.titan-text-lite-v1:0:4k",
  "amazon.titan-text-lite-v1",
  "amazon.titan-text-express-v1:0:8k",
  "amazon.titan-text-express-v1",
  "amazon.titan-embed-image-v1:0",
  "amazon.titan-embed-image-v1",
  "amazon.titan-image-generator-v1:0",
  "amazon.titan-image-generator-v1",
  "amazon.titan-embed-text-v2:0",
  "amazon.nova-pro-v1:0",
  "amazon.nova-lite-v1:0",
  "amazon.nova-micro-v1:0"
]
bharathkumardasaraju@1.python$ python3.12 ./1.bedrock-api.py
{
  "inputTextTokenCount": 7,
  "results": [
    {
      "completionReason": "FINISH",
      "outputText": "\nOnce upon a time, there were two dogs named Max and Bella. They were best friends and always played together. One day, they decided to go on an adventure. They ran through the woods, swam in the river, and climbed the tallest mountain. They had so much fun that they didn't want to stop. As the sun began to set, they started to head back home. Max and Bella were tired, but they were also happy. They knew that they would always have each other to play with and that their adventure would be remembered forever.",
      "tokenCount": 115
    }
  ]
}
bharathkumardasaraju@1.python$



bharathkumardasaraju@1.python$ /usr/local/bin/python3.12 ./1.bedrock-api.py   
{
  "inputTextTokenCount": 7,
  "results": [
    {
      "completionReason": "FINISH",
      "outputText": "\nOnce upon a time, there were two dogs named Max and Bella. They were best friends and always played together. One day, they decided to go on an adventure. They ran through the woods, swam in the river, and climbed the tallest mountain. They had so much fun that they didn't want to stop. As the sun began to set, they started to head back home. Max and Bella were tired, but they were also happy. They knew that they would always have each other to play with and that their adventure would be remembered forever.",
      "tokenCount": 115
    }
  ]
}
bharathkumardasaraju@1.python$ 
