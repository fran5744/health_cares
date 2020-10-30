class HomeController < ApplicationController
  def top
    @today = Date.today
    week = ['日','月','火','水','木','金','土']
    @yobi = week[@today.wday]
    entries = Entry.where(user_id: ":user_id")


    @data = []
    entries.each do |entry|
      @data << [entry.day, entry.weight]
    end
  end

  def calendar_index
  end
end
