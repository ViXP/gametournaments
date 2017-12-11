class ImageSizeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return true unless value.present? && value.cached?
    image = record.method(attribute.to_sym).call
    possible_checks.each do |check|
      if options.key?(check[:opt]) && !image.method(check[:fld]).call
        .send(check[:func], options[check[:opt]])
        record.errors[attribute] << check[:msg] % options[check[:opt]]
      end
    end
  end

  private

  def possible_checks
    [
      { opt: :width, fld: :width, func: :'==', msg: 'width must be %dpx.' },
      { opt: :height, fld: :height, func: :'==', msg: 'height must be %dpx.' },
      { opt: :max_width, fld: :width, func: :'<=', msg: 'width is > %dpx.' },
      { opt: :max_height, fld: :height, func: :'<=', msg: 'height is > %dpx.' },
      { opt: :min_width, fld: :width, func: :'>=', msg: 'width is < %d px.' },
      { opt: :min_height, fld: :height, func: :'>=', msg: 'height is < %d px.' }
    ]
  end
end
