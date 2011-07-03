class DownloadsController < ApplicationController
  include AuthenticatedSystem

  def showing_image
    prepare_store_asset    
    send_file "#{RAILS_ROOT}/public#{@file.public_filename(params[:type_image])}"
  end
  
  private
  def prepare_store_asset
    case params[:klass]
    when "GaleryFile"
      @file = GaleryFile.find(params[:id])
    end
  end

end
