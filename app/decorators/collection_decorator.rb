class CollectionDecorator < SimpleDelegator

  include Enumerable
  attr_reader :decorator_class

  def initialize(obj, decorator_class)
    super(obj)
    @decorator_class = decorator_class
  end

  def each
    __getobj__.each do |obj|
      yield decorator_class.new(obj)
    end
  end

  def method_missing(method, *args)
    map {|o| o.send(method, args) }
  end

end