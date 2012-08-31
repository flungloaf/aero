# coding: UTF-8
count = 0
"
<table class = 'list'>
  <caption>
    Список сотрудников
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
      <td>#{i[:age]}</td>
      <td>#{i.post}</td>
      <td>#{i[:crew]}</td>
    </tr>
"
end.join("\n") + "
  </tbody>
</table>
"