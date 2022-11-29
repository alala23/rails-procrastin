class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :text, :openai]

  def home
  end

  def text
    @ldm = Ldm.new(content: "Lorem ipsum dolor sit amet, consectet")
  end

  def openai
  end
end
