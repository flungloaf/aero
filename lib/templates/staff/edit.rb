# coding: UTF-8
"
<form name = 'aero' action = 'aero.rb' method = 'post'>
<input type = 'hidden' name = 'controller' value = 'Staff'>
<input type = 'hidden' name = 'action' value = 'edit'>
<input type = 'hidden' name = 'is_commit' value = 'true'>
<input type = 'hidden' name = 'item[id]' value = '#{@item[:id]}'>
<table class = 'list'>
  <caption>
    #{@header}<br>
    <span style = 'color: Red;'>#{@message}</span>
  </caption>
  <thead>
  <tbody>
    <tr>
      <th>Фамилия:</th>
      <td><input type = 'text' name = 'item[last_name]' value = '#{@item[:last_name]}' size='60'></td>
    </tr>
    <tr>
      <th>Имя:</th>
      <td><input type = 'text' name = 'item[first_name]' value = '#{@item[:first_name]}' size='60'></td>
    </tr>
    <tr>
      <th>Отчество:</th>
      <td><input type = 'text' name = 'item[middle_name]' value = '#{@item[:middle_name]}' size='60'></td>
    </tr>
    <tr>
      <th>Дата рождения:</th>
      <td><input type = 'text' name = 'item[birth_date]' value = '#{@item[:birth_date]}' size='60'></td>
    </tr>
    <tr>
      <th>Должность:</th>
      <td>#{post_select('item[post]', "#{@item[:post]}")}</td>
    </tr>
    <tr>
      <th>Экипаж:</th>
      <td>#{crews_select('item[crew_id]', "#{@item[:crew_id]}")}</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <th colspan = '2'>
        <input type = 'submit' value = 'Внести изменения'>
        <input type = 'button' value = 'Назад к списку'
               onclick = 'javascript:document.location=\"aero.rb?controller=Staff&action=list\"'>
      </th>
    </tr>
  </tfoot>
</table>
"
