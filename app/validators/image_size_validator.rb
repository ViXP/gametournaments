class ImageSizeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.blank?
      checks = [
        { :option => :width, 
          :field => :width, 
          :function => :'==',
          :message =>"width must be %d px."},
        { :option => :height, 
          :field => :height, 
          :function => :'==',
          :message =>"height must be %d px."},
        { :option => :max_width, 
          :field => :width, 
          :function => :'<=',
          :message =>"width must be at most %d px."},
        { :option => :max_height, 
          :field => :height, 
          :function => :'<=',
          :message =>"height must be at most %d px."},
        { :option => :min_width, 
          :field => :width, 
          :function => :'>=',
          :message =>"width must be at least %d px."},
        { :option => :min_height, 
          :field => :height, 
          :function => :'>=',
          :message =>"height must be at least %d px."},
      ]

      image = record.method(attribute.to_sym).call
      checks.each do |check|
        if options.has_key?(check[:option]) && !image.method(check[:field])
          .call.send(check[:function], options[check[:option]])
          record.errors[attribute] << check[:message] % options[check[:option]]
        end
      end
    end
  end
end