class API_V1::ItemDecorator < ApplicationDecorator

  decorates :item

  def to_json(options)
    {
      id: item.id,
      name: item.name,
      list_id: item.list_id,
      status: item.status
    }.to_json(options)
  end

end