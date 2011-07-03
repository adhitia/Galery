class UploadController < ApplicationController
  protect_from_forgery :except => [:create]
  def create
    model = prepare_model(params[:type])
    asset = model.new(:uploaded_data => params[:uploaded_data])
    asset.content_type = File.mime_type?(params[:Filename])
    respond_to do |format| 
      if asset.save
        #format.json  {render :json => { :result => 'success', :id => asset.id, :type => type, :url_preview => showing_preview_image_url(:klass => asset.class.to_s, :id => asset)}}
        format.json  {render :json => { :result => 'success', :id => asset.id, :type => type}}
      else
        logger.info asset.errors.full_messages
        format.json  {render :json => { :result => 'failed'} } 
      end
    end 
  end

  private
  def prepare_model(type)
    asset = case type
    when 'picture'
      GaleryFile
    end
    return asset
  end
end
