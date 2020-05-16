class WorkoutsController < ApplicationController
  before_action :find_workout, only: [:edit, :update]
  before_action :authenticate_user!

  def index
    @workouts = current_user.workouts
  end

  def new
    @workout = Workout.new
  end

  def edit
  end

  def update
    @workout.update(workout_params)
    redirect_to workout_path(@workout)
  end

  def create
    @workout = Workout.create(workout_params)
    redirect_to workout_path(@workout)
  end

  def show
    redirect_to root_path unless @workout = current_user.workouts.find(params[:id])
  end


  private

  def find_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:name, :user_id, :created_at)
  end
end
