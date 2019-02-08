# frozen_string_literal: true

module StoreRequestId
  # Inject BG Header and store also on StoreRequestId accessor
  class BlueGreenMiddleware
    def call(env)
      Process.new(env).call(@app)
    end

    def initialize(app)
      @app = app
    end

    # Process Environment
    class Process < SimpleDelegator
      HEADER = 'X-GS-BGEnv'.freeze
      VALUES = { 'blue' => 'blue',
                 'green' => 'green' }.freeze

      def call(app)
        StoreRequestId.blue_green = bg
        app.call(processed)
      end

      private_constant :VALUES, :HEADER

      private

      def bg
        @bg ||= VALUES.fetch(self[HEADER], 'blue')
      end

      def processed
        dup.merge(HEADER => bg)
      end
    end
  end
end
