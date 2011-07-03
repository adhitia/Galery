# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def show_image_tag(image_rec, options = {}, image_type="thumb")
    if !image_rec.blank? && !image_rec.filename.blank? && File.exist?(RAILS_ROOT+"/public"+image_rec.public_filename(image_type))
      #image_tag(image_rec.public_filename(image_type), options)
      image_tag(showing_image_path(:klass=> image_rec.class.to_s, :id => image_rec.id, :type_image => image_type), options)
    else
      image_tag('avatar.png', options)
    end
  end
end
