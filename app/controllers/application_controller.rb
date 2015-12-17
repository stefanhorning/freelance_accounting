class ApplicationController < ActionController::Base
  protect_from_forgery
#  force_ssl

  rescue_from CanCan::AccessDenied do |exception|
      flash[:error] = exception.message
      redirect_to request.referrer
  end

  rescue_from Mongoid::Errors::DocumentNotFound, :with => :render_404

  def render_404
    respond_to do |format|
      format.html { render :action => "../errors/404.html.haml", :status => 404 }
      # and so on..
    end
  end

end
