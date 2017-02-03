class SectionsControllerController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in

  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(:visible => false)
    @section_count = Section.count + 1
    @pages = Page.sorted
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = 'Section created successfully'
      redirect_to(sections_controller_index_path)
    else
      @section_count = Section.count + 1
      @pages = Page.sorted
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
    @section_count = Section.count
    @pages = Page.sorted
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "#{@section.name} updated successfully"
      redirect_to(sections_controller_path(@section))
    else
      @section_count = Section.count
      @pages = Page.sorted
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "#{@section.name} destroyed successfully."
    redirect_to(sections_controller_index_path)
  end

  private
  def section_params
    params.require(:section).permit(:name, :page_id, :position, :visible, :content_type, :content)
  end

end
