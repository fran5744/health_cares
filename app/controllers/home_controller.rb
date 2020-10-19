class HomeController < ApplicationController
  def top
    @today = Date.today
    week = ['日','月','火','水','木','金','土']
    @yobi = week[@today.wday]
    @data = ['2019-06-01', 55], ['2019-06-02', 50], ['2019-06-03', 45]
  end

  def calendar_index
  end
end
