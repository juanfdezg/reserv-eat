# frozen_string_literal: true

# Controller for Welcome
class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index about termsofuse]
  def index
    @disable_nav = true
  end

  def about; end
  def termsofuse; end
end
