# coding: UTF-8
module Helper
  def companies_select(name, selected)
    "<select name = '#{name}'>" +
      Company.find_all(@db).map do |c|
        if c[:id].to_i == selected.to_i
          "<option value = '#{c[:id]}' selected>#{c[:name]}</option>"
        else
          "<option value = '#{c[:id]}'>#{c[:name]}</option>"
        end
      end.join("\n") +
      "</select>"
  end

def terminals_select(name, selected)
    "<select name = '#{name}'>" +
      Terminal.find_all(@db).map do |c|
        if c[:id].to_i == selected.to_i
          "<option value = '#{c[:id]}' selected>#{c[:name]}</option>"
        else
          "<option value = '#{c[:id]}'>#{c[:name]}</option>"
        end
      end.join("\n") +
      "</select>"
  end



def checkindesks_select(name, selected)
    "<select name = '#{name}'>" +
      CheckInDesk.find_all(@db).map do |c|
        if c[:id].to_i == selected.to_i
          "<option value = '#{c[:id]}' selected>#{c[:name]}</option>"
        else
          "<option value = '#{c[:id]}'>#{c[:name]}</option>"
        end
      end.join("\n") +
      "</select>"
  end


  def is_departure_select(name, selected = true)
    options = {:true => 'отлетающий', :false => 'прилетающий'}
    "<select name = '#{name}'>" +
      options.map do |k, v|
        "<option value = '#{k}'#{k.to_s == selected.to_s ? ' selected' : ''}>#{v}</option>"
      end.join("\n") + 
      "</select>"
    end


def terminals_puts(selected)
      Terminal.find_all(@db).map do |c|
        if c[:id].to_i == selected.to_i
          return "#{c[:name]}"
        end
      end
    end

def checkindesks_puts(selected)
      CheckInDesk.find_all(@db).map do |c|
        if c[:id].to_i == selected.to_i
          return "#{c[:name]}"
        end
      end
    end


  
 def status_select(name, selected = true)
    options = {'1' => 'рейс отложен', '2' => 'рейс отменен','3' => 'рейс на посадочной полосе','4' => 'рейс взлетел','5' => 'рейс сел','6' => 'идет посадка на рейс','7' => 'рейс запланирован'}
    "<select name = '#{name}'>" +
      options.map do |k, v|
        "<option value = '#{k}'#{k.to_s == selected.to_s ? ' selected' : ''}>#{v}</option>"
      end.join("\n") + 
      "</select>"
  end
  
  def post_select(name, selected = true)
    o = {
      '1'=>'пилот',
      '2'=>'стюард',
      '3'=>'танк',
      '4'=>'второй пилот'
    }
    "<select name = '#{name}'>" +
      o.map do |k, v|
        "<option value = '#{k}'#{k.to_s == selected.to_s ? ' selected' : ''}>#{v}</option>"
      end.join("\n") + 
    "</select>"
  end

  def crews_select(name, selected = true)
    "<select name = '#{name}'>" +
      Crews.find_all(@db).map do |c|
        if c[:id].to_i == selected.to_i
          "<option value = '#{c[:id]}' selected>#{c[:name]}</option>"
        else
          "<option value = '#{c[:id]}'>#{c[:name]}</option>"
        end
      end.join("\n") +
      "</select>"
  end
  
  def crews_puts(selected)
    Crews.find_all(@db).map do |c|
      if c[:id].to_i == selected.to_i
        return "#{c[:name]}"
      end
    end
  end
  
  def crew_update(crew_id, arrival_date, arrival_place)
    query = ["UPDATE crews SET available_at = '#{arrival_date}', location = '#{arrival_place}' WHERE crews.id = '#{crew_id}'"]
    @db.select_one(*query)
  end
  
  def crew_available_for_flight(crew_id, departure_date, departure_place)
    query = ["SELECT available_at, location FROM crews WHERE crews.id = '#{crew_id}'"]
    r = @db.select_one(*query)
    return true if r[0].nil?
    a = DateTime.parse(departure_date)
    r[0] <= a and departure_place == r[1] ? true : false
  end
  
end
