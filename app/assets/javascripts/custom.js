function get_type_target(ths, row){
	$.ajax({
		url: "/promos/get_promo_target",
		data: {row: row, val: ths.value},
		beforeSend: function(res){},
		success: function(res){
			$(ths).parents("tr").find(".type_target").html(res)
		}
	})
}

function get_enable_disable_promo_product(ths){
	if ($(ths).is(":checked")){
		$(ths).parents("tr").find("input, select").not("input:checkbox").removeAttr("disabled")
	}else{
		$(ths).parents("tr").find("input, select").not("input:checkbox").attr("disabled", true)
	}
}