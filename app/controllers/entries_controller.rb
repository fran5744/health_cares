class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.all
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    @entry = Entry.new(user_id: session[:user_id])
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries
  # POST /entries.json
  def create
    params[:entry][:day] = params[:day]
    cal_check = { "ヨガ" => 100, "ランニング" => 240, "ウォーキング" => 60, "サイクリング" => 160, "縄跳び" => 300, "入浴" => 87, "掃除" => 100, "足踏み" => 80, "TV体操" => 120, "バレー" => 120, "テニス" => 210, "水泳" => 180, "バドミントン" => 200, "ゴルフ" => 100 }
    cal_check_time = { "30分" => 1, "1時間" => 2, "1時間30分" => 3, "2時間" => 4, "2時間30分" => 5, "3時間" => 6}
    if params[:entry][:ex_type_1].present?
      params[:entry][:ex_amount_1] = cal_check[params[:entry][:ex_type_1]] * cal_check_time[params[:entry][:ex_time_1]]
    end
    if params[:entry][:ex_type_2].present?
      params[:entry][:ex_amount_2] = cal_check[params[:entry][:ex_type_2]] * cal_check_time[params[:entry][:ex_time_2]]
    end
    if params[:entry][:ex_type_3].present?
      params[:entry][:ex_amount_3] = cal_check[params[:entry][:ex_type_3]] * cal_check_time[params[:entry][:ex_time_3]]
    end

    @entry = Entry.new(entry_params)
    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    params[:entry][:day] = params[:day]
    cal_check = { "ヨガ" => 100, "ランニング" => 240, "ウォーキング" => 60, "サイクリング" => 160, "縄跳び" => 300, "入浴" => 87, "掃除" => 100, "足踏み" => 80, "TV体操" => 120, "バレー" => 120, "テニス" => 210, "水泳" => 180, "バドミントン" => 200, "ゴルフ" => 100 }
    cal_check_time = { "30分" => 1, "1時間" => 2, "1時間30分" => 3, "2時間" => 4, "2時間30分" => 5, "3時間" => 6}
    if params[:entry][:ex_type_1].present?
      params[:entry][:ex_amount_1] = cal_check[params[:entry][:ex_type_1]] * cal_check_time[params[:entry][:ex_time_1]]
    end
    if params[:entry][:ex_type_2].present?
      params[:entry][:ex_amount_2] = cal_check[params[:entry][:ex_type_2]] * cal_check_time[params[:entry][:ex_time_2]]
    end
    if params[:entry][:ex_type_3].present?
      params[:entry][:ex_amount_3] = cal_check[params[:entry][:ex_type_3]] * cal_check_time[params[:entry][:ex_time_3]]
    end

    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def serect_date_entry
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entry_params
      params.require(:entry).permit(:user_id, :weight, :height, :ex_type_1, :ex_time_1, :ex_amount_1, :ex_type_2, :ex_time_2, :ex_amount_2, :ex_type_3, :ex_time_3, :ex_amount_3, :meal_asa, :meal_hiru, :meal_ban, :snack, :snack_memo, :condition, :day, :memo)
    end
end
