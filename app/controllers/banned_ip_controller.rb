class BannedIpController < ApplicationController
  before_filter :admin_only
  layout "default"
  
  def search
    if params[:user_ids]
      user_ids = params[:user_ids].scan(/\d+/)
      @results = BannedIp.search(user_ids)
    else
      @results = {}
    end
    @ip_addrs = @results.values.flatten.map {|x| x["ip_addr"]}.join(" ")
  end
  
  def index
    @banned_ips = BannedIp.all(:order => "created_at")
  end
  
  def new
    @banned_ip = BannedIp.new
  end
  
  def create
    params[:banned_ip][:ip_addr].scan(/\d+\.\d+\.\d+\.\d+/).each do |ip_addr|
      BannedIp.create(
        :creator_id => @current_user.id,
        :ip_addr => ip_addr,
        :reason => params[:banned_ip][:reason]
      )
    end
    
    flash[:notice] = "New IP ban created"
    redirect_to :action => "index"
  end
  
  def destroy
    @banned_ip = BannedIp.find(params[:id])
    @banned_ip.destroy
    flash[:notice] = "IP ban removed"
    render :update do |page|
      page.remove("banned-ip-#{@banned_ip.id}")
    end
  end
end
