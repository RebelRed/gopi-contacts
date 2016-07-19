class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  
  def destorys
    @person = Person.find(params[:id])
    if delete
     end 
  end
  # GET /people
  # GET /people.json
  def index
    @people = Person.all
    @person = Person.new
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = Person.find(params[:id])
    render :json => {success: "true", person: @person} and return
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    #respond_to do |format|
      if @person.save
        puts @person.inspect
        render :json => {success: "true", person: @person} and return
        #format.html { redirect_to @person, notice: 'Person was successfully created.' }
        #format.json { render :show, status: :created, location: @person }
      #else
        #format.html { render :new }
        #format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    #end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    @person = Person.find(params[:id])
    #respond_to do |format|
      if @person.update(person_params)
        render :json => {success: "true"} 
        #format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        #format.json { render :show, status: :ok, location: @person }
      #else
        #format.html { render :edit }
        #format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    #end
  end
  

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    # respond_to do |format|
    #   format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
    render :json => {success: "true"} and return
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:first_name, :last_name)
    end
end
