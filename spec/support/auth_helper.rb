# frozen_string_literal: true

require 'spec_helper'

module AuthHelper
  def login_user
    user = build(:user)
    user.save!
    sign_in user
  end
end
