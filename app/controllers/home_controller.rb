class HomeController < ApplicationController
  def top
    @today = Date.today
    week = ['日','月','火','水','木','金','土']
    @yobi = week[@today.wday]
    entries = Entry.where(user_id: session[:user_id])
    period_h = {}
    case params[:period]
    when "week" then
      now_week = Date.today.all_week
      begin_week = Date.today.beginning_of_week
      end_week = Date.today.end_of_week
      entries = entries.where('day >= ?', "#{begin_week}")
      entries = entries.where('day <= ?', "#{end_week}")
      now_week.each do |day|
        period_h.store(day.strftime('%Y-%m-%d'), "")
      end
    when "month" then
      now_month = Date.today.all_month
      begin_month = Date.today.beginning_of_month
      end_month = Date.today.end_of_month
      entries = entries.where('day <= ?', "#{begin_month}")
      entries = entries.where('day >= ?', "#{end_month}")
      now_month.each do |day|
        period_h.store(day.strftime('%Y-%m-%d'), "")
      end
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
      period_h[entry.day.strftime('%Y-%m-%d')] = entry.weight
    end

    # ハッシュを配列に変換
    @data = period_h.to_a
    @memo = []
    entries.each do |entry|
      @memo << [entry.day,entry.memo]
    end
  end

  def calendar_index
    @entry = Entry.find_by(user_id: session[:user_id])
  end
end

