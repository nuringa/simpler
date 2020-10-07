require 'logger'

class SimplerLogger

  def initialize(app)
    @logger = Logger.new('log/app.log')
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    @logger.info(log(env, status, headers))

    [status, headers, response]
  end

  private

  def log(env, status, headers)
    "\nRequest: #{env['REQUEST_METHOD']} #{env['REQUEST_URI']}\n" \
    "Handler: #{env['simpler.controller'].class}##{env['simpler.action']}\n" \
    "Parameters: #{env['simpler.params']}\n" \
    "Response: #{status} #{headers['Content-Type']} #{env['simpler.render_view']}\n" \
  end
end
