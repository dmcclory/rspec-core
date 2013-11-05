require 'rspec/core/formatters/json_formatter'

class RuntimeFormatter < RSpec::Core::Formatters::JsonFormatter
  def stop
    super
    @output_hash[:examples].zip(examples).each do |hash, result|
      hash[:run_time] = result.execution_result[:run_time]
      hash[:before_run_time] = result.execution_result[:before_run_time]
      hash[:after_run_time] = result.execution_result[:after_run_time]
    end
  end
end
