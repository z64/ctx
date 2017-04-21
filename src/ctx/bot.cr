require "discordcr"

module Ctx
  # A bot class that is initialized the same way as Discord::Client (it inherits from it).
  # Each of Discord::Client's #on_{{event_type}} handlers are available
  # here, but not prefixed with `#on_` (i.e., `client.on_message_create` is `#message_create`)
  # These wrapped handlers take a tuple of an arbitrary number of Context.
  # The block passed to the wrapped handlers will only be run if all of the supplied Context
  # return true.
  class Bot < Discord::Client
    # Creates methods for handling discord events and calling
    # a proc based on certain lazily evaulated conditions, called Contexts.
    # It defines two overloaded methods, one that takes tuple, and another
    # that takes an array of Context to use where convenient.
    macro context_event(event, type)
      def {{event}}(*contexts : Context({{type}}), &block : {{type}} ->)
        on_{{event}} do |payload|
          pass = contexts.map { |ctx| ctx.match? payload }.all?
          block.call(payload) if pass
        end
      end

      def {{event}}(contexts : Array(Context({{type}})), &block : {{type}} ->)
        on_{{event}} do |payload|
          pass = contexts.map { |ctx| ctx.match? payload }.all?
          block.call(payload) if pass
        end
      end
    end

    # Sets up a basic "command" context event. The command checks that the
    # payload message content starts with the command name, and yields the remaining
    # content to the command's block. You can optionally supply additional
    # Context in an array to lazily check for other conditions before executing
    # a command.
    def command(name, conditions = [] of Context(Discord::Message), &block : Discord::Message, String ->)
      prefix = Context(Discord::Message).new { |m| m.content.starts_with? name }
      conditions << prefix

      self.message_create(conditions) do |payload|
        args = payload.content.delete(name).strip
        block.call(payload, args)
      end
    end
  end
end
