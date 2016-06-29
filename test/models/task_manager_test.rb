require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_task
    assert_equal 0, task_manager.all.count

    task_manager.create(title: "Cook", description: "food")

    assert_equal 1, task_manager.all.count

    task = task_manager.find(task_manager.all.count)

    assert_equal "Cook", task.title
    assert_equal "food", task.description
    assert_instance_of Task, task
  end

  def test_it_finds_all_tasks
    task_manager.create(title: "Rest", description: "take a nap")
    task_manager.create(title: "Cook", description: "food")
    task_manager.create(title: "Lunch", description: "eat lunch")

    assert_equal 3, task_manager.all.count

    assert_instance_of Task, task_manager.all.first
  end

  def test_it_finds_all_task
   task_manager.create(title: "Rest", description: "take a nap")
   task_manager.create(title: "Cook", description: "food")
   task_manager.create(title: "Lunch", description: "eat lunch")

   assert_equal "Rest", task_manager.find(1).title
   assert_instance_of Task, task_manager.find(1)
  end

  def test_that_it_updates_a_task
    task_manager.create(title: "Rest", description: "take a nap")
    task_manager.create(title: "Cook", description: "food")
    task_manager.create(title: "Lunch", description: "eat lunch")

    task_manager.update(2, title: "Eat", description: "food")

    assert_equal "Eat", task_manager.find(2).title
  end

  def test_it_deletes_a_task
    task_manager.create(title: "Rest", description: "take a nap")
    task_manager.create(title: "Cook", description: "food")
    task_manager.create(title: "Lunch", description: "eat lunch")

    task_manager.destroy(2)

    assert_equal 2, task_manager.all.count
  end

end
