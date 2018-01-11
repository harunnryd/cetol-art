class AttachmentValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present?
      record.errors.add(attribute, "should be less than 500kb") if value.size > 0.5.megabytes
    end
  end
end
