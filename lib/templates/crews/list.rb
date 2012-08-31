# coding: UTF-8
count = 0
"
<table class = 'list'>
  <caption>
    Список летных экипажей <br>
    <a href = 'aero.rb?controller=#{@controller}&action=edit'>Создать новую запись</a>
  </caption>
  <thead>
    <tr>
      <th>
        Название экипажа
      </th>
      <th>
        Экипаж свободен с
      </th>
      <th>
        Экипаж находится в городе
      </th>
    </tr>
  </thead>
  <tbody>
  <tbody>
" + @items.map do |i|
      count += 1
"
    <tr class = 'list#{count % 2}'>
      <td>#{i[:name]}</tdi>
      <td>#{i[:available_at]}</td>
      <td>#{i[:location]}</td>
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