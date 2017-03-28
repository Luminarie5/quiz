# ruby_version: 2.3.3
# encoding: utf-8
require_relative './lib/quiz'
require_relative './lib/task.rb'
require_relative './lib/clock'
require 'rexml/document'

current_path = File.dirname(__FILE__)

file = File.new(current_path + '/data/quiz_data.xml', encoding: 'utf-8')
doc = REXML::Document.new(file)
file.close

quiz = Quiz.prepare(doc)
quiz.start

puts "#{quiz.tasks.size} вопроса и на #{quiz.right_answers} Вы ответили правильно!"
