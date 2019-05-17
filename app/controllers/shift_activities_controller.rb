class ShiftActivitiesController < ApplicationController
  before_action :shift_activity, except: [:index, :new, :create]
  def index
    @shift_activities = shift.shift_activities
    respond_to do |format|
      format.html
    end
  end

  def index
    @shift_activities = shift.shift_activities
    render json: blueprint(@shift_activities)
  end

  def create
    @shift_activity = shift.shift_activities.new shift_activity_params
    if shift_activity.save
      render json: blueprint(shift_activity)
    else
      render_record_invalid(shift_activity)
    end
  end

  def update
    if shift_activity.update(shift_activity_params)
      render json: blueprint(shift_activity)
    else
      render_record_invalid(shift_activity)
    end
  end

  def show
    render json: blueprint(shift_activity)
  end

  def destroy
    shift_activity.destroy
    render json: blueprint(shift_activity)
  end

  # def create
  #   @shift_activity = shift.shift_activities.new shift_activity_params
  #   if shift_activity.save
  #     redirect_to shift_shift_activities_path(shift)
  #   else
  #     render 'new'
  #   end
  # end
  #
  # def update
  #   if @shift_activity.update(shift_activity_params)
  #     redirect_to shift_shift_activities_path(@shift_activity.shift)
  #   else
  #     render 'edit'
  #   end
  # end
  #
  # def show; end
  #
  # def destroy
  #   @shift_activity.destroy
  #   redirect_to shift_shift_activities_path(@shift_activity.shift)
  # end

  private

  def shift
    @shift ||= Shift.find(params[:shift_id])
  end

  def shift_activity
    @shift_activity ||= ShiftActivity.find(params[:id])
  end

  def shift_activity_params
    params.require(:shift_activity).permit(:date, :amount, :remarks, :shift_id,
      :shift_activity_type)
  end
end
