class PagesControllerController < ApplicationController

  layout 'admin'

  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find_by_id(params[:id])
  end

  def new
    @page = Page.new(:visible => false, :subject_id => 1)
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Subject created successfully !!"
      redirect_to(pages_controller_index_path)
    else
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page updated successfully"
      redirect_to(pages_controller_path(@page))
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "#{@page.name} destroyed successfully"
    redirect_to(pages_controller_index_path)
  end

  private
  def page_params
    params.require(:page).permit(:subject_id, :name, :permalink, :position, :visible)
  end

end
