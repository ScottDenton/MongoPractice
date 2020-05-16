class ExercisesController < ApplicationController
  before_action :find_exercise, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @exercises = current_user.exercises
  end

  def new
    @workout = Workout.find(params[:id])
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.create(exercise_params)
    redirect_to workout_path(@exercise.workout)
  end

  def show
  end

  def edit
    @workout = @exercise.workout
  end

  def update
    unless @exercise.update(exercise_params)
    end
    flash[:errors] = "Sorry something went wrong"
    redirect_to workout_path(@exercise.workout)
  end

  def destroy
    workout = @exercise.workout
    @exercise.destroy
    redirect_to workout_path(workout)
  end


  private

  def find_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:name, :weight, :reps, :sets, :workout_id, :user_id)
  end
end
