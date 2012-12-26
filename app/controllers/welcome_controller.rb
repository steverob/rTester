class WelcomeController < ApplicationController
  def index
    @tests=OnlineTest.all_open
  end
end
