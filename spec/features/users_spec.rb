require 'rails_helper'

RSpec.describe "Users actions", type: :feature do
  describe "/users" do
    before do
      visit '/users'
    end
    it "enters users page successfully" do
      expect(page).to have_http_status(:success)
    end
  end
  describe "/users?page=2&status=Inactive" do
    before do
      visit '/users?page=2&status=Inactive'
    end
    it "queries inactive users" do
      expect(page).to have_http_status(:success)
    end
  end
  describe "/users?page=2&status=Active" do
    before do
      visit '/users?page=2&status=Active'
    end
    it "queries active users" do
      expect(page).to have_http_status(:success)
    end
  end

  describe "/users" do
    before do
      visit '/users'
    end

    it "page should contain header" do
      expect(page).to have_content("List of Microverse Team members all over the world")
    end
  end
end
