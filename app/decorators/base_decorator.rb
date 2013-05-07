class BaseDecorator

  def initialize(object)
    @object = object
  end

  def self.decorates(name)
    define_method(name) do
      @object
    end
  end

end