require 'rails_helper'
require 'capybara/rails'

feature 'Tasks' do

  scenario 'User must add a description to their task' do
    user = create_user email: "user@example.com"
    TaskList.create!(name: "Work List")

    login(user)
    click_on "+ Add Task", match: :first
    two_days_from_now = 3.days.from_now.to_date
    select two_days_from_now.strftime("%Y"), from: "task_due_date_1i"
    select two_days_from_now.strftime("%B"), from: "task_due_date_2i"
    select two_days_from_now.strftime("%-d"), from: "task_due_date_3i"
    click_on "Create Task"

    expect(page).to have_content("Your task could not be created")
  end

end