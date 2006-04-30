class ContentsController < ApplicationController
  layout 'pages'
  before_filter :load_pages

def new
  @ct = params[:content_type]
  @content = eval("#{@ct}.new")
  @page = Page.find(params[:id])
  @content.page = @page
end

def up
  @content = Content.find(params[:id])
  @content.move_higher
  flash[:notice] = "Content upped"
  redirect_to :controller => 'pages', :action => 'show', :id => @content.page  
end

def down
  @content = Content.find(params[:id])
  @content.move_lower
  flash[:notice] = "Content downed"
  redirect_to :controller => 'pages', :action => 'show', :id => @content.page  
end

def create
  @ct = params[:content_type]
  @content = eval("#{@ct}").new(params[:content])
  @page = Page.find(params[:id])
  @content.page = @page
  if @content.save
    flash[:notice] = "Content saved."
    redirect_to :controller => 'pages', :action => 'show', :id => @page
  end
end


  private
  def load_pages
    @sidebar_pages = Page.find(:all, :conditions => 'parent_id IS NULL', :order => 'weight')
  end

end
