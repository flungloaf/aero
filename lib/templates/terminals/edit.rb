# coding: UTF-8
"
<form name = 'aero' action = 'aero.rb' method = 'post'>
<input type = 'hidden' name = 'controller' value = 'Terminals'>
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
      <th>Название:</th>
      <td><input type = 'text' name = 'item[name]' value = '#{@item[:name]}' size='60'></td>
    </tr>
    <tr>
      <th>Автобус:</th>
      <td>Нужен<input type = 'radio' name = 'item[needs_bus]' value = 'true' #{@item[:needs_bus] == "true" ? "checked" : ""}>
          Не нужен<input type = 'radio' name = 'item[needs_bus]' value = 'false' #{@item[:needs_bus] != "true" ? "checked" : ""}></td>
      
    </tr>
<tr>
      <th>Описание:</th>
      <td><textarea name = 'item[description]' cols='60' rows='4'>#{@item[:description]}</textarea></td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <th colspan = '2'>
        <input type = 'submit' value = 'Внести изменения'>
        <input type = 'button' value = 'Назад к списку'
               onclick = 'javascript:document.location=\"aero.rb?controller=Terminals&action=list\"'>
      </th>
    </tr>
  </tfoot>
</table>
"
