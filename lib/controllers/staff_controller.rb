# coding: UTF-8
class StaffController < Controller

  # формируем меню, для авторизованных пользователей появляется еще один пункт
  def self.actions(user)
    result = []
    unless user.nil?
      result += [[:easy_list, 'Список сотрудников'],[:list, 'Редактирование списка сотрудников']]
    end
    result
  end
  
  def is_authorized_action?()
    !([:easy_list].include?(@action))
  end

  def list()
    @items = Staff.find_all(@db)
    render_template(@action)
end

def easy_list()
    @items = Staff.find_all(@db)
    render_template(@action)
end

  def edit()
    if @cgi.params.has_key?('is_commit')
      params = filter_for_params()
      if params.has_key?('id') and params['id'][0] != ''
        @item = Staff.find_first(@db, params['id'][0])
        @header = 'Редактирование информации о сотруднике'
        @message = 'Информация о сотруднике записана'
        if @item.nil?
          @item = Staff.new
          @header = 'Внесение новой информации о сотруднике'
          @message = 'Информация о новом сотруднике внесена в БД'
        end
      else
        @item = Staff.new
        @header = 'Внесение новой информации о сотруднике'
        @message = 'Информация о новом сотруднике внесена в БД'
      end
      params.each do |k, v|
        @item[k] = v[0] if k != 'id' and v != '' and k!='code'
      end
      
      res = []
      if(params['post'][0] != 'cтюард')
        @db.select_all("SELECT * FROM staff WHERE staff.crew_id = '#{params['crew_id'][0]}' AND staff.post = '#{params['post'][0]}'") do |r|
          f = {}
          r.column_names.each do |c|
            f[c.to_sym] = r[c]
          end
          res << f
        end
      end
      
      if res.empty?
        @item.save(@db)
      else
        @message = 'Должность уже занята'
      end
    else
      if @cgi.params.has_key?('id')
        @item = Staff.find_first(@db, @cgi.params['id'][0])
        @header = 'Редактирование информации о сотруднике'
        if @item.nil?
          @item = Staff.new
          @header = 'Внесение новой информации о сотруднике'
        end
      else
        @item = Staff.new
        @header = 'Внесение новой информации о сотруднике'
      end
    end
    render_template('edit')
  end

 def destroy()
    if @cgi.params.has_key?('id') and @cgi.params['id'][0] != ''
      @item = Staff.find_first(@db, @cgi.params['id'][0])
      unless @item.nil?
        @item.destroy(@db)
        @message = 'Объект удален!'
      else
        @message = 'Объект не найден!'
      end
    end
    render_template(@action)
  end
  
end

