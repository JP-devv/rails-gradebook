class GradesController < ApplicationController
  before_action :authenticate_user! :set_grade, only: [:show, :edit, :update, :destroy]

  # GET /grades
  def index
    if !user_signed_in?
      redirect_to user_session_path
    end
  end

  # GET /grades/1
  def show
    @grades = Grade.all
  end

  # GET /grades/new
  def new
    if current_user.account_id == 0 or current_user.account_id == 1
    @grade = Grade.new
    else
      redirect_to user_session_path 
    end
  end

  # GET /grades/1/edit
  def edit
  end

  # POST /grades
  def create
  if current_user.account_id == 0 or current_user.account_id == 1
    @grade = Grade.new(grade_params)

    if @grade.save
      redirect_to @grade, notice: 'Grade was successfully created.'
    else
      render :new
    end
  else
    redirect_to user_session_path
  end
  end

  # PATCH/PUT /grades/1
  def update
  if current_user.account_id == 0 or current_user.account_id == 1
    if @grade.update(grade_params)
      redirect_to @grade, notice: 'Grade was successfully updated.'
    else
      render :edit
    end
  else
    redirect_to user_session_path
  end
  end

  # DELETE /grades/1
  def destroy
    if current_user.account_id == 1
      @grade.destroy
      redirect_to grades_url, notice: 'Grade was successfully destroyed.'
    else
      redirect_to grades_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grade_params
      params.require(:grade).permit(:student_id, :student_name, :student_grade)
    end
end
