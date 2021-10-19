require 'rails_helper'

RSpec.describe User, type: :model do
    it { should validate_presence_of (:first_name)}
    it { should validate_presence_of (:last_name)}
    it { should validate_presence_of (:email)}
    it { should validate_presence_of (:status)}
    it { should validate_presence_of (:created_at)}
    #validates :first_name, presence: true
    #validates :last_name, presence: true
    #validates :email, presence: true
    #validates :status, presence: true
    #validates :created_at, presence: true
    #it checks if this 5 things are present in the model
end
