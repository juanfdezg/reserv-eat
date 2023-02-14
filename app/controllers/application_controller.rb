# frozen_string_literal: true

# Controller for Application
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
end
