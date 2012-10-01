class StudentsController < ApplicationController
    respond_to :html, :js

  def index
    #TODO: Abstract to model
    #@students = Student.stu_list
    @url = Rails.application.config.slc_base_url + "/rest/v1/students"
    #Rails.logger.debug @url.inspect
    @students = RestClient.get(@url, Rails.application.config.slc_header) {|resp, req, res| JSON.parse(resp)}
    @students.map {|s| s["name"]["firstName"] + " " + s["name"]["lastSurname"] }
    # @students = Student.all.sort_by {|s| s.gpa}
    @groups = Group.all
    while (@groups.count < 3) do
      @groups << Group.create({:name => "GROUP #{@groups.count + 1}"})
    end
    @groups = @groups.first(3)
    #@students = Student.fixedlist
    #@group = params[:groupno].blank? ? nil : params[:groupno].strip
    #@criteria = params[:criteria].blank? ? nil : params[:criteria].strip
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end
end
