class GaleryFile < Asset

  has_attachment :content_type => :image,
    :storage     => :file_system,
    :path_prefix => 'public/attachments/picture',
    :max_size    => 10.megabytes,
    :size        => 0.kilobytes..10000.kilobytes,
    :thumbnails  => { :thumb => '192x170!', :thumb2 => '540x540' }
  validates_as_attachment

  def watermark_image

    dst = Magick::Image.read("#{RAILS_ROOT}/public#{self.public_filename(:thumb)}").first
    dst2= Magick::Image.read("#{RAILS_ROOT}/public#{self.public_filename(:thumb2)}").first
    src = Magick::Image.read("#{RAILS_ROOT}/public/images/logo.jpg").first
    src2 = Magick::Image.read("#{RAILS_ROOT}/public/images/logo.jpg").first
		src.resize_to_fit!(192,100)
		#src.resize(0.01)
    result = dst.composite(src, Magick::SouthEastGravity , Magick::OverCompositeOp)
    result.write("#{RAILS_ROOT}/public#{self.public_filename(:thumb)}")
    result2 = dst2.composite(src2, Magick::SouthEastGravity , Magick::OverCompositeOp)
    result2.write("#{RAILS_ROOT}/public#{self.public_filename(:thumb2)}")
  end

end

