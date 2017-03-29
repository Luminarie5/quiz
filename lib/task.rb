# ruby_version: 2.3.3
# encoding: utf-8
class Task
  attr_reader :min, :text, :right_answer, :variants

  def initialize(hash)
    @variants = hash[:variants]
    @min = hash[:min].to_i
    @text = hash[:text]
    @right_answer = hash[:right_answer]
  end

  def ask
    puts text
    @variants.each_with_index { |var, i| puts "#{i + 1}. #{var}" }
    @time = Time.now
  end

  def answer
    answer_index = 0
    loop do
      puts 'Для ответа используйте цифры от 1 до 4'
      answer_index = STDIN.gets.to_i
      if (1..4).cover?(answer_index)
        break
      end
    end
    answer_index
  end

  def check(answer_index)
    abort('Слишком долго думайте!!!') if (Time.now - @time) > min * 60
    right_answer_index = @variants.index(@right_answer) + 1
    if answer_index == right_answer_index
      puts "В яблочко! Вы ответили верно.\n\n"
      1
    else
      puts "Неверно! А правильно было так: #{@right_answer}\n\n"
      0
    end
  end
end
