<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	function submitForm() {
		if (!$('#content').form('validate')) {
			$.messager.alert('提示', '表单还未填写完成!');
			return;
		}
		$.post("/line/add", $("#content").serialize(), function(data) {
			if (data.status == 200) {
				$.messager.alert('提示', '新增线路成功!');
				$('#lineAdd').window('close');
				$("#lineList").datagrid('reload');
				clearForm();
			} else {
				$.messager.alert('提示', '新增线路失败!');
			}
		});
	}
	function clearForm() {
		$('#content').form('reset');
	}

	$('#textdefaut1').combobox({
		url : '/busCompany/allBusCompany',
		valueField : 'companyId',
		textField : 'companyName',
		editable : false
	})
</script>
<div style="padding:10px 10px 10px 10px">
	<form id="content" method="post">
		<table cellpadding="5">
			<tr>
				<td>线路名称:</td>
				<td><input class="easyui-textbox" type="text" name="lineName"
					data-options="required:true" style="width: 280px;"></input>
				</td>
			</tr>
			<tr>
				<td>线路类型:</td>
				<td><input id="textdefaut1" name="lineType" class="easyui-combobox" data-options="
                                     method:'post',
                                     height:20,
                                     required:true"
									style="width: 200px" />
				 </td>
			</tr>
			<tr>
				<td>线路票价:</td>
				<td><input id="textdefaut2" name="linePrice" class="easyui-combobox" data-options="
                                     method:'post',
                                     height:20,
                                     required:true"
						   style="width: 200px" />
				</td>
			</tr>
			<tr>
				<td>上行下行:</td>
				<td><input id="textdefaut3" name="upDown" class="easyui-combobox" data-options="
                                     method:'post',
                                     height:20,
                                     required:true"
						   style="width: 200px" />
				</td>
			</tr>
			<tr>
				<td>上行首班车时间:</td>
				<td><input id="textdefaut4" name="upStartTime" class="easyui-combobox" data-options="
                                     method:'post',
                                     height:20,
                                     required:true"
						   style="width: 200px" />
				</td>
			</tr>
			<tr>
				<td>上行末班车时间:</td>
				<td><input id="textdefaut5" name="upOverTime" class="easyui-combobox" data-options="
                                     method:'post',
                                     height:20,
                                     required:true"
						   style="width: 200px" />
				</td>
			</tr>
			<tr>
				<td>下行首班车时间:</td>
				<td><input id="textdefaut6" name="downStartTime" class="easyui-combobox" data-options="
                                     method:'post',
                                     height:20,
                                     required:true"
						   style="width: 200px" />
				</td>
			</tr>
			<tr>
				<td>下行末班车时间:</td>
				<td><input id="textdefaut7" name="downOverTime" class="easyui-combobox" data-options="
                                     method:'post',
                                     height:20,
                                     required:true"
						   style="width: 200px" />
				</td>
			</tr>

			<tr>
				<td>线路状态:</td>
				<td><input class="easyui-radio" type="radio" name="lineStatus"
					value="1" checked="checked" /> 启用 <input class="easyui-radio"
					type="radio" name="lineStatus" value="0" /> 停用</td>
			</tr>
		</table>
	</form>
	<div style="padding:5px">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			onclick="submitForm()">提交</a> <a href="javascript:void(0)"
			class="easyui-linkbutton" onclick="clearForm()">重置</a>
	</div>
</div>