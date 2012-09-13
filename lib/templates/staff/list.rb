# coding: UTF-8
count = 0
"
<table class = 'list'>
  <caption>
    Список сотрудников <br>
    <a href = 'aero.rb?controller=#{@controller}&action=edit'>Создать новую запись</a>
  </caption>
  <thead>
    <tr>
      <th>
        Фамилия
      </th>
      <th>
        Имя
      </th>
      <th>
        Отчество
      </th>
      <th>
        Возраст
      </th>
      <th>
        Должность
      </th>
      <th>
        Команда
      </th>
      <th>
        Действия
      </th>
    </tr>
  </thead>
  <tbody>
" + @items.map do |i|
      count += 1
"
    <tr class = 'list#{count % 2}'>
      <td>#{i[:last_name]}</td>
      <td>#{i[:first_name]}</td>
      <td>#{i[:middle_name]}</td>
      <td>#{i.age}</td>
      <td>#{i.post}</td>
      <td>#{crews_puts(i[:crew_id])}</td>
      <td>
        <a href = 'aero.rb?controller=#{@controller}&action=edit&id=#{i[:id]}'>Редактировать</a>
        <a href = 'aero.rb?controller=#{@controller}&action=destroy&id=#{i[:id]}'>Удалить</a>
      </td>
    </tr>
"
end.join("\n") + "
  </tbody>
</table>
"
