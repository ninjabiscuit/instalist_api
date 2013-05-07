class API_V1::ItemDecorator < BaseDecorator

  decorates :item

  def to_json(options)
    {
      id: item.id,
      name: item.name,
      status: item.status
    }.to_json(options)
  end

end