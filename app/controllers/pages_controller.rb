class PagesController < ApplicationController

  respond_to :html, :js

  def index
    @oauthurl = "#{Rails.application.config.slc_base_url}/oauth/authorize?client_id=#{Rails.application.config.slc_client_id}&redirect_uri=#{Rails.application.config.base_url}/callback"
  end

  def about
  end

  def callback
    oauthurl = "#{Rails.application.config.slc_base_url}/oauth/token?code=#{params['code']}&grant_type=authorization_code&client_id=#{Rails.application.config.slc_client_id}&client_secret=#{Rails.application.config.slc_client_secret}&redirect_uri=#{Rails.application.config.base_url}/callback"
    respon = RestClient.get(oauthurl, Rails.application.config.slc_header) {|resp, req, res| JSON.parse(resp)}
    token = respon["access_token"]
    session[:token] = token
    redirect_to students_url
  end

  def contact
    @form = params[:cform] || []
    if(!@form.empty?) 
      if(@form[:name].blank? or @form[:email].blank? or @form[:subject].blank? or @form[:message].blank?)
        flash[:notice] = "Kindly fill in all the fields."
      else
        ContactMailer.send_contact(@form).deliver
        flash[:notice] = "Thank you for your message."
      end
    end
  end

  def verify
    if APP_CONFIG[:BETA_CODE].member? params[:code].to_s.downcase
      session[:code] = params[:code].to_s.downcase
      redirect_to root_url
    end
  end

end
