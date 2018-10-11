class Factory
  def self.new(*args, &block)
    Class.new do
      args.each do |arg|
        attr_accessor arg
      end

      class_eval &block if block_given?

      define_method :initialize do |*elements|
        elements.each_with_index do |el, index|
          instance_variable_set("@#{args[index]}".to_sym, el)
        end
      end

      def [](arg)
        if (arg.is_a? String) || (arg.is_a? Symbol)
          instance_variable_get "@#{arg}"
        elsif arg.is_a? Integer
          instance_variables[arg]
        end
      end
    end
  end
end

Animal = Factory.new(:name, :gender)
dog = Animal.new('Rex', 'Male')
p dog.name
p dog.gender
