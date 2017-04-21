module Ctx
  # A Context is a simple struct generic that is instantiated with a type
  # and defines a method #match?, taking a block that returns a bool.
  # In practice you instance as many Context as you need with Discord payload types
  # and pass them to CtxBox's event handlers that wrap Dicord::Client's own event
  # handlers.
  struct Context(T)
    def initialize(&block : T -> Bool)
      @block = block
    end

    # Check if a payload type lazily satisfies
    # all of our conditions
    def match?(payload : T)
      @block.call payload
    end

    # Defines a "shortcut" method to a certain data type
    macro shortcut(name, typ)
      def self.{{name}}(&block : {{typ}} -> Bool)
        Context({{typ}}).new &block
      end
    end
  end
end
