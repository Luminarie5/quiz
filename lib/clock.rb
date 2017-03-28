# ruby_version: 2.3.3
# encoding: utf-8
class Clock
  attr_writer :on

  def initialize(min)
    @minutes = min.to_i
    @on = false
  end

  def start
    seconds = @minutes * 60
    seconds.times do
      exit if stopped?
      sleep 1
    end
    finish
  end

  def stopped?
    @on
  end

  def finish
    Thread.abort_on_exception = true
    abort('Время истекло')
  end
end
