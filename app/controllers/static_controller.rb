class StaticController < ApplicationController

  def hello
    render :file => 'static/hello.html.erb'
  end

end
