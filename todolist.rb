# This file defines the Task class and the user input methods for the To Do List CLI.

# This class defines the TaskList class and methods the Task class
class TaskList
  attr_accessor :tasks

  def initialize
    @tasks = []
  end

  def remove(input_number)
    remove_item = @tasks.find { |task| task.number == input_number }
    if remove_item
      puts 'item has been removed'
      @tasks.delete(remove_item)
    else
      puts 'Task not found.'
    end
  end

  def done(input_number)
    find_item = @tasks.find { |task| task.number == input_number }
    if find_item
      puts 'Task marked as done.'
      find_item.status = 'done'
    else
      puts 'No task found.'
    end
  end

  # This class defines the methods of the Task class
  class Task
    attr_accessor :status, :description, :number

    def add(tasks)
      @number = if tasks.count.zero?
                  1
                else
                  tasks.last.number + 1
                end
      tasks << self
    end
  end
end

def help_message
  puts 'Welcome to the To-Do List CLI!'
  puts 'add - to add a task'
  puts 'remove - to remove a task. replace n with the number of the task.'
  puts 'list - to list the tasks'
  puts 'done - to mark a task as done. n is the number of the task.'
  puts 'help - to show this help message.'
end

# Start of the program.

task_list = TaskList.new
help_message

loop do
  user_input = gets.chomp
  case user_input
  when 'add'
    new_task = TaskList::Task.new
    new_task.add(task_list.tasks)
    puts 'what is the task?'
    input_description = gets.chomp
    new_task.description = input_description
  when 'remove'
    puts 'Which task do you want to remove?'
    user_input = gets.chomp
    remove_task_int = user_input.to_i
    task_list.remove(remove_task_int)
  when 'list'
    task_list.tasks.each do |task|
      puts "#{task.number}. [#{task.status}] #{task.description}"
    end
  when 'done'
    puts 'Which task is complete?'
    user_input = gets.chomp
    task_status_int = user_input.to_i
    task_list.done(task_status_int)
  else
    puts "Unknown command. Try 'add', or 'help'."
  end
end
