{
  "mcp": {
    "servers": {
      "memory": {
        "command": "npx",
        "args": ["-y", "@modelcontextprotocol/server-memory"],
        "env": {
          "MEMORY_FILE_PATH": "./memory.json"
        }
      },
      "context7": {
        "command": "npx", 
        "args": ["-y", "context7-mcp"],
        "env": {
          "CONTEXT7_API_KEY": "${input:context7_api_key}"
        }
      },
      "filesystem": {
        "command": "npx",
        "args": ["-y", "@modelcontextprotocol/server-filesystem", "./"],
        "env": {}
      },
      "brave_search": {
        "command": "npx",
        "args": ["-y", "@modelcontextprotocol/server-brave-search"],
        "env": {
          "BRAVE_API_KEY": "${input:brave_api_key}"
        }
      }
    },
    "inputs": [
      {
        "id": "context7_api_key",
        "description": "Context7 API Key for documentation lookup",
        "type": "promptString",
        "password": true
      },
      {
        "id": "brave_api_key", 
        "description": "Brave Search API Key for web search fallback",
        "type": "promptString",
        "password": true
      }
    ]
  }
}