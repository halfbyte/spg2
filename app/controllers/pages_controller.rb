class PagesController < ApplicationController

  layout 'pages'
  before_filter :load_pages

  def index
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @page_pages, @pages = paginate :pages, :per_page => 10
  end
 
  def show
    @page = Page.find(params[:id])
    @contents = @page.contents
  end

  def new
    @page = Page.new
    if params[:parent].to_i > -1
      @parent = Page.find(params[:parent])
      @page.parent_id = @parent.id
    else
      @page.parent_id = nil
    end

  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = 'Page was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:notice] = 'Page was successfully updated.'
      redirect_to :action => 'show', :id => @page
    else
      render :action => 'edit'
    end
  end

  def destroy
    Page.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
  
private
  def load_pages
    @sidebar_pages = Page.find(:all, :conditions => 'parent_id IS NULL', :order => 'weight')
  end

end
