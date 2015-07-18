class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:login]

  def about
  end

  def login
  end
end
