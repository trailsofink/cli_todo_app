# tests/test_todolist.rb

require 'minitest/autorun'
require_relative '../todolist'

# This class defines the TaskList class and methods the Task class
class TestTaskList < Minitest::Test
  def setup
    @task_list = TaskList.new
    @task1 = TaskList::Task.new
    @task1.description = 'This is a test Task.'
    @task1.add(@task_list.tasks)

    @task2 = TaskList::Task.new
    @task2.description = 'This is a second test task.'
    @task2.add(@task_list.tasks)
  end

  def initialize_task_list
    assert_equal 2, @task_list.tasks.size
  end

  def test_add_tasks
    task3 = TaskList::Task.new
    task3.description = 'Another task.'
    task3.add(@task_list.tasks)
    assert_equal 3, @task_list.tasks.size
    task = @task_list.tasks.find { |t| t.number == 3 }
    assert_equal 3, task.number
  end

  def remove_valid_task
    assert_equal 2, @task_list.tasks.size
    @task_list.remove(1)
    assert_equal 1, @task_list.tasks.size
    task = @task_list.tasks.find { |t| t.number == 2 }
    assert_equal 'done', task.status
  end

  def remove_invalid_task
    assert_equal 2, @task_list.tasks.size
    @task_list.remove(99)
    assert_equal 2, @task_list.tasks.size
  end

  def status_done
    @task_list.done(1)
    assert_equal 'done', @task_list.tasks.task1.status == 'done'
  end
end
