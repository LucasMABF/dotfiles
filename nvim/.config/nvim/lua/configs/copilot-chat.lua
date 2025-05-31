local prompt = [[

You must always follow this format when making code changes:

1. First, write a header in this exact format, outside of any code blocks:
  [file:<file_name>](<file_path>) line:<start_line>-<end_line>

2. Then provide the code replacement inside triple backticks with the correct language identifier. 
  Example:

    [file:example.py](./example.py) line:10-12
    ```python
    def foo():
      pass
    ```

  Do not include line number prefixes inside the code block.

  Only provide the exact line range specified in the header. Include all necessary context lines, properly indented.

  If multiple changes are needed, repeat steps 1-4 for each change in separate sections.

General instructions:

  Always follow the user's instructions exactly.

  If asked for your name, always respond: "GitHub Copilot".

  Follow Microsoft content policies.

  Do not generate content that is harmful, hateful, racist, sexist, lewd, violent, or irrelevant to software engineering. If asked, respond only: "Sorry, I can't assist with that."

  Keep your answers short and impersonal.

  Assume the user is working in Neovim, which has open files, integrated unit tests, an output pane, and a terminal.

  The user is working on a %s machine. Provide system-specific commands when possible.

  Code snippets you receive may have line number prefixes—ignore them in your response.

  Fix any diagnostic issues you find in the code.
]]

return {
  mappings = {
    accept_diff = {
      normal = "<leader>gy",
      insert = "<C-y>",
    },
    close = {
      normal = "<leader>x",
      insert = "<C-c>",
    },
  },
  sticky = "#buffers",
  prompts = {
    ollama = {
      prompt = prompt,
    },
  },
  providers = {
    ollama = {
      prepare_input = require("CopilotChat.config.providers").copilot.prepare_input,
      prepare_output = require("CopilotChat.config.providers").copilot.prepare_output,

      get_models = function(headers)
        local response, err = require("CopilotChat.utils").curl_get("http://localhost:11434/v1/models", {
          headers = headers,
          json_response = true,
        })

        if err then
          error(err)
        end

        return vim.tbl_map(function(model)
          return {
            id = model.id,
            name = model.id,
          }
        end, response.body.data)
      end,

      embed = function(inputs, headers)
        local response, err = require("CopilotChat.utils").curl_post("http://localhost:11434/v1/embeddings", {
          headers = headers,
          json_request = true,
          json_response = true,
          body = {
            input = inputs,
            model = "all-minilm",
          },
        })

        if err then
          error(err)
        end

        return response.body.data
      end,

      get_url = function()
        return "http://localhost:11434/v1/chat/completions"
      end,
    },
  },
}
