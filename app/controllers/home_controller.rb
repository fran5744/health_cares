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
      entries = entries.where('day >= ?', "#{begin_month}")
      entries = entries.where('day <= ?', "#{end_month}")
      now_month.each do |day|
        period_h.store(day.strftime('%Y-%m-%d'), "")
      end
    when "3month" then
      now_threemonth = Date.today.beginning_of_month.prev_month(3)
      end_month = Date.today.end_of_month
      entries = entries.where('day >= ?', "#{now_threemonth}")
      entries = entries.where('day <= ?', "#{end_month}")
      (now_threemonth..end_month).each do |day|
        period_h.store(day.strftime('%Y-%m-%d'), "")
      end
    when "6month" then
      now_sixmonth = Date.today.beginning_of_month.prev_month(6)
      end_month = Date.today.end_of_month
      entries = entries.where('day >= ?', "#{now_sixmonth}")
      entries = entries.where('day <= ?', "#{end_month}")
      (now_sixmonth..end_month).each do |day|
        period_h.store(day.strftime('%Y-%m-%d'), "")
      end
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

    @entry_day = Entry.find_by(user_id: @user_id, day: @today)

  end

  def calendar_index
    calendar_day = params[:calendar_day]
    if calendar_day
      @entry = Entry.find_by(user_id: session[:user_id], day: calendar_day.to_date)
    else
      @entry = nil
    end
  end

  def update
    calendar_day = params[:calendar_day]
    entry = Entry.find_by(user_id: session[:user_id] , day: calendar_day.to_date)
    results = { :message => entry }
    #render partial: 'ajax_partial', locals: { :results => results }
    redirect_to home_calendar_index_path(calendar_day: params[:calendar_day])
  end
end

