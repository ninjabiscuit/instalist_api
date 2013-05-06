class API_V1::ListDecorator < ApplicationDecorator

  decorates :list

  def to_json(options)
    {
      id: list.id,
      name: list.name
    }.to_json(options)
  end

end