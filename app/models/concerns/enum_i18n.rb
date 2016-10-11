module Enum_I18n
  extend ActiveSupport::Concern

  module ClassMethods
    def human_enum_name(enum_name, enum_value)
      enum_i18n_string = "activerecord.attributes.#{model_name.i18n_key}.#{enum_name.to_s.pluralize}.#{enum_value}"
      I18n.exists?(enum_i18n_string) ? I18n.t( enum_i18n_string ) : enum_value.to_s
    end
  end


end