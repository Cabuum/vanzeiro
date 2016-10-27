class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  def store_dir
    "vanzeiro/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fill: [69, 69]
  end

  version :thumb2x do
    process resize_to_fill: [312, 312]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
   end

  def filename
    "file.#{file.extension}" if file
  end
end
