class DemoController < ApplicationController

  layout 'application'
  
  def index
    render('index')
  end

  def hello
    @id = params['id']
    @page = params[:page]
    @a = params[:a]
    render('hello')
  end

  def other_hello
    redirect_to(:controller => 'demo', :action => 'index')
  end

  def google
    redirect_to('http://google.co.in')
  end

  def escape_output
  end

end
