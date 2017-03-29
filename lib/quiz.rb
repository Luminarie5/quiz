# ruby_version: 2.3.3
# encoding: utf-8
class Quiz
  attr_reader :right_answers, :tasks

  def initialize(tasks)
    @right_answers = 0
    @tasks = tasks
  end

  # create questions list from xml
  def self.prepare(doc)
    hash = {}
    tasks = doc.root.elements.collect('question') do |question|
      hash[:min] = question.attributes['minutes']
      hash[:text] = question.text('text')
      hash[:variants] = question.elements.collect('variants/variant') do |var|
        hash[:right_answer] = var.text if var.attributes['right']
        var.text
      end
      Task.new(hash)
    end
    new(tasks)
  end

  def start
    @tasks.each do |task|
      task.ask
      @right_answers += task.check(task.answer)
    end
  end
end
