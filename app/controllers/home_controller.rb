class HomeController < ApplicationController
  def show
    @inline_template = '<%= "Hello World" %>'
  end
end
