{literal}
<script language="JavaScript" src="js/calendar_eu.js"></script> 
<script language="javascript">
function runMode( accion, Id ){
  forma = document.getElementById('fresponsable');

  forma.accion.value = accion;
  forma.action = "CtrlResponsable.php";
  forma.id.value = Id;

  if (accion != "elimina" && accion != "actualiza" && accion != "buscar" && accion != "volver" ){
    if (validate_fresponsable(forma)){ forma.submit() };
  }
  else{
     if (accion == "volver"){
       forma.action = forma.referente.value;
     }
    forma.submit();
  }
  
}

function validate_fresponsable (form) {
  var alertstr = '';
  var invalid  = 0;

// snombre: standard text, hidden, password, or textarea box
  var sdescripcion = form.elements['sdescripcion'].value;
  if (sdescripcion == null || sdescripcion == "" ) {
    alertstr += '- Indique un valor válido para el campo "Descripción"\n';
    invalid++;
  }

  if (invalid > 0 || alertstr != '') {
    if (! invalid) invalid = 'Los Siguiemtes';   // catch for programmer error
    alert(''+invalid+' error(es) fueron encontrados al enviar la información:'+'\n\n'
    +alertstr+'\n'+'- Por favor corrija los campos y trate de nuevo');
    return false;
  }
  return true;  // all checked ok
}

</script>
{/literal}

{include file='encabezado.tpl'}

<LINK HREF="css/anestesia.css" REL="stylesheet" TYPE="text/css">
<link rel="stylesheet" href="calendar.css"> 
<table width="100%">
<tr>
<td class="tituloforma" align="center">{$titulo}</td>
</tr>
</table>

<FORM METHOD="post" name="fresponsable" id="fresponsable" ACTION="CtrlResponsable.php">
<fieldset style="background-color : #e3e3e3">
<legend>Datos Responsables</legend>
<table width="100%">
  <tr>
    <td width="15%"><b>Descripción:</b></td>
    <td align="left"><input type="text" name="sdescripcion" id="sdescripcion" size="60" value="{$sdescripcion}"><b>*</b></td>
  </tr>
  <tr>
    <td colspan="2"><input type="button" name="btnBuscar" id="btnBuscar" value="Buscar" onClick=" runMode('buscar','');"></td>
  </tr>
  <tr>
    <td colspan="2" align="left" ><font color="#0F305A" size="0" > (*) Estos campos son obligatorios</font></td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <input type="reset" id="btnCancelar" value="Cancelar">
      <input type="button" id="btnEnviar" onClick=" runMode('enviar', '{$id}');" value="Enviar">
      {if $referente != ''}
        <input type="button" id="btnVolver" onClick=" runMode('volver', '');" value="Volver">
      {/if}
    </td>
  </tr>
</table>
</fieldset>
<br/><br/>
<table width="75%" cellpadding="1" align="center">
  <tr class="titulodonforojo">
     <th>Num. Registro</th>
     <th>Descripción</th>
     <th></th>
     <th></th>
  </tr>
  {foreach from=$ArrResponsables key=Id item=field}
    <tr class={$field.clase}>
      <td>{$field.id}</td>
      <td>{$field.sdescripcion}</td>
      <td align="center"><a href="#" onclick="runMode( 'actualiza', {$field.id} );"><img width="15xp" heith="15xp" src="/sociproma/imagenes/b_edit.png"></a></td>
      <td align="center"><a href="javascript:if (confirm('Desea eliminar el registro'))runMode( 'elimina', {$field.id} );"><img src="/sociproma/imagenes/b_drop.png"></a></td>
    </tr>
  {/foreach}
</table>
<input type="hidden" name="accion" id="accion">
<input type="hidden" name="referente" id="referente" value="{$referente}">
<input type="hidden" name="id" id="id">
</FORM>
