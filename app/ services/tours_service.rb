require 'pry'
class ToursService
  def get_tours(properties)
    list_tours = Tour.all
    list_tours = list_tours.where(kind: properties[:kind]) unless properties[:kind] == 'все'
    if properties[:commit]
      list_tours = list_tours.where(country: properties[:country]) unless properties[:country].empty?
      list_tours = list_tours.where(city: properties[:city]) unless properties[:city].empty?
      list_tours = list_tours.where(transport: properties[:transport]) unless properties[:transport] == 'Любой'
      list_tours = list_tours.where(food: properties[:food]) unless properties[:food] == 'Не имеет значения'

      unless properties[:min_price] == '0' || properties[:max_price] == '0'
        list_tours = list_tours.where(price: (properties[:min_price].to_i..properties[:max_price].to_i))
      end

      unless properties[:max_nights] == '0' || properties[:min_nights] == '0'
        list_tours = list_tours.where(nights: (properties[:min_nights].to_i..properties[:max_nights].to_i))
      end
      list_tours = list_tours.where(stars: get_stars(properties[:stars_arr])) if properties[:stars_arr].values.include?('1')
      list_tours = get_sorted_list(list_tours, properties[:sort])
    end
    list_tours
  end

  private

  def get_sorted_list(list, parametr)
    case parametr
    when 'Новые'
      list.order(created_at: :desc)
    when 'Дешевые'
      list.order(:price)
    when 'Дорогие'
      list.order(price: :desc)
    else
      list
    end
  end

  def get_stars(stars_arr)
    result = []
    stars_arr.each do |key, value|
      result << key.to_i if value == '1'
    end
    result
  end
end
