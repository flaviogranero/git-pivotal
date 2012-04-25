require 'git-pivotal/commands/map'
require 'git-pivotal/commands/bug'
require 'git-pivotal/commands/card'
require 'git-pivotal/commands/chore'
require 'git-pivotal/commands/feature'

module GitPivotal::Commands
  class Start
    COMMAND_MAP = Map.new.merge({
      "bug"     => Bug,
      "chore"   => Chore,
      "feature" => Feature,
      /^\d+$/   => Card
    })
    
    class << self
      def for(*args)
        identifier = args.shift
        construct_instance_for(identifier, args) || 
          raise(ArgumentError, "Unknown card identifier given: #{identifier}")
      end
      
      private
      
      def construct_instance_for(identifier, args)
        if klass=COMMAND_MAP[identifier]
          instance = klass.new(*args)
          instance.story_id = identifier if instance.respond_to?(:story_id=)
          instance
        end
      end
    end
  end

end