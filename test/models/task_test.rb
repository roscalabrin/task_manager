require_relative '../test_helper'

class TaskTest < Minitest::Test

  def test_assign_attributes_correctly
    task = Task.new({"id" => "11", "title" => "Write tests", "description" => "To test application functionality"})

    assert_equal "11", task.id
    assert_equal "Write tests", task.title
    assert_equal "To test application functionality", task.description
  end

end
