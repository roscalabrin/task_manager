require_relative '../test_helper'

class UserSeesTasksTest < FeatureTest

  def test_user_sees_index_of_tasks
    task1 = task_manager.create(title: "Coding is Cool", description: "I Know It's Cool")
    task2 = task_manager.create(title: "Learn Capybara", description: "Swim in Hottub to James Brown")
    # As a user
    # When I visit the tasks index
    # Then I should see a list of my tasks titles

    visit "/tasks"
    #Then I should see a list of my tasks
    # binding.pry
    save_and_open_page
    within("#task_list") do
    assert page.has_content?("Coding is Cool")
    assert page.has_content?("Learn Capybara")
    end
  end

end
