class MeetingsController < ApplicationController
  before_action :set_meeting, only: %i[ show edit update destroy ]
  before_action :set_q, only: [:index, :search]

  # GET /meetings or /meetings.json
  def index
    
    @meetings = @q.result
    @meetings = @meetings.where(user_id: current_user.id).order(start_meeting: "DESC").page(params[:page])
  end



  # GET /meetings/1 or /meetings/1.json
  def show
    @meeting = Meeting.find(params[:id])

    @estimated = @meeting.start_meeting + @meeting.hold_time * 60
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new

  end

  # GET /meetings/1/edit
  def edit
    @meeting = Meeting.find(params[:id])
  end

  # POST /meetings or /meetings.json
  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user = current_user
    @meeting.start_meeting = Time.current
    respond_to do |format|
      if @meeting.save
        format.html { redirect_to meeting_url(@meeting), notice: "会議が正常に登録されました。" }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1 or /meetings/1.json
  def update
    @meeting.end_meeting = Time.current
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to meetings_url(@meeting), notice: "会議内容が正常に更新されました。" }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1 or /meetings/1.json
  def destroy
    @meeting.destroy

    respond_to do |format|
      format.html { redirect_to meetings_url, notice: "会議履歴が削除されました。" }
      format.json { head :no_content }
    end
  end

  def search
    @meetings = @q.result
    @meetings = @meetings.where(user_id: current_user.id)

  end

  private

  def set_q
    @q = Meeting.ransack(params[:q])
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meeting_params
      params.fetch(:meeting, {}).permit(:name, :agenda, :goal, :minutes, :status, :start_meeting, :end_meeting, :hold_time
      )
    end
end
