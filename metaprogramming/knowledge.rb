class Object
  def attribute(argument, &block)

    if argument.class == Hash
      attribute = argument.keys.first
      value = argument.values.first
    else
      attribute = argument
      value = if block
        block
      else
        nil
      end
    end

    class_eval do

      attr_writer attribute

      define_method(attribute) do
        unless instance_variable_get("@#{attribute}")
          default_value = if value.class == Proc
            instance_eval(&value)
          else
            value
          end
          instance_variable_set("@#{attribute}", default_value)
        end
        instance_variable_get("@#{attribute}")
      end

      define_method("#{attribute}?") do
        if instance_variable_get("@#{attribute}")
          true
        else
          false
        end
      end
    end
  end
end
