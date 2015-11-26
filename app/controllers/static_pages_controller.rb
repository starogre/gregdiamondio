class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:login]

  def about
  end

  def login
  end

  def landing
  end

  def resume
    send_file(
      File.join(Rails.root, 'app', 'assets', 'GregoryDiamondResume.pdf')
    )
  end
end
