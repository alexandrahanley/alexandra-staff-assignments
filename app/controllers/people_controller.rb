class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.find(params[:id])
  end


  def update
    @person = Person.find(params[:id])
    if @person.update(person_params)
      redirect_to @person, notice: 'Person was successfully updated.'
    else
      @sign_in_error = "Invalid Naming Convention"
      render :edit
    end
  end

  def create
    @person = Person.new(params.require(:person).permit(:first_name, :last_name, :title))
    if @person.save
      redirect_to root_path, notice: "Person was created!"
    else
      @sign_in_error = "Invalid Naming Convention"
      render :new
    end
  end

private

    def person_params
      params.require(:person).permit(:first_name, :last_name, :title)
    end


end
