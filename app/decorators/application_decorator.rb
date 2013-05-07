class ApplicationDecorator

  def initialize(object)
    @object = object
  end

  def self.decorate(object, decorator_class)
    decorator_class.new(object)
  end

  def self.decorate_collection(object, decorator_class, format)
    CollectionDecorator.new(object, decorator_class)
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
      if collection?(resource)
        decorate_collection(resource, decorator_class)
      else
        decorate(resource, decorator_class)
      end
    end
  end

  private

    def self.decorator_class_for(resource, format)
      resource_name = collection?(resource) ?
        resource.name.demodulize : resource.class.name
      "#{format.to_s.upcase}::#{resource_name}Decorator".constantize
    rescue NameError => e
      raise if e.is_a?(NoMethodError)
      nil
    end

    def self.collection?(object)
      object.kind_of?(ActiveRecord::Relation)
    end

end