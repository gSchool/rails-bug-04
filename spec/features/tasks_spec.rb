require 'rails_helper'
require 'capybara/rails'

feature 'Tasks' do

  scenario 'User can view tasks' do
    user = create_user email: "user@example.com"
    TaskList.create!(name: "Work List")

    login(user)
    click_on "+ Add Task", match: :first
    fill_in "Description", with: "Something important"
    click_on "Create Task"

    expect(page).to have_content("Something important")
    expect(page).to have_content("Task was created successfully!")
  end

end