class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :text, :openai]

  def home
  end

  def text
  end

  def openai
  end
end
