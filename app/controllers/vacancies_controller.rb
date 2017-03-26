class VacanciesController < ApplicationController
  def index
  	@vacancies = Vacancy.order('created_at DESC')
  	if params[:search]
	    @vacancies = Vacancy.search(params[:search]).order("created_at DESC")
	  else
	    @vacancies = Vacancy.all.order("created_at DESC")
	  end
  end

  def new
  	@vacancy = Vacancy.new
  end

  def create
  	@vacancy = Vacancy.new(vacancy_params)
  	if @vacancy.save
  		redirect_to @vacancy
  	else
  		flash.now[:alert] = "Error saving vacancy!"
  		render :new
  	end
  end

  def edit
  	@vacancy = Vacancy.find(params[:id])
  end

  def update
  	@vacancy = Vacancy.find_by_id(params[:id])
  	if @vacancy.update_attributes(vacancy_params)
  		flash.now[:notice] = "Successfully updated #{@vacancy.title} vacancy!"
  		redirect_to vacancy_path(@vacancy)
  	else
  		flash.now[:alert] = "Error updating vacancy!"
  		render :edit
  	end
  end

  def show
  	@vacancy = Vacancy.find(params[:id])
  	@random_vacancies = Vacancy.where.not(id: @vacancy.id).order('RANDOM()').limit(3)
  end

  def destroy
  	if @vacancy.destroy
  		flash.now[:notice] = "Deleted vacancy!"
  		redirect_to vacancies_path
  	else
  		flash.now[:alert] = "Error!"
  	end
  end

  private

  def vacancy_params
  	params.require(:vacancy).permit(:title, :location, :desc, :responsibilities, :requirements, :additional_requirements)
  end
end
