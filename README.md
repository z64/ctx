# ctx

TODO: Write a description here

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  ctx:
    github: z64/ctx
```

## Usage

```crystal
require "ctx"

# Create a new client
client = Ctx::Bot.new(
  token: "Bot ...",
  client_id: 213450769276338177_u64
)

# Instance a context to use with arbitrary MESSAGE_CREATE events
owner   = Ctx::Context.message_create { |m| m.author.id == 120571255635181568 }
content = Ctx::Context.message_create { |m| m.content.includes? "new fone" }

# Create the handler that matches both contexts
client.message_create(owner, content) do |payload|
  client.create_message(payload.channel_id, "who dis?")
end

# A basic "command" method is provided to create a handler that matches
# a message starting with the command name. The rest of the message
# is also yielded to the block (not including the command string)
# This will work as:
#   <z64> .add 2 3 1
#   <bot> 6
client.command(".add") do |payload, args|
  numbers = args.split(" ").map(&.to_i32)
  answer = numbers.reduce { |memo, e| memo + e }
  client.create_message(payload.channel_id, answer.to_s)
end

# A ping command that only the owner can use.
client.command(".ping", [owner]) do |payload|
  client.create_message(payload.channel_id, "dong!")
end

client.run
```

## Contributing

1. Fork it ( https://github.com/z64/ctx/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [z64](https://github.com/z64) Zac Nowicki - creator, maintainer
