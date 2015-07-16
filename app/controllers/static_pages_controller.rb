class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:login]

  def about
  end

  def home
  end

  def login
  end
end
