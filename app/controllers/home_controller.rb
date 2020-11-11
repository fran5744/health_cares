class HomeController < ApplicationController
  def top
    @today = Date.today
    week = ['日','月','火','水','木','金','土']
    @yobi = week[@today.wday]
    entries = Entry.where(user_id: session[:user_id])
    logger.debug("==============")
    logger.debug(params)
    case params[:period]
    when "week" then
      entries = entries.where('day <= ?', "2020-10-31")
      entries = entries.where('day >= ?', "2020-10-25")
    when "month" then
      entries = entries.where('day <= ?', "2020-10-31")
      entries = entries.where('day >= ?', "2020-10-01")
    when "3month" then
      entries = entries.where('day <= ?', "2020-10-31")
      entries = entries.where('day >= ?', "2020-07-01")
    when "6month" then
      entries = entries.where('day <= ?', "2020-10-31")
      entries = entries.where('day >= ?', "2020-05-01")
    else
      entries = entries.where('day <= ?', "2020-10-31")
      entries = entries.where('day >= ?', "2020-10-25")
    end
    @user_id = session[:user_id]
    @authority = session[:authority]

    @data = []
    entries.each do |entry|
      @data << [entry.day, entry.weight]
    end
    @memo = []
    entries.each do |entry|
      @memo << [entry.day,entry.memo]
    end
  end

  def calendar_index
    @entry = Entry.find_by(user_id: session[:user_id])
  end
end
