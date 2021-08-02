class UuidValidator < ActiveModel::EachValidator
  # Common regex used for UUID validation that complies with RFC 4122 specification
  UUID_REGEX = /[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}/

  def validate_each(record, attribute, value)
    return if value.blank? || uuid_valid?(value)

    record.errors.add(attribute, message: (options[:message] || 'must be a valid UUID'))
  end

  private

  def uuid_valid?(uuid)
    uuid =~ UUID_REGEX
  end
end
