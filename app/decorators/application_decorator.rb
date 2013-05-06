class ApplicationDecorator

  def initialize(object)
    @object = object
  end

  def self.decorate(object, decorator_class)
    decorator = decorator_class.new(object)
    yield decorator if block_given?
    decorator
  end

  def self.decorates(name)
    define_method(name) do
      @object
    end
  end

  def self.has_decorator_for?(resource, format)
    true if decorator_class_for(resource, format)
  end

  def self.decorator_for(resource, format)
    if decorator_class = decorator_class_for(resource, format)
      decorate(resource, decorator_class)
    end
  end

  private

    # (<#Activity id: 1>, :api_v1) => API_V1::ActivityDecorator
    def self.decorator_class_for(resource, format)
      "#{format.to_s.upcase}::#{resource.class}Decorator".constantize
    rescue NameError => e
      raise if e.is_a?(NoMethodError)
      nil
    end

end