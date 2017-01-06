function get_total(ths, promo, promo_detail){
	var total = 0;
	var item_price = $(ths).parents("tr").find("span.item_price").html();
	var qty = $(ths).val();
	if (!qty)
		$(ths).val(0);

	total = (parseInt($(ths).val()) * parseFloat(item_price))
	get_total_promo(ths, promo, promo_detail, qty)
}

function get_total_promo(ths, promo, promo_detail, qty){
	$.ajax({
		url: "/promos/"+promo+"/get_promo_by_qty",
		data: {qty: qty, promo_detail: promo_detail},
		beforeSend: function(res){},
		success: function(res){
			//calculate quantity * item_price per row
			$(ths).parents("tr").find("span.total").html(res)
			var total_per_row = []
			$(".total").map(function(i){ total_per_row.push(parseFloat($(this).html())) })
			var grand_total = total_per_row.reduce(function(a, b) { return a + b; }, 0)
			$(".grand_total").html(grand_total)
		}
	})
}