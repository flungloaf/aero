# coding: UTF-8
count = 0
"
<table class = 'list'>
  <caption>
    Список летных экипажей
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
" + @items.map do |i|
      count += 1
"
    <tr class = 'list#{count % 2}'>
      <td>#{i[:name]}</tdi>
      <td>#{i[:available_at]}</td>
      <td>#{i[:location]}</td>
    </tr>
"
end.join("\n") + "
  </tbody>
</table>
"