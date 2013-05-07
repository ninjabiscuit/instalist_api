class ApplicationDecorator

  def self.decorate(object, decorator_class)
    decorator_class.new(object)
  end

  def self.decorate_collection(object, decorator_class)
    CollectionDecorator.new(object, decorator_class)
  end

  def self.has_decorator_for?(resource, format)
    true if decorator_class_for(resource, format)
  end

  def self.decorator_for(resource, format)
    if decorator_class = decorator_class_for(resource, format)
      decorate_method = collection?(resource) ? "decorate_collection" : "decorate"
      send(decorate_method, resource, decorator_class)
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