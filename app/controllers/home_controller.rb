class HomeController < ApplicationController
  def top
    @today = Date.today
    week = ['日','月','火','水','木','金','土']
    @yobi = week[@today.wday]
  end
end
