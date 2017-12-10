class LogoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  attr_reader :height, :width

  before :cache, :save_dimensions

  storage :file

  def store_dir
    "uploads/teams/#{model.id}"
  end

  process resize_to_limit: [1000, 1000]

  version :thumb do
    process resize_to_fill: [200, 200]
  end

  def extension_whitelist
    %w(jpg jpeg png)
  end

  def content_type_whitelist
    /image\//
  end

  def filename
    'logo.jpg' if original_filename
  end

  def size_range
    2_048...6_291_456
  end

  private

  def save_dimensions file
    return true unless version_name.blank?
    if file.path.nil?
      img = CarrierWave::MiniMagick::Image::read(file.file)
      @width = img[:width]
      @height = img[:height]
    else
      @width, @height = `identify -format "%wx %h" #{file.path}`.split(/x/)
        .map{|dim| dim.to_i }
    end
  end
end
