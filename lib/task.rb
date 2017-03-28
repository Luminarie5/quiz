# ruby_version: 2.3.3
# encoding: utf-8
class Task
  attr_reader :min, :text, :right_answer, :variants

  def initialize(hash)
    @variants = hash[:variants]
    @min = hash[:min]
    @text = hash[:text]
    @right_answer = hash[:right_answer]
    @clock = Clock.new(@min)
  end

  def ask
    puts text
    @variants.each_with_index { |variant, index| puts "#{index + 1}. #{variant}" }
  end

  def take_answer
    Thread.new { @clock.start }
    answer = STDIN.gets.chomp.encode('utf-8')
    @clock.on = true

    if right_answer == answer
      puts "В яблочко! Вы ответили верно.\n\n"
      1
    else
      puts "Неверно! А правильно было так: #{right_answer}\n\n"
      0
    end
  end
end
